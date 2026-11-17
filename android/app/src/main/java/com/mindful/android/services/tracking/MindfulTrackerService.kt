package com.mindful.android.services.tracking

import android.app.Service
import android.content.Intent
import android.os.IBinder
import android.util.Log
import androidx.annotation.WorkerThread
import com.mindful.android.AppConstants
import com.mindful.android.R
import com.mindful.android.utils.DateTimeUtils
import com.mindful.android.models.RestrictionState
import com.mindful.android.enums.RestrictionType
import com.mindful.android.generics.ServiceBinder
import com.mindful.android.helpers.device.NotificationHelper
import com.mindful.android.helpers.storage.SharedPrefsHelper

class MindfulTrackerService : Service() {
    companion object {
        private const val TAG = "Mindful.MindfulTrackerService"
    }

    private val mBinder = ServiceBinder(this@MindfulTrackerService)

    private lateinit var overlayManager: OverlayManager
    private lateinit var reminderManager: ReminderManager

    private lateinit var restrictionManager: RestrictionManager
    val getRestrictionManager get() = restrictionManager

    private lateinit var launchTrackingManager: LaunchTrackingManager
    val getLaunchTrackingManager get() = launchTrackingManager

    override fun onCreate() {
        overlayManager = OverlayManager(this)
        reminderManager = ReminderManager(overlayManager, ::onNewAppLaunch)
        restrictionManager = RestrictionManager(this, ::stopIfNoUsage)
        RestrictionManager.active = restrictionManager
        launchTrackingManager = LaunchTrackingManager(
            context = this,
            onNewAppLaunched = ::onNewAppLaunch,
            dismissOverlay = { overlayManager.dismissSheetOverlay() },
            cancelReminders = { reminderManager.cancelReminders() },
        )
        super.onCreate()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        /// Sticky restarts often arrive with a null intent. Keep the service
        /// alive whenever persisted restrictions (e.g. scheduled focus) exist.
        if (intent?.action == ServiceBinder.ACTION_START_MINDFUL_SERVICE
            || !restrictionManager.isIdle
        ) {
            startFgService()
            return START_STICKY
        }

        stopIfNoUsage()
        return START_NOT_STICKY
    }

    private fun startFgService() {
        try {
            val notification = NotificationHelper.buildFgServiceNotification(
                this,
                getString(R.string.app_blocker_running_notification_info)
            )
            startForeground(AppConstants.TRACKER_SERVICE_NOTIFICATION_ID, notification)
            Log.d(TAG, "startFgService: TRACKER service started successfully")
        } catch (e: Exception) {
            Log.e(TAG, "startFgService: Failed to start TRACKER service", e)
            SharedPrefsHelper.insertCrashLogToPrefs(this, e)
            stopIfNoUsage()
        }
    }

    fun onMidnightReset() {
        restrictionManager.resetCache()
        overlayManager.dismissSheetOverlay()
        val reminderAwaiting = reminderManager.cancelReminders()

        // Means app is active but timer is not over and now it is reset so re-launch same event again
        if (reminderAwaiting) launchTrackingManager.reInvokeLastLaunchEvent()
    }


    @WorkerThread
    private fun onNewAppLaunch(packageName: String) {
        try {
            reminderManager.cancelReminders()
            overlayManager.dismissSheetOverlay()

            /// check current restrictions
            val currentOrFutureState = restrictionManager.isAppRestricted(packageName)
            Log.d(TAG, "onNewAppLaunch: $packageName's evaluated state => $currentOrFutureState")

            currentOrFutureState?.let {
                /// Already restricted
                val pillMessage = if (it.timeLeftMillis <= 0L) lightBlockMessage(it) else null
                if (pillMessage != null) {
                    /// Nothing can be done right now, keep it light
                    overlayManager.showBlockedPill(
                        packageName = packageName,
                        message = pillMessage,
                    )
                } else if (it.timeLeftMillis <= 0L) {
                    overlayManager.showSheetOverlay(
                        packageName = packageName,
                        restrictionState = it,
                        onTakeBreak = { sessionId ->
                            val breakMs =
                                restrictionManager.takeScheduledFocusBreak(sessionId)
                            if (breakMs != null) {
                                /// The app is already open, so there won't be a new launch.
                                /// Recheck it now: the app's own limits (e.g. its timer)
                                /// still apply during the break, recheck at the nearest of
                                /// the break end and those limits.
                                val next = restrictionManager.isAppRestricted(
                                    packageName,
                                    countLaunch = false,
                                ) ?: it.copy(timeLeftMillis = breakMs)

                                if (next.timeLeftMillis <= 0L) onNewAppLaunch(packageName)
                                else reminderManager.scheduleReminders(packageName, next)
                            }
                        },
                    )
                }
                /// Under limit but will be exhausted in some time
                else {
                    reminderManager.scheduleReminders(
                        packageName = packageName,
                        state = it,
                    )
                }
            }
        } catch (e: Exception) {
            SharedPrefsHelper.insertCrashLogToPrefs(this, e)
            Log.e(TAG, "onNewAppLaunch: Failed to process new app launch event", e)
        }
    }

    /**
     * Message for the small pill when the app is blocked and there is nothing to choose
     * (a used up app timer, an earn-unlock session, or a focus session without breaks
     * left), null if the full
     * sheet should be shown instead.
     */
    private fun lightBlockMessage(state: RestrictionState): String? = when {
        state.type == RestrictionType.SCHEDULED_FOCUS && !state.canTakeBreak ->
            getString(R.string.app_paused_pill_scheduled_focus, state.groupName ?: "")

        state.type == RestrictionType.APP_TIMER ->
            getString(R.string.app_paused_pill_app_timer)

        /// Earn-unlock has no breaks, the time has to be earned first
        state.type == RestrictionType.FOCUS_UNLOCK ->
            getString(
                R.string.app_paused_pill_focus_unlock,
                state.groupName ?: "",
                DateTimeUtils.minutesToTimeStr((state.screenTimeUsed / 60).toInt()),
                DateTimeUtils.minutesToTimeStr(((state.screenTimeLimit + 59) / 60).toInt()),
            )

        else -> null
    }

    private fun stopIfNoUsage() {
        if (restrictionManager.isIdle) {
            Log.d(TAG, "Service no longer needed, stopping")
            launchTrackingManager.dispose()
            reminderManager.cancelReminders()
            overlayManager.dismissSheetOverlay()
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
        }
    }

    override fun onDestroy() {
        if (RestrictionManager.active === restrictionManager) RestrictionManager.active = null
        Log.d(TAG, "onDestroy: TRACKER service destroyed successfully")
        super.onDestroy()
    }


    override fun onBind(intent: Intent): IBinder? {
        return if (intent.action == ServiceBinder.ACTION_BIND_TO_MINDFUL) mBinder else null
    }
}