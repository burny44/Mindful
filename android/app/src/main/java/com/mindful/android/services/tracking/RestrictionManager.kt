package com.mindful.android.services.tracking

import android.app.Service.USAGE_STATS_SERVICE
import android.app.usage.UsageStatsManager
import android.content.Context
import android.util.Log
import com.mindful.android.enums.RestrictionType
import com.mindful.android.helpers.storage.SharedPrefsHelper
import com.mindful.android.helpers.usages.ScreenUsageHelper
import com.mindful.android.models.AppRestriction
import com.mindful.android.models.FocusUnlockRule
import com.mindful.android.models.RestrictionState
import com.mindful.android.models.ScheduledFocusSession
import com.mindful.android.utils.DateTimeUtils

class RestrictionManager(
    private val context: Context,
    private val stopIfNoUsage: () -> Unit,
    private val usageStatsManager: UsageStatsManager = context.getSystemService(USAGE_STATS_SERVICE) as UsageStatsManager,
) {
    private val TAG = "Mindful.RestrictionManager"

    val isIdle: Boolean
        get() = appsRestrictions.isEmpty()
                && focusUnlockRules.isEmpty()
                && scheduledFocusSessions.isEmpty()

    // Restrictions
    private var appsRestrictions = HashMap<String, AppRestriction>()

    // Focus (read from the accessibility service thread pool too)
    @Volatile
    private var focusUnlockRules =
        SharedPrefsHelper.getSetFocusUnlockRules(context, null).filter { it.isValid }

    @Volatile
    private var scheduledFocusSessions =
        SharedPrefsHelper.getSetScheduledFocusSessions(context, null).filter { it.isValid }

    /// Manual "Take a Break" state for scheduled focus sessions (resets at midnight).
    private val manualBreakUntilBySession = HashMap<Long, Long>()
    private val breaksUsedTodayBySession = HashMap<Long, Int>()

    //  Cache
    private val appsLaunchCount = HashMap<String, Int>(0)
    val getAppsLaunchCount: HashMap<String, Int> get() = appsLaunchCount

    private val alreadyRestrictedApps = HashMap<String, RestrictionState>(0)

    init {
        Log.d(
            TAG,
            "init: restored ${scheduledFocusSessions.size} scheduled focus / " +
                "${focusUnlockRules.size} earn-unlock session(s) from prefs"
        )
    }

    /**
     * Returns `true` if a focus session or earn-unlock rule blocks the virtual app [target]
     * (e.g. [com.mindful.android.AppConstants.VIRTUAL_INSTAGRAM_REELS]) right now.
     *
     * Unlike [isAppRestricted] this does not touch launch counts or caches, so it is safe to
     * call repeatedly from the accessibility service.
     */
    fun isVirtualAppBlockedNow(target: String): Boolean {
        val scheduled = evaluateScheduledFocus(target)
        if (scheduled != null && scheduled.timeLeftMillis <= 0L) return true
        return evaluateFocusUnlock(target) != null
    }

    fun resetCache() {
        alreadyRestrictedApps.clear()
        appsLaunchCount.clear()
        manualBreakUntilBySession.clear()
        breaksUsedTodayBySession.clear()
    }

    fun updateRestrictions(appsRestrictionsMap: HashMap<String, AppRestriction>) {
        appsRestrictions = appsRestrictionsMap
        alreadyRestrictedApps.clear()
        Log.d(TAG, "updateRestrictions: Apps restrictions updated")
        stopIfNoUsage.invoke()
    }

    fun updateFocusUnlockRules(rules: List<FocusUnlockRule>) {
        focusUnlockRules = rules.filter { it.isValid }
        Log.d(
            TAG,
            "updateFocusUnlockRules: ${focusUnlockRules.size} earn-unlock session(s) updated"
        )
        stopIfNoUsage.invoke()
    }

    fun updateScheduledFocusSessions(sessions: List<ScheduledFocusSession>) {
        scheduledFocusSessions = sessions.filter { it.isValid }
        Log.d(
            TAG,
            "updateScheduledFocusSessions: ${scheduledFocusSessions.size} scheduled session(s) updated"
        )
        stopIfNoUsage.invoke()
    }

    /**
     * Starts an on-demand break for [sessionId] if the session still has breaks left.
     * Returns the break length in milliseconds when started, or null when it could not start.
     */
    fun takeScheduledFocusBreak(sessionId: Long): Long? {
        val session = scheduledFocusSessions.firstOrNull { it.id == sessionId } ?: return null
        if (!session.breaksEnabled || session.numberOfBreaks <= 0 || session.breakDurationSec <= 0) {
            return null
        }

        val used = breaksUsedTodayBySession.getOrDefault(sessionId, 0)
        if (used >= session.numberOfBreaks) return null

        /// Already in a manual break
        val existingUntil = manualBreakUntilBySession[sessionId] ?: 0L
        if (existingUntil > System.currentTimeMillis()) return null

        val breakMs = session.breakDurationSec * 1000L
        breaksUsedTodayBySession[sessionId] = used + 1
        manualBreakUntilBySession[sessionId] = System.currentTimeMillis() + breakMs

        Log.d(
            TAG,
            "takeScheduledFocusBreak: '${session.name}' break ${used + 1}/${session.numberOfBreaks} for ${session.breakDurationSec}s"
        )
        return breakMs
    }


    // returns nearest time stamp for rechecking
    fun isAppRestricted(packageName: String): RestrictionState? {
        // If already restricted (cached)
        val alreadyRestrictedState = evaluateIfAlreadyRestricted(packageName)
        if (alreadyRestrictedState != null) {
            return alreadyRestrictedState
        }

        evaluateFocusUnlock(packageName)?.let { return it }
        evaluateScheduledFocus(packageName)?.let { return it }

        // If no restrictions
        val restriction = appsRestrictions[packageName] ?: return null

        // Increment and Check app launch count
        val launchCount = appsLaunchCount.getOrDefault(packageName, 0) + 1
        if ((restriction.launchLimit > 0) && (launchCount > restriction.launchLimit)) {
            return RestrictionState(type = RestrictionType.LAUNCH_COUNT).also {
                alreadyRestrictedApps[packageName] = it
            }
        }
        appsLaunchCount[packageName] = launchCount

        val futureStates: MutableSet<RestrictionState> = mutableSetOf()

        /// evaluate active periods
        evaluateActivePeriodLimit(restriction, futureStates)?.let { return it }

        /// Evaluate screen time
        evaluateScreenTimeLimit(restriction, futureStates)?.let { return it }

        /// Return the nearest expiration
        if (futureStates.isNotEmpty()) {
            val nearestFutureState = futureStates.minBy { it.timeLeftMillis }
            return nearestFutureState
        } else {
            return null
        }
    }

    private fun evaluateIfAlreadyRestricted(packageName: String): RestrictionState? {
        return when {
            alreadyRestrictedApps.containsKey(packageName) -> alreadyRestrictedApps[packageName]
            else -> null
        }
    }

    /**
     * Blocks [packageName] if any earn-unlock session which is scheduled for right now still
     * awaits its required time. Sessions where the time is already earned do not block.
     */
    private fun evaluateFocusUnlock(packageName: String): RestrictionState? {
        val activeRules = focusUnlockRules.filter {
            it.unlockApps.contains(packageName)
                    && !it.sourceApps.contains(packageName)
                    && isFocusUnlockScheduledNow(it)
        }

        if (activeRules.isEmpty()) return null

        val screenUsage = ScreenUsageHelper.fetchAppUsageTodayTillNow(usageStatsManager)

        /// Keep the app blocked as long as a single session is unsatisfied, and report the
        /// one which is furthest away from being earned.
        return activeRules
            .map { rule ->
                rule to rule.sourceApps.sumOf { screenUsage[it] ?: 0L }
            }
            .filter { (rule, spentSec) -> spentSec < rule.requiredTimeSec }
            .maxByOrNull { (rule, spentSec) -> rule.requiredTimeSec - spentSec }
            ?.let { (rule, spentSec) ->
                Log.d(
                    TAG,
                    "evaluateFocusUnlock: $packageName is locked by '${rule.name}', earned ${spentSec}s of ${rule.requiredTimeSec}s"
                )

                /// timeLeftMillis must stay at its default so the tracker service shows the
                /// overlay right away instead of scheduling a reminder for later.
                RestrictionState(
                    type = RestrictionType.FOCUS_UNLOCK,
                    groupName = rule.name,
                    screenTimeUsed = spentSec,
                    screenTimeLimit = rule.requiredTimeSec.toLong(),
                )
            }
    }

    private fun isFocusUnlockScheduledNow(rule: FocusUnlockRule): Boolean {
        val dayIndex = DateTimeUtils.zeroIndexedDayOfWeek()
        if (!rule.scheduleDays.getOrElse(dayIndex) { false }) return false

        /// Equal start and end means the session is active all day
        if (rule.scheduleStartTime == rule.scheduleEndTime) return true

        return !DateTimeUtils.isTimeOutsideTODs(rule.scheduleStartTime, rule.scheduleEndTime)
    }

    /**
     * Blocks [packageName] while any scheduled focus session is in its work window.
     * During a break the app is free, but a reminder is scheduled so the overlay
     * appears as soon as the break ends.
     */
    private fun evaluateScheduledFocus(packageName: String): RestrictionState? {
        val matching = scheduledFocusSessions.filter {
            it.distractingApps.contains(packageName) && isScheduledFocusInWindow(it)
        }
        if (matching.isEmpty()) return null

        /// Prefer an immediate block over a break reminder if any matching
        /// session is currently in its work window.
        for (session in matching) {
            val breakLeftMs = msUntilBreakEnds(session)
            if (breakLeftMs == null) {
                val used = breaksUsedTodayBySession.getOrDefault(session.id, 0)
                Log.d(
                    TAG,
                    "evaluateScheduledFocus: $packageName is locked by '${session.name}'"
                )
                return RestrictionState(
                    type = RestrictionType.SCHEDULED_FOCUS,
                    groupName = session.name,
                    sessionId = session.id,
                    breaksTotal = if (session.breaksEnabled) session.numberOfBreaks else 0,
                    breaksUsed = used,
                    breakDurationSec = session.breakDurationSec,
                )
            }
        }

        /// Every matching session is on a break — schedule a recheck when the
        /// nearest break ends.
        val nearest = matching
            .mapNotNull { session ->
                msUntilBreakEnds(session)?.let { session to it }
            }
            .minByOrNull { it.second }

        return nearest?.let { (session, breakLeftMs) ->
            RestrictionState(
                type = RestrictionType.SCHEDULED_FOCUS,
                groupName = session.name,
                timeLeftMillis = breakLeftMs,
                sessionId = session.id,
            )
        }
    }

    private fun isScheduledFocusInWindow(session: ScheduledFocusSession): Boolean {
        val dayIndex = DateTimeUtils.zeroIndexedDayOfWeek()
        if (!session.scheduleDays.getOrElse(dayIndex) { false }) return false
        if (session.scheduleStartTime == session.scheduleEndTime) return true
        return !DateTimeUtils.isTimeOutsideTODs(
            session.scheduleStartTime,
            session.scheduleEndTime,
        )
    }

    /**
     * Returns milliseconds until the current break ends, or null when the session
     * is not currently in a break (including when breaks are disabled).
     *
     * Automatic break cycles need a positive [ScheduledFocusSession.pauseBetweenBreaksSec]
     * (work time before each break). When pause is 0, only manual "Take a Break"
     * overlays apply — otherwise the whole start of the schedule would be treated
     * as one long auto-break.
     */
    private fun msUntilBreakEnds(session: ScheduledFocusSession): Long? {
        /// Manual on-demand break takes priority
        val manualUntil = manualBreakUntilBySession[session.id] ?: 0L
        val now = System.currentTimeMillis()
        if (manualUntil > now) return manualUntil - now

        if (!session.breaksEnabled) return null
        if (session.numberOfBreaks <= 0) return null
        if (session.breakDurationSec <= 0 || session.pauseBetweenBreaksSec <= 0) return null

        val elapsedSec = elapsedSecSinceScheduleStart(session.scheduleStartTime)
        if (elapsedSec < 0) return null

        val workSec = session.pauseBetweenBreaksSec.toLong()
        val breakSec = session.breakDurationSec.toLong()
        val cycleSec = workSec + breakSec
        if (cycleSec <= 0L) return null

        for (i in 0 until session.numberOfBreaks) {
            val breakStart = (i * cycleSec) + workSec
            val breakEnd = breakStart + breakSec
            if (elapsedSec in breakStart until breakEnd) {
                return (breakEnd - elapsedSec) * 1000L
            }
        }
        return null
    }

    private fun elapsedSecSinceScheduleStart(startTodMinutes: Int): Long {
        val startCal = DateTimeUtils.todToTodayCal(startTodMinutes)
        val now = System.currentTimeMillis()
        val nowTod = DateTimeUtils.todayCalToTod()

        /// Overnight window that started yesterday
        if (nowTod < startTodMinutes && startCal.timeInMillis > now) {
            startCal.add(java.util.Calendar.DAY_OF_YEAR, -1)
        }

        return (now - startCal.timeInMillis) / 1000L
    }


    private fun evaluateActivePeriodLimit(
        restriction: AppRestriction,
        futureState: MutableSet<RestrictionState>,
    ): RestrictionState? {

        /// Check app's active period
        if (restriction.activePeriodStart != restriction.activePeriodEnd) {
            val state = RestrictionState(type = RestrictionType.APP_ACTIVE_PERIOD)

            /// Outside active period
            if (DateTimeUtils.isTimeOutsideTODs(
                    restriction.activePeriodStart,
                    restriction.activePeriodEnd
                )
            ) {
                Log.d(TAG, "evaluateActivePeriodLimit: App's active period is over")
                return state
            }
            /// Launched between active period calculate expiration time
            else {
                val willOverInMs = DateTimeUtils.todDifferenceFromNow(restriction.activePeriodEnd)
                futureState.add(state.copy(timeLeftMillis = willOverInMs))
            }
        }

        return null
    }

    private fun evaluateScreenTimeLimit(
        restriction: AppRestriction,
        futureStates: MutableSet<RestrictionState>,
    ): RestrictionState? {
        /// Check for app timer
        if (restriction.timerSec > 0) {
            val screenUsage = ScreenUsageHelper.fetchAppUsageTodayTillNow(usageStatsManager)
            val screenTimeSec: Long = screenUsage[restriction.appPackage] ?: 0

            /// App timer ran out
            if (screenTimeSec >= restriction.timerSec) {
                Log.d(TAG, "evaluateScreenTimeLimit: App's timer is over")
                val state = RestrictionState(
                    type = RestrictionType.APP_TIMER,
                    screenTimeUsed = screenTimeSec,
                    screenTimeLimit = restriction.timerSec.toLong(),
                    reminderType = restriction.reminderType,
                )

                alreadyRestrictedApps[restriction.appPackage] = state
                return state
            } else {
                /// App timer left so add expiration timestamp
                val leftAppLimitMs = (restriction.timerSec - screenTimeSec) * 1000L
                futureStates.add(
                    RestrictionState(
                        type = RestrictionType.APP_TIMER,
                        timeLeftMillis = leftAppLimitMs,
                        screenTimeUsed = screenTimeSec,
                        screenTimeLimit = restriction.timerSec.toLong(),
                        reminderType = restriction.reminderType,
                    )
                )
            }
        }

        return null
    }

    companion object {
        /**
         * The manager of the running tracker service, so the accessibility service can share its
         * session state (including manual breaks). Null when the tracker is not running.
         */
        @Volatile
        var active: RestrictionManager? = null
    }
}
