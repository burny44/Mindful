package com.mindful.android.models

import com.mindful.android.utils.JsonUtils
import org.json.JSONObject

/**
 * A saved scheduled focus session.
 *
 * [distractingApps] stay blocked while the session is inside its schedule and not currently
 * in a break. When [isStrict] is true the Flutter side refuses further edits.
 */
data class ScheduledFocusSession(
    val id: Long = 0,
    val name: String = "",
    val scheduleStartTime: Int = 0,
    val scheduleEndTime: Int = 0,
    val scheduleDays: List<Boolean> = listOf(true, true, true, true, true, false, false),
    val distractingApps: Set<String> = emptySet(),
    val breaksEnabled: Boolean = false,
    val numberOfBreaks: Int = 3,
    val breakDurationSec: Int = 10 * 60,
    val pauseBetweenBreaksSec: Int = 0,
    val isStrict: Boolean = false,
) {
    val isValid: Boolean
        get() = distractingApps.isNotEmpty() && scheduleDays.contains(true)

    companion object {
        fun fromJson(json: String): ScheduledFocusSession {
            val jsonObject = JSONObject(json)
            return ScheduledFocusSession(
                id = jsonObject.optLong("id", 0),
                name = jsonObject.optString("name", ""),
                scheduleStartTime = jsonObject.optInt("scheduleStartTime", 0),
                scheduleEndTime = jsonObject.optInt("scheduleEndTime", 0),
                scheduleDays = JsonUtils.parseBooleanList(
                    jsonObject.optJSONArray("scheduleDays")?.toString(),
                    listOf(true, true, true, true, true, false, false),
                ),
                distractingApps = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("distractingApps")?.toString()
                ),
                breaksEnabled = jsonObject.optBoolean("breaksEnabled", false),
                numberOfBreaks = jsonObject.optInt("numberOfBreaks", 3),
                breakDurationSec = jsonObject.optInt("breakDurationSec", 10 * 60),
                pauseBetweenBreaksSec = jsonObject.optInt("pauseBetweenBreaksSec", 0),
                isStrict = jsonObject.optBoolean("isStrict", false),
            )
        }
    }
}
