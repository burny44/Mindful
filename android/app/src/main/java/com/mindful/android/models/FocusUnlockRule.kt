package com.mindful.android.models

import com.mindful.android.utils.JsonUtils
import org.json.JSONObject

/**
 * Represents a saved "earn unlock" session.
 *
 * The apps in [unlockApps] stay blocked until [requiredTimeSec] of screen time is spent in
 * [sourceApps], but only on the selected [scheduleDays] and inside the start-end window.
 */
data class FocusUnlockRule(
    /**
     * Unique ID of the session.
     */
    val id: Long = 0,

    /**
     * Name of the session (e.g., "Read before scrolling").
     */
    val name: String = "",

    /**
     * Time which must be spent in [sourceApps] before [unlockApps] are unblocked, in seconds.
     */
    val requiredTimeSec: Int = 0,

    /**
     * Time of day (in minutes) from midnight when the session starts.
     */
    val scheduleStartTime: Int = 0,

    /**
     * Time of day (in minutes) from midnight when the session ends.
     */
    val scheduleEndTime: Int = 0,

    /**
     * Zero indexed days of the week (Monday first) on which the session is active.
     */
    val scheduleDays: List<Boolean> = listOf(true, true, true, true, true, false, false),

    /**
     * Apps whose screen time counts towards the unlock.
     */
    val sourceApps: Set<String> = emptySet(),

    /**
     * Apps which stay blocked until the required time is earned.
     */
    val unlockApps: Set<String> = emptySet(),
) {
    /**
     * A session can only block something if both app sets and the timer are configured.
     */
    val isValid: Boolean
        get() = sourceApps.isNotEmpty()
                && unlockApps.isNotEmpty()
                && requiredTimeSec > 0
                && scheduleDays.contains(true)

    companion object {

        /**
         * Constructs a [FocusUnlockRule] from a JSON string.
         */
        fun fromJson(json: String): FocusUnlockRule {
            val jsonObject = JSONObject(json)
            return FocusUnlockRule(
                id = jsonObject.optLong("id", 0),
                name = jsonObject.optString("name", ""),
                requiredTimeSec = jsonObject.optInt("requiredTimeSec", 0),
                scheduleStartTime = jsonObject.optInt("scheduleStartTime", 0),
                scheduleEndTime = jsonObject.optInt("scheduleEndTime", 0),
                scheduleDays = JsonUtils.parseBooleanList(
                    jsonObject.optJSONArray("scheduleDays")?.toString(),
                    listOf(true, true, true, true, true, false, false),
                ),
                sourceApps = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("sourceApps")?.toString()
                ),
                unlockApps = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("unlockApps")?.toString()
                ),
            )
        }
    }
}
