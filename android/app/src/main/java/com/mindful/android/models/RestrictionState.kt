package com.mindful.android.models

import com.mindful.android.enums.ReminderType
import com.mindful.android.enums.RestrictionType


data class RestrictionState(
    /** The type of restriction that this state represents **/
    val type: RestrictionType,

    /** Name of the focus-unlock rule or scheduled session behind this restriction **/
    val groupName: String? = null,

    /** Time left in milliseconds before the restriction starts **/
    val timeLeftMillis: Long = -1,

    /** Total screen time used so far in seconds **/
    val screenTimeUsed: Long = -1L,

    /** Screen time limit or timer in seconds **/
    val screenTimeLimit: Long = -1L,

    /** The type of reminder to show during app usage **/
    val reminderType: ReminderType = ReminderType.NONE,

    /** Scheduled-focus session id, when this state comes from one **/
    val sessionId: Long = -1L,

    /** Total breaks configured for the session **/
    val breaksTotal: Int = 0,

    /** Breaks already taken today for the session **/
    val breaksUsed: Int = 0,

    /** Length of one break in seconds **/
    val breakDurationSec: Int = 0,
) {
    val breaksLeft: Int
        get() = (breaksTotal - breaksUsed).coerceAtLeast(0)

    val canTakeBreak: Boolean
        get() = type == RestrictionType.SCHEDULED_FOCUS
                && sessionId >= 0L
                && breaksTotal > 0
                && breaksLeft > 0
                && breakDurationSec > 0
}
