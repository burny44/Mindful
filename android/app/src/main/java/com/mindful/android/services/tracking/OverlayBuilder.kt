package com.mindful.android.services.tracking

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.drawable.Drawable
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView
import androidx.annotation.MainThread
import com.mindful.android.R
import com.mindful.android.enums.RestrictionType
import com.mindful.android.models.RestrictionState
import com.mindful.android.utils.AppUtils
import com.mindful.android.utils.DateTimeUtils
import com.mindful.android.utils.MindfulQuotes
import com.mindful.android.utils.ThreadUtils

object OverlayBuilder {
    @MainThread
    fun buildToastOverlay(
        context: Context,
        packageName: String,
        screenTimeUsedInMins: Int,
    ): View {
        // Inflate the custom layout for the dialog
        val inflater = LayoutInflater.from(context)
        val toastView = inflater.inflate(R.layout.overlay_toast_layout, null)

        // Resolve app icon and label
        val (appName, appIcon) = getAppLabelAndIcon(context, packageName)

        // App infos
        val appNameTxt = toastView.findViewById<TextView>(R.id.overlay_toast_app_name)
        val appIconImg = toastView.findViewById<ImageView>(R.id.overlay_toast_app_icon)
        appNameTxt.text = appName
        appIconImg.setImageDrawable(appIcon)

        // limit spent text
        val limitSpentTxt = toastView.findViewById<TextView>(R.id.overlay_toast_screen_time)
        limitSpentTxt.text = context.getString(
            R.string.app_screen_time_usage_info,
            DateTimeUtils.minutesToTimeStr(screenTimeUsedInMins)
        )

        // Set initial state
        toastView.alpha = 0f

        // Set click listener
        toastView.setOnClickListener {
            // Open mindful
            context.applicationContext.startActivity(
                AppUtils.getIntentForMindfulUri(
                    context,
                    "com.mindful.android://open/appDashboard?package=$packageName"
                )
            )
        }

        return toastView
    }

    @MainThread
    fun buildFullScreenOverlay(
        context: Context,
        packageName: String,
        state: RestrictionState,
        dismissOverlay: () -> Unit,
        addReminderDelay: ((futureMinutes: Int) -> Unit)? = null,
        onTakeBreak: ((sessionId: Long) -> Unit)? = null,
    ): View {
        // Inflate the custom layout for the dialog
        val inflater = LayoutInflater.from(context)
        val sheetView = inflater.inflate(R.layout.overlay_full_screen_layout, null)

        // Set quote and author
        val quoteTxt = sheetView.findViewById<TextView>(R.id.overlay_sheet_quote)
        val quoteAuthorTxt = sheetView.findViewById<TextView>(R.id.overlay_sheet_quote_author)
        val randomQuote = MindfulQuotes.getRandomQuote()
        quoteTxt.text = buildString {
            append("\"")
            append(randomQuote.value)
            append("\"")
        }
        quoteAuthorTxt.text = buildString {
            append("— ")
            append(randomQuote.key)
        }

        // Resolve app icon and label
        val (appName, appIcon) = getAppLabelAndIcon(context, packageName)

        // App infos
        val appNameTxt = sheetView.findViewById<TextView>(R.id.overlay_sheet_app_name)
        val appIconImg = sheetView.findViewById<ImageView>(R.id.overlay_sheet_app_icon)
        appNameTxt.text = appName
        appIconImg.setImageDrawable(appIcon)

        // Emergency button (Visible only if limit is exhausted)
        if (state.screenTimeUsed >= state.screenTimeLimit) {
            val emergencyBtn = sheetView.findViewById<Button>(R.id.overlay_sheet_btn_emergency)
            emergencyBtn.visibility = View.VISIBLE
            emergencyBtn.setOnClickListener {
                ThreadUtils.runOnMainThread {
                    /// Open mindful
                    context.applicationContext.startActivity(
                        AppUtils.getIntentForMindfulUri(
                            context,
                            "com.mindful.android://open/appDashboard?package=$packageName"
                        )
                    )

                    /// Remove overlay
                    dismissOverlay.invoke()
                }
            }
        }

        // Limit type
        val limitType = sheetView.findViewById<TextView>(R.id.overlay_sheet_limit_type)
        limitType.text = context.getString(
            when (state.type) {
                RestrictionType.LAUNCH_COUNT -> R.string.app_paused_restriction_launch_count
                RestrictionType.APP_TIMER -> R.string.app_paused_restriction_app_timer
                RestrictionType.APP_ACTIVE_PERIOD -> R.string.app_paused_restriction_app_active_period
                RestrictionType.FOCUS_UNLOCK -> R.string.app_paused_restriction_focus_unlock
                RestrictionType.SCHEDULED_FOCUS -> R.string.app_paused_restriction_scheduled_focus
            }
        )

        // Limit information
        val limitInfo = sheetView.findViewById<TextView>(R.id.overlay_sheet_limit_info)
        limitInfo.text = getRestrictionInfo(context, state)

        // Limit progress, and use more layout
        if (state.screenTimeLimit > 0 && state.screenTimeUsed > 0) {
            // Make limit parent container visible
            val limitContainer =
                sheetView.findViewById<LinearLayout>(R.id.overlay_sheet_limit_container)
            limitContainer.visibility = View.VISIBLE

            // calculate limit in minutes
            val usedLimitMins = (state.screenTimeUsed / 60).toInt()
            val totalLimitMins = (state.screenTimeLimit / 60).toInt()
            val leftLimitMins = if (usedLimitMins < totalLimitMins) totalLimitMins - usedLimitMins
            else 0

            // Progress bar
            val progressBar = sheetView.findViewById<ProgressBar>(R.id.overlay_sheet_limit_progress)
            progressBar.max = state.screenTimeLimit.toInt()
            progressBar.setProgress(state.screenTimeUsed.toInt(), true)

            // limit spent text
            val limitSpentTxt = sheetView.findViewById<TextView>(R.id.overlay_sheet_limit_spent)
            limitSpentTxt.text = DateTimeUtils.minutesToTimeStr(usedLimitMins)

            // limit left text
            val limitLeftTxt = sheetView.findViewById<TextView>(R.id.overlay_sheet_limit_left)
            limitLeftTxt.text = DateTimeUtils.minutesToTimeStr(leftLimitMins)

            // Wish to use more? options layout
            // Earn-unlock cannot be snoozed, the time has to be earned first.
            if (leftLimitMins > 0 &&
                state.type != RestrictionType.FOCUS_UNLOCK &&
                state.type != RestrictionType.SCHEDULED_FOCUS
            ) {
                val useMoreOptions =
                    sheetView.findViewById<LinearLayout>(R.id.overlay_sheet_limit_options_use_more)
                useMoreOptions.visibility = View.VISIBLE

                // Iterate over reminders and the button ids map and set click listener
                // and make them visible if the left limit is more than the specified reminder time
                addReminderDelay?.let { callback ->
                    mapOf(
                        2 to R.id.overlay_sheet_reminder_option_btn_two_mins,
                        5 to R.id.overlay_sheet_reminder_option_btn_five_mins,
                        10 to R.id.overlay_sheet_reminder_option_btn_ten_mins,
                        20 to R.id.overlay_sheet_reminder_option_btn_twenty_mins
                    ).forEach { (reminder, btnId) ->
                        // Always show 2 minute option if left minutes > 0
                        if (reminder == 2 || leftLimitMins >= reminder) {
                            val button = sheetView.findViewById<Button>(btnId)
                            button.visibility = View.VISIBLE
                            button.setOnClickListener {
                                callback(reminder)
                                dismissOverlay.invoke()
                            }
                        }
                    }
                }
            }
        }

        // Take a Break — only for scheduled focus sessions with remaining breaks
        if (state.canTakeBreak && onTakeBreak != null) {
            val takeBreakBtn = sheetView.findViewById<Button>(R.id.overlay_sheet_btn_take_break)
            takeBreakBtn.visibility = View.VISIBLE

            val durationLabel = DateTimeUtils.minutesToTimeStr(
                (state.breakDurationSec + 59) / 60
            )
            takeBreakBtn.text = if (state.breaksLeft == 1) {
                context.getString(
                    R.string.app_paused_overlay_button_take_break_last,
                    durationLabel,
                )
            } else {
                context.getString(
                    R.string.app_paused_overlay_button_take_break,
                    durationLabel,
                    state.breaksLeft,
                    state.breaksTotal,
                )
            }

            takeBreakBtn.setOnClickListener {
                ThreadUtils.runOnMainThread {
                    onTakeBreak.invoke(state.sessionId)
                    /// Lift the overlay, then bring the blocked app back to the front.
                    dismissOverlay.invoke()

                    context.packageManager.getLaunchIntentForPackage(packageName)?.let { intent ->
                        intent.addFlags(
                            Intent.FLAG_ACTIVITY_NEW_TASK or
                                    Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED or
                                    Intent.FLAG_ACTIVITY_REORDER_TO_FRONT
                        )
                        context.applicationContext.startActivity(intent)
                    }
                }
            }
        }

        // Close app button
        val closeAppBtn = sheetView.findViewById<Button>(R.id.overlay_sheet_btn_close_app)
        closeAppBtn.text = context.getString(R.string.app_paused_overlay_button_close_app, appName)
        closeAppBtn.setOnClickListener {
            ThreadUtils.runOnMainThread {
                /// Go to home
                val homeIntent = Intent(Intent.ACTION_MAIN)
                homeIntent.addCategory(Intent.CATEGORY_HOME)
                homeIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.applicationContext.startActivity(homeIntent)

                /// Remove overlay
                dismissOverlay.invoke()
            }
        }

        return sheetView
    }


    fun getAppLabelAndIcon(
        context: Context,
        packageName: String,
    ): Pair<String, Drawable> {
        val packageManager = context.packageManager
        val info = packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA)
        val appName = packageManager.getApplicationLabel(info).toString()
        val appIcon = packageManager.getApplicationIcon(info)

        return appName to appIcon
    }

    private fun getRestrictionInfo(
        context: Context,
        state: RestrictionState,
    ): String {
        val isLimitExhausted = state.screenTimeUsed >= state.screenTimeLimit

        return when (state.type) {
            RestrictionType.LAUNCH_COUNT ->
                context.getString(R.string.app_paused_reason_launch_count_out)

            RestrictionType.APP_TIMER ->
                if (isLimitExhausted) context.getString(R.string.app_paused_reason_app_timer_out)
                else context.getString(R.string.app_paused_reason_app_timer_left)

            RestrictionType.APP_ACTIVE_PERIOD ->
                context.getString(R.string.app_paused_reason_app_active_period_over)

            RestrictionType.FOCUS_UNLOCK ->
                context.getString(
                    R.string.app_paused_reason_focus_unlock,
                    state.groupName,
                )

            RestrictionType.SCHEDULED_FOCUS ->
                context.getString(
                    R.string.app_paused_reason_scheduled_focus,
                    state.groupName,
                )
        }
    }
}