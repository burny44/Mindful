/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */
package com.mindful.android.services.accessibility

import android.content.Context
import android.util.Log
import com.mindful.android.AppConstants.VIRTUAL_INSTAGRAM_REELS
import com.mindful.android.AppConstants.VIRTUAL_YOUTUBE_SHORTS
import org.json.JSONObject
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

/**
 * Measures how long Instagram Reels and YouTube Shorts are watched, per day.
 *
 * The accessibility service reports what is on screen ([observe]): a virtual app id
 * ([com.mindful.android.AppConstants.VIRTUAL_INSTAGRAM_REELS] / `VIRTUAL_YOUTUBE_SHORTS`)
 * while the viewer is open, or `null` otherwise. Time between two observations is added to
 * the content that was open, capped by [MAX_GAP_MS] so a missed "left" event (screen off,
 * service killed) can't add more than that. While a viewer is open the service keeps
 * observing on a heartbeat, so passive watching without any UI events is still counted.
 *
 * Lives in the app process, so the method channel can read live values via [usageForDays].
 * Totals are persisted to shared preferences (last [KEEP_DAYS] days).
 */
object ShortFormUsageTracker {
    private const val TAG = "Mindful.ShortFormUsageTracker"
    private const val PREFS_NAME = "ShortFormUsage"
    private const val PREF_KEY = "usageByDay"

    /** Longest gap between two observations that still counts as watching */
    const val MAX_GAP_MS = 15_000L

    /** Interval of the heartbeat observation while a viewer is open */
    const val HEARTBEAT_MS = 5_000L

    /**
     * Key for blocked short content other than Reels/Shorts (Snapchat Spotlight/Discover,
     * Facebook Reels, Reddit, Instagram Explore, short content in browsers). Only counted
     * while that content is blocked, for the shared daily allowance.
     */
    const val OTHER_SHORT_CONTENT = "mindful.short_content.other"

    private const val SAVE_INTERVAL_MS = 30_000L
    private const val KEEP_DAYS = 60L

    /** day (yyyy-MM-dd) -> (virtual app id -> ms) */
    private val usage = mutableMapOf<String, MutableMap<String, Long>>()
    private var loaded = false

    private var current: String? = null
    private var lastObservedAt = 0L
    private var lastSavedAt = 0L

    /** The virtual app currently being watched, or null */
    val watching: String? @Synchronized get() = current

    /**
     * Records what is on screen right now.
     *
     * @param target Virtual app id being watched, or null if no reels/shorts viewer is open.
     */
    @Synchronized
    fun observe(context: Context, target: String?, now: Long = System.currentTimeMillis()) {
        ensureLoaded(context)

        current?.let { watched ->
            val elapsed = (now - lastObservedAt).coerceIn(0L, MAX_GAP_MS)
            if (elapsed > 0) {
                val day = usage.getOrPut(dayKey(Calendar.getInstance())) { mutableMapOf() }
                day[watched] = (day[watched] ?: 0L) + elapsed
            }
        }

        val changed = current != target
        current = target
        lastObservedAt = now

        // Save when leaving a viewer, otherwise at most every SAVE_INTERVAL_MS
        if ((changed && target == null) || now - lastSavedAt > SAVE_INTERVAL_MS) {
            save(context)
            lastSavedAt = now
        }
    }

    /** Watch time of [target] today in ms (up to the latest observation). */
    @Synchronized
    fun todayMs(context: Context, target: String): Long {
        ensureLoaded(context)
        return usage[dayKey(Calendar.getInstance())]?.get(target) ?: 0L
    }

    /**
     * Time (ms) used today from the shared short content allowance: all Reels and Shorts
     * watched today, plus other blocked short content.
     */
    @Synchronized
    fun allowanceUsedMs(context: Context): Long {
        ensureLoaded(context)
        val today = usage[dayKey(Calendar.getInstance())] ?: return 0L
        return (today[OTHER_SHORT_CONTENT] ?: 0L) +
                (today[VIRTUAL_INSTAGRAM_REELS] ?: 0L) +
                (today[VIRTUAL_YOUTUBE_SHORTS] ?: 0L)
    }

    /** Stops counting (e.g. the service is being destroyed) and persists everything. */
    @Synchronized
    fun stop(context: Context) {
        if (current != null) observe(context, null)
        else save(context)
    }

    /**
     * Returns the usage in SECONDS for every day from [startMs] until [endMs] (local days,
     * inclusive) as `yyyy-MM-dd -> (virtual app id -> seconds)`. Days without usage are
     * omitted.
     */
    @Synchronized
    fun usageForDays(context: Context, startMs: Long, endMs: Long): Map<String, Map<String, Int>> {
        ensureLoaded(context)
        val result = mutableMapOf<String, Map<String, Int>>()
        val day = Calendar.getInstance().apply { timeInMillis = startMs }
        val endKey = dayKey(Calendar.getInstance().apply { timeInMillis = endMs })
        var key = dayKey(day)
        while (key <= endKey) {
            usage[key]?.let { perApp ->
                result[key] = perApp.mapValues { (it.value / 1000L).toInt() }
            }
            day.add(Calendar.DAY_OF_YEAR, 1)
            key = dayKey(day)
        }
        return result
    }

    private fun dayKey(calendar: Calendar): String =
        SimpleDateFormat("yyyy-MM-dd", Locale.US).format(calendar.time)

    private fun ensureLoaded(context: Context) {
        if (loaded) return
        loaded = true
        try {
            val json = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .getString(PREF_KEY, null) ?: return
            val root = JSONObject(json)
            root.keys().forEach { day ->
                val perApp = root.getJSONObject(day)
                usage[day] = perApp.keys().asSequence()
                    .associateWith { perApp.getLong(it) }
                    .toMutableMap()
            }
        } catch (e: Exception) {
            Log.e(TAG, "ensureLoaded: Failed to load short form usage", e)
        }
    }

    private fun save(context: Context) {
        try {
            val oldest = dayKey(Calendar.getInstance().apply {
                add(Calendar.DAY_OF_YEAR, -KEEP_DAYS.toInt())
            })
            usage.keys.removeAll { it < oldest }

            val root = JSONObject()
            usage.forEach { (day, perApp) -> root.put(day, JSONObject(perApp as Map<*, *>)) }

            context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .edit().putString(PREF_KEY, root.toString()).apply()
        } catch (e: Exception) {
            Log.e(TAG, "save: Failed to save short form usage", e)
        }
    }
}
