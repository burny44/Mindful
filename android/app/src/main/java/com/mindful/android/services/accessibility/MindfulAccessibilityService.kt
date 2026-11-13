/*
 *
 *  *
 *  *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *  *
 *  *  * This source code is licensed under the GPL-2.0 license license found in the
 *  *  * LICENSE file in the root directory of this source tree.
 *  *
 *
 */
package com.mindful.android.services.accessibility

import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.content.SharedPreferences
import android.content.SharedPreferences.OnSharedPreferenceChangeListener
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityEvent.TYPE_VIEW_SCROLLED
import android.view.accessibility.AccessibilityEvent.TYPE_WINDOWS_CHANGED
import android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_CONTENT_CHANGED
import android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
import android.view.accessibility.AccessibilityNodeInfo
import com.mindful.android.AppConstants.FACEBOOK_PACKAGE
import com.mindful.android.AppConstants.INSTAGRAM_PACKAGE
import com.mindful.android.AppConstants.REDDIT_PACKAGE
import com.mindful.android.AppConstants.SNAPCHAT_PACKAGE
import com.mindful.android.AppConstants.YOUTUBE_PACKAGE
import com.mindful.android.enums.PlatformFeatures
import com.mindful.android.helpers.storage.SharedPrefsHelper
import com.mindful.android.models.Wellbeing
import com.mindful.android.receivers.DeviceAppsChangedReceiver
import com.mindful.android.utils.ThreadUtils
import com.mindful.android.utils.executors.Throttler
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.atomic.AtomicBoolean

/**
 * An AccessibilityService that monitors app usage and blocks access to specified content based on user settings.
 */
class MindfulAccessibilityService : AccessibilityService(), OnSharedPreferenceChangeListener {
    companion object {
        private const val TAG = "Mindful.MindfulAccessibilityService"

        const val ACTION_PERFORM_HOME_PRESS = "com.mindful.android.action.performHomePress"
        const val ACTION_MIDNIGHT_ACCESSIBILITY_RESET =
            "com.mindful.android.action.midnightAccessibilityReset"

        // Set of desired events which will be processed
        private val desiredEvents = setOf(
            TYPE_WINDOWS_CHANGED,
            TYPE_WINDOW_STATE_CHANGED,
            TYPE_VIEW_SCROLLED
        )

        /// Delay used to coalesce Instagram content-change events (trailing throttle)
        private const val INSTAGRAM_CONTENT_CHECK_DELAY_MS = 250L

        private val browserPackages = mutableSetOf<String>()
        private val shortsPlatformPackages = mutableSetOf<String>()
    }


    // Fixed thread pool for parallel event processing
    private val executorService: ExecutorService = Executors.newFixedThreadPool(4)
    private val throttler: Throttler = Throttler(500L)
    private val deviceAppsChangedReceiver: DeviceAppsChangedReceiver =
        DeviceAppsChangedReceiver(onAppsChanged = { refreshServiceConfig() })

    // Managers
    private lateinit var shortsPlatformManager: ShortsPlatformManager
    private lateinit var browserManager: BrowserManager
    private lateinit var trackingManager: TrackingManager
    private lateinit var instagramReelsLock: InstagramReelsLock

    private val mainHandler = Handler(Looper.getMainLooper())
    private val isInstagramCheckScheduled = AtomicBoolean(false)

    private var wellbeing = Wellbeing()

    override fun onCreate() {
        super.onCreate()
        trackingManager = TrackingManager(context = this)
        instagramReelsLock = InstagramReelsLock(service = this)
        shortsPlatformManager = ShortsPlatformManager(
            context = this,
            blockedContentGoBack = this::goBack
        )
        browserManager = BrowserManager(
            context = this,
            shortsPlatformManager = shortsPlatformManager,
            blockedContentGoBack = this::goBack
        )

        // Register shared prefs listener and load data
        SharedPrefsHelper.registerUnregisterListenerToListenablePrefs(this, true, this)
        wellbeing = SharedPrefsHelper.getSetWellBeingSettings(this, null)

        // Register listener for install and uninstall events
        deviceAppsChangedReceiver.register(this)
    }


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_MIDNIGHT_ACCESSIBILITY_RESET -> {
                shortsPlatformManager.resetShortsScreenTime()
                Log.d(TAG, "onStartCommand: Midnight reset completed")
            }

            ACTION_PERFORM_HOME_PRESS -> {
                Log.d(TAG, "onStartCommand: Pressing home button")
                goBack(GLOBAL_ACTION_HOME)
            }
        }
        return super.onStartCommand(intent, flags, startId)
    }

    override fun onServiceConnected() {
        refreshServiceConfig()
        trackingManager.stopManualTracking()
        Log.d(TAG, "onCreate: Accessibility service started successfully")
        super.onServiceConnected()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent) {
        try {
            if (executorService.isShutdown) return

            // Content changes are only used for Instagram, to keep the reels lock in place and
            // to notice reels opened inside the app (e.g. from a DM) without any scroll.
            if (event.eventType == TYPE_WINDOW_CONTENT_CHANGED) {
                if (event.packageName?.toString() == INSTAGRAM_PACKAGE
                    && shortsPlatformPackages.contains(INSTAGRAM_PACKAGE)
                ) {
                    scheduleInstagramCheck()
                }
                return
            }

            // If not desired event, then just return
            if (!desiredEvents.contains(event.eventType)) return

            executorService.submit {
                // Determine package and event source node
                val eventPackageName = event.packageName.toString()
                val node = if (eventPackageName == REDDIT_PACKAGE) event.source
                else rootInActiveWindow ?: event.source

                node?.let {
                    // Broadcast event
                    trackingManager.onNewEvent("${it.packageName}")

                    // Show or hide the Instagram reels tab lock
                    updateInstagramReelsLock(it)

                    // Only process if any of the content is blocked
                    if (shouldBlockContent()) {
                        processEventInBackground(
                            packageName = eventPackageName,
                            node = it,
                            wellBeing = wellbeing.copy()
                        )
                    }
                }
            }

        } catch (ignored: Exception) {
        }
    }

    /**
     * Runs one Instagram check shortly after a burst of content-change events.
     * At most one check is pending at a time and it always runs after the latest event.
     */
    private fun scheduleInstagramCheck() {
        if (!isInstagramCheckScheduled.compareAndSet(false, true)) return

        mainHandler.postDelayed({
            isInstagramCheckScheduled.set(false)
            if (executorService.isShutdown) return@postDelayed

            executorService.submit {
                val root = rootInActiveWindow ?: return@submit
                updateInstagramReelsLock(root)

                if (root.packageName?.toString() == INSTAGRAM_PACKAGE && shouldBlockContent()) {
                    processEventInBackground(INSTAGRAM_PACKAGE, root, wellbeing.copy())
                }
            }
        }, INSTAGRAM_CONTENT_CHECK_DELAY_MS)
    }

    /**
     * Shows the lock over Instagram's Reels tab while Instagram is in the foreground and
     * reels are blocked, otherwise hides it.
     */
    private fun updateInstagramReelsLock(activeNode: AccessibilityNodeInfo) {
        try {
            val isInstagramActive = activeNode.packageName?.toString() == INSTAGRAM_PACKAGE

            if (isInstagramActive && shortsPlatformPackages.contains(INSTAGRAM_PACKAGE)) {
                val shouldLock = shortsPlatformManager.isInstagramReelsBlocked(wellbeing)
                instagramReelsLock.update(activeNode, shouldLock)
            } else {
                instagramReelsLock.hide()
            }
        } catch (e: Exception) {
            Log.e(TAG, "updateInstagramReelsLock: Failed to update reels lock", e)
        }
    }

    /**
     * Processes accessibility event in background thread instead of main thread.
     *
     * @param packageName The package name of the app generating the event.
     * @param node        The accessibility node representing the UI element currently in focus.
     */
    private fun processEventInBackground(
        packageName: String,
        node: AccessibilityNodeInfo,
        wellBeing: Wellbeing,
    ) {
        try {
            when (packageName) {
                in shortsPlatformPackages ->
                    shortsPlatformManager.blockDistraction(packageName, node, wellBeing)

                in browserPackages ->
                    browserManager.blockDistraction(packageName, node, wellBeing)
            }

        } catch (e: Exception) {
            Log.e(
                TAG,
                "processEventInBackground: Failed to process accessibility event in background",
                e
            )
            SharedPrefsHelper.insertCrashLogToPrefs(this, e)
        }
    }


    /**
     * Determines whether content should be blocked based on the current settings.
     *
     * @return `true` if content should be blocked based on the current settings,
     * `false` otherwise.
     */
    private fun shouldBlockContent(): Boolean {
        return wellbeing.blockedFeatures.isNotEmpty() ||
                wellbeing.blockedWebsites.isNotEmpty() ||
                wellbeing.nsfwWebsites.isNotEmpty() ||
                wellbeing.blockNsfwSites
    }


    /**
     * Performs the back action (or [customAction]) to leave blocked content.
     */
    private fun goBack(customAction: Int? = null) {
        throttler.submit {
            ThreadUtils.runOnMainThread {
                performGlobalAction(customAction ?: GLOBAL_ACTION_BACK)
            }
        }
    }

    /**
     * Updates the service info with the latest settings and registered packages.
     */
    private fun refreshServiceConfig() {
        try {
            // Using hashset to avoid duplicates
            browserPackages.clear()
            shortsPlatformPackages.clear()
            val pm = packageManager

            // Fetch installed browser packages
            val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse("http://www.google.com"))
            pm.queryIntentActivities(browserIntent, PackageManager.MATCH_ALL).forEach {
                browserPackages.add(it.activityInfo.packageName)
            }

            wellbeing.blockedFeatures.forEach { feature ->
                when (feature) {
                    /// Instagram
                    PlatformFeatures.INSTAGRAM_REELS,
                    PlatformFeatures.INSTAGRAM_EXPLORE,
                        -> shortsPlatformPackages.add(INSTAGRAM_PACKAGE)

                    // Snapchat
                    PlatformFeatures.SNAPCHAT_SPOTLIGHT,
                    PlatformFeatures.SNAPCHAT_DISCOVER,
                        -> shortsPlatformPackages.add(SNAPCHAT_PACKAGE)

                    // Facebook
                    PlatformFeatures.FACEBOOK_REELS ->
                        shortsPlatformPackages.add(FACEBOOK_PACKAGE)

                    // Reddit
                    PlatformFeatures.REDDIT_SHORTS ->
                        shortsPlatformPackages.add(REDDIT_PACKAGE)

                    // Youtube
                    PlatformFeatures.YOUTUBE_SHORTS -> {
                        // Add official package
                        shortsPlatformPackages.add(YOUTUBE_PACKAGE)

                        // Now add other unofficial clients
                        val ytIntent =
                            Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com"))
                        pm.queryIntentActivities(ytIntent, PackageManager.MATCH_ALL)
                            .filterNot { browserPackages.contains(it.activityInfo.packageName) }
                            .forEach {
                                shortsPlatformPackages.add(it.activityInfo.packageName)
                            }
                    }
                }
            }


            // Load nsfw website domains if needed
            if (wellbeing.blockNsfwSites) BrowserManager.initializeNsfwDomains()
            else BrowserManager.clearNsfwDomains()

            Log.d(
                TAG, "refreshServiceConfig: Accessibility service config updated successfully: " +
                        "\n settings: $wellbeing" +
                        "\n short platforms: $shortsPlatformPackages" +
                        "\n browsers: $browserPackages"
            )
        } catch (e: Exception) {
            Log.e(TAG, "refreshServiceInfo: Failed to refresh service info", e)
            SharedPrefsHelper.insertCrashLogToPrefs(this, e)
        }
    }

    override fun onSharedPreferenceChanged(prefs: SharedPreferences, changedKey: String?) {
        changedKey?.let { key ->
            if (key == SharedPrefsHelper.PREF_KEY_WELLBEING_SETTINGS) {
                Log.d(TAG, "OnSharedPrefsChanged: Key changed = $changedKey")
                wellbeing = SharedPrefsHelper.getSetWellBeingSettings(this, null)
                refreshServiceConfig()
            }
        }
    }

    override fun onInterrupt() {
    }

    override fun onDestroy() {
        try {
            mainHandler.removeCallbacksAndMessages(null)
            instagramReelsLock.hide()
            executorService.shutdownNow()
            trackingManager.startManualTracking()

            // Unregister prefs listener and receiver
            deviceAppsChangedReceiver.unRegister(this)
            SharedPrefsHelper.registerUnregisterListenerToListenablePrefs(this, false, this)
        } catch (e: Exception) {
            // ignored
        }

        Log.d(TAG, "onDestroy: Accessibility service destroyed")
        super.onDestroy()
    }
}
