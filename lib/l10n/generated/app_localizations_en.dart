// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mindful_tagline => 'Focus on what truly Matters';

  @override
  String get permission_status_off => 'Off';

  @override
  String get permission_status_allowed => 'Allowed';

  @override
  String get permission_status_not_allowed => 'Not allowed';

  @override
  String get permission_button_grant_permission => 'Grant Permission';

  @override
  String get permission_button_agree_and_continue => 'Agree & Continue';

  @override
  String get permission_button_not_now => 'Not Now';

  @override
  String get permission_button_help => 'Help?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful is 100% secure and works offline. We do not collect or store any personal data.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. Click on $button_label button.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Select Mindful in the next screen.';

  @override
  String get permission_grant_step_three =>
      '3. Click and turn on the switch like below.';

  @override
  String get permission_notification_title => 'Send Notifications';

  @override
  String get permission_alarms_title => 'Alarms & Reminders';

  @override
  String get permission_alarms_info =>
      'Please grant permission for setting alarms and reminders. This will allow Mindful to start your bedtime schedule on time and reset app timers daily at midnight and help you stay on track.';

  @override
  String get permission_alarms_device_tile_label =>
      'Allow setting alarms and reminders';

  @override
  String get permission_usage_title => 'Usage Access';

  @override
  String get permission_usage_info =>
      'Please grant usage access permission. This will allow Mindful to monitor app usage and manage access to certain apps, ensuring a more focused and controlled digital environment.';

  @override
  String get permission_usage_device_tile_label => 'Permit usage access';

  @override
  String get permission_overlay_title => 'Display Overlay';

  @override
  String get permission_overlay_info =>
      'Please grant display overlay permission. This will allow Mindful to show an overlay when a paused app is opened, helping you stay focused and maintain your schedule.';

  @override
  String get permission_overlay_device_tile_label =>
      'Allow display over other apps';

  @override
  String get permission_accessibility_title => 'Accessibility';

  @override
  String get permission_accessibility_info =>
      'Please grant accessibility permission. This will allow Mindful to restrict access to short-form video content (e.g., Reels, Shorts) within social media apps and browsers, and filter inappropriate websites.';

  @override
  String get permission_accessibility_required =>
      'Mindful requires accessibility permission to block short content and websites effectively.';

  @override
  String get permission_accessibility_device_tile_label => 'Use Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Ignore Battery Optimization';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Already unrestricted';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Disable background restriction';

  @override
  String get permission_battery_optimization_allow_info =>
      'Allowing \'Ignore Battery Optimization\' will automatically grant the \'Alarms & Reminders\' permission on some devices.';

  @override
  String get permission_vpn_title => 'Create VPN';

  @override
  String get permission_vpn_info =>
      'Please grant permission to create virtual private network (VPN) connection. This will enable Mindful to restrict internet access for designated applications by creating local on device VPN.';

  @override
  String get permission_notification_access_title => 'Notification Access';

  @override
  String get permission_notification_access_info =>
      'Please grant notification access permission. This will allow Mindful to organize your notifications and deliver them on your schedule.';

  @override
  String get permission_notification_access_required =>
      'Mindful requires notification access to batch and schedule notifications.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Allow notification access';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hours',
      one: '1 hour',
      zero: '0 hour',
    );
    return '$_temp0';
  }

  @override
  String nMinutes(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString minutes',
      one: '1 minute',
      zero: '0 minute',
    );
    return '$_temp0';
  }

  @override
  String nSeconds(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString seconds',
      one: '1 second',
      zero: '0 second',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'and';

  @override
  String get timer_status_paused => 'Paused';

  @override
  String get create_button => 'Create';

  @override
  String get update_button => 'Update';

  @override
  String get dialog_button_cancel => 'Cancel';

  @override
  String get dialog_button_remove => 'Remove';

  @override
  String get dialog_button_set => 'Set';

  @override
  String get dialog_button_reset => 'Reset';

  @override
  String get dialog_button_infinite => 'Infinite';

  @override
  String get schedule_start_label => 'Start';

  @override
  String get schedule_end_label => 'End';

  @override
  String get quick_actions_heading => 'Quick actions';

  @override
  String get select_distracting_apps_heading => 'Select distracting apps';

  @override
  String get your_distracting_apps_heading => 'Your distracting apps';

  @override
  String get select_more_apps_heading => 'Select more apps';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Adding important system apps to the list of distracting apps is not permitted.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Screen usage and restrictions are unavailable for this application. At present, only network usage is accessible';

  @override
  String get active_period_info =>
      'Set a time period during which access will be allowed. Outside of this time frame, access will be restricted.';

  @override
  String get donation_card_title => 'Support us';

  @override
  String get donation_card_info =>
      'Mindful is free and open-source, developed with months of dedication. If it has helped you, your donation would mean the world to us. Every contribution helps us continue improving and maintaining it for everyone.';

  @override
  String get operation_failed_snack_alert =>
      'Operation failed, something went wrong!';

  @override
  String get donation_card_button_donate => 'Donate';

  @override
  String get app_restart_dialog_title => 'Need restart';

  @override
  String get app_restart_dialog_info =>
      'Mindful will automatically restart once the countdown finishes. Please be patient as changes are applied.';

  @override
  String get onboarding_skip_btn_label => 'Skip';

  @override
  String get onboarding_finish_setup_btn_label => 'Finish Setup';

  @override
  String get onboarding_page_one_title => 'Master Focus.';

  @override
  String get onboarding_page_one_info =>
      'Pause distracting apps, block short content, and stay on track with customizable focus sessions. Whether you\'re working, studying, or relaxing, Mindful helps you stay in control.';

  @override
  String get onboarding_page_two_title => 'Block Distractions.';

  @override
  String get onboarding_page_two_info =>
      'Set usage limits, automatically pause apps, and create healthier digital habits. Use Bedtime Mode to unwind and enjoy a distraction-free night.';

  @override
  String get onboarding_page_three_title => 'Privacy First.';

  @override
  String get onboarding_page_three_info =>
      'Mindful is 100% open-source and operates entirely offline. We don\'t collect or share your personal data — your privacy is guaranteed in every way.';

  @override
  String get onboarding_page_permissions_title => 'Essential Permissions.';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful requires following essential permissions to track and manage your screen time, helping reduce distractions and improve focus.';

  @override
  String get dashboard_tab_title => 'Dashboard';

  @override
  String get focus_now_fab_button => 'Focus';

  @override
  String get focus_unlock_option_label => 'Earn unlock';

  @override
  String get new_session_option_label => 'New session';

  @override
  String get new_session_screen_title => 'New session';

  @override
  String get new_session_info =>
      'Pick the apps to block during this session. They stay blocked only while the schedule is active and not during a break. Enable Strict to lock the session so it cannot be edited or removed later.';

  @override
  String get new_session_name_tile_title => 'Session name';

  @override
  String get new_session_name_dialog_info =>
      'Give this session a name so you can recognise it on the dashboard.';

  @override
  String get new_session_apps_heading => 'Apps to block';

  @override
  String get new_session_apps_info =>
      'These apps stay blocked while the session is active and not on a break.';

  @override
  String get new_session_schedule_heading => 'Schedule';

  @override
  String get new_session_schedule_all_day => 'All day';

  @override
  String get new_session_breaks_heading => 'Breaks';

  @override
  String get new_session_breaks_tile_title => 'Breaks';

  @override
  String get new_session_breaks_tile_subtitle =>
      'Allow short breaks when the session is active.';

  @override
  String get new_session_breaks_count_title => 'Number of breaks';

  @override
  String get new_session_break_duration_title => 'Time of break';

  @override
  String get new_session_break_duration_info =>
      'How long each break lasts. Apps are not blocked during a break.';

  @override
  String get new_session_pause_between_title => 'Pause between breaks';

  @override
  String get new_session_pause_between_info =>
      'How long apps stay blocked before the next break starts.';

  @override
  String get new_session_strict_tile_title => 'Strict';

  @override
  String get new_session_strict_tile_subtitle =>
      'Cannot be edited or removed while the schedule is active.';

  @override
  String get new_session_strict_locked_snack =>
      'This strict session is active and cannot be changed right now.';

  @override
  String get new_session_no_apps_selected => 'No apps selected';

  @override
  String new_session_apps_selected(int count) {
    return '$count apps selected';
  }

  @override
  String get new_session_sessions_heading => 'Focus sessions';

  @override
  String get app_groups_heading => 'App groups';

  @override
  String get app_groups_info =>
      'Put apps into groups like Social or Games. A group can be picked in focus sessions and earn unlock sessions instead of picking every app again. Editing a group updates every session that uses it.';

  @override
  String get app_groups_empty => 'No groups yet.\nTap New group to create one.';

  @override
  String get app_groups_your_groups_heading => 'Your groups';

  @override
  String get app_group_new_button => 'New group';

  @override
  String app_group_apps_count(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get app_group_name_tile_title => 'Group name';

  @override
  String get app_group_name_dialog_info =>
      'Give this group a name so you can recognise it when picking apps.';

  @override
  String get app_group_apps_tile_title => 'Apps in group';

  @override
  String get app_group_apps_info =>
      'Pick the apps and in-app content which belong to this group.';

  @override
  String get app_group_remove_dialog_title => 'Remove group?';

  @override
  String get app_group_remove_dialog_info =>
      'The group will also be removed from every session that uses it.';

  @override
  String get app_group_locked_snack =>
      'This group is used by a strict session which is active right now. It can be changed once the session ends.';

  @override
  String get app_group_no_name_snack => 'Please give the group a name.';

  @override
  String get virtual_apps_heading => 'In-app content';

  @override
  String get virtual_apps_tile_subtitle => 'Blocks only this part of the app';

  @override
  String get virtual_app_instagram_reels => 'Instagram Reels';

  @override
  String get virtual_app_youtube_shorts => 'YouTube Shorts';

  @override
  String get in_app_blocking_card_subtitle => 'Blocked inside the app';

  @override
  String get new_session_save_button => 'Save session';

  @override
  String get new_session_no_apps_snack => 'Select at least one app to block.';

  @override
  String get new_session_no_days_snack =>
      'Select at least one day for this session.';

  @override
  String get new_session_breaks_invalid_snack =>
      'Set the number of breaks, break time, and pause between breaks.';

  @override
  String get new_session_remove_dialog_title => 'Remove session';

  @override
  String get new_session_remove_dialog_info =>
      'Are you sure you want to remove this focus session? The apps it blocks will be available again.';

  @override
  String get new_session_strict_badge => 'Strict';

  @override
  String get focus_unlock_screen_title => 'Earn unlock';

  @override
  String get focus_unlock_info =>
      'Pick the apps you must use first. After you spend the selected time in those apps, the other apps you choose are unblocked. The session only applies on the selected days and during the start–end schedule.';

  @override
  String get focus_unlock_name_tile_title => 'Session name';

  @override
  String get focus_unlock_name_dialog_info =>
      'Give this session a name so you can recognise it on the dashboard.';

  @override
  String get focus_unlock_required_time_title => 'Required time';

  @override
  String get focus_unlock_required_time_info =>
      'How long you must spend in the selected focus apps before the other apps unlock.';

  @override
  String get focus_unlock_apps_heading => 'Apps';

  @override
  String get focus_unlock_schedule_heading => 'Schedule';

  @override
  String get focus_unlock_schedule_all_day => 'All day';

  @override
  String get focus_unlock_source_apps_heading => 'Apps you must use';

  @override
  String get focus_unlock_source_apps_info =>
      'Time spent in these apps counts toward the unlock.';

  @override
  String get focus_unlock_reward_apps_heading => 'Apps to unlock after';

  @override
  String get focus_unlock_reward_apps_info =>
      'These apps stay blocked until the required time is reached.';

  @override
  String get focus_unlock_no_apps_selected => 'No apps selected';

  @override
  String focus_unlock_apps_selected(int count) {
    return '$count apps selected';
  }

  @override
  String get focus_unlock_sessions_heading => 'Earn unlock sessions';

  @override
  String get focus_unlock_save_session_button => 'Save session';

  @override
  String get focus_unlock_save_selection_button => 'Save selection';

  @override
  String get focus_unlock_no_apps_snack =>
      'Select the apps you must use and the apps to unlock after.';

  @override
  String get focus_unlock_no_timer_snack =>
      'Set the time you have to earn first.';

  @override
  String get focus_unlock_no_days_snack =>
      'Select at least one day for this session.';

  @override
  String get focus_unlock_remove_dialog_title => 'Remove session';

  @override
  String get focus_unlock_remove_dialog_info =>
      'Are you sure you want to remove this earn unlock session? The apps it blocks will be available again.';

  @override
  String get welcome_greetings => 'Welcome back,';

  @override
  String get username_snack_alert => 'Long press to edit username.';

  @override
  String get username_dialog_title => 'Username';

  @override
  String get username_dialog_info =>
      'Enter your username which will be displayed on dashboard.';

  @override
  String get username_dialog_button_apply => 'Apply';

  @override
  String get restrictions_heading => 'Restrictions';

  @override
  String get apps_blocking_tile_title => 'Apps blocking';

  @override
  String get apps_blocking_tile_subtitle => 'Limit apps in multiple ways.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Limit adult and custom websites.';

  @override
  String get screen_time_label => 'Screen time';

  @override
  String get statistics_tab_title => 'Statistics';

  @override
  String get screen_segment_label => 'Screen';

  @override
  String get data_segment_label => 'Data';

  @override
  String get mobile_label => 'Mobile';

  @override
  String get wifi_label => 'Wifi';

  @override
  String get most_used_apps_heading => 'Most used apps';

  @override
  String get show_all_apps_tile_title => 'Show all apps';

  @override
  String get search_apps_hint => 'Search apps...';

  @override
  String get notifications_tab_title => 'Notifications';

  @override
  String get notifications_tab_info =>
      'Batch notification from apps and set schedules like morning, noon, evening and night. Stay updated without constant interruptions.';

  @override
  String get batched_apps_tile_title => 'Batched apps';

  @override
  String get batch_recap_dropdown_title => 'Batch recap type';

  @override
  String get batch_recap_dropdown_info =>
      'Choose what to push when a schedule triggers — all notifications or just a summary.';

  @override
  String get batch_recap_option_summery_only => 'Summary only';

  @override
  String get batch_recap_option_all_notifications => 'All notifications';

  @override
  String get notification_history_tile_title => 'Notification history';

  @override
  String get store_all_tile_title => 'Store all notifications';

  @override
  String get store_all_tile_subtitle => 'Save non-batched notifications too.';

  @override
  String get schedules_heading => 'Schedules';

  @override
  String get new_schedule_fab_button => 'New Schedule';

  @override
  String get new_schedule_dialog_info =>
      'Enter a name for the notification schedule to help identify it easily.';

  @override
  String get new_schedule_dialog_field_label => 'Schedule name';

  @override
  String get shorts_blocking_tab_title => 'In app blocking';

  @override
  String get shorts_blocking_tab_info =>
      'Control how much time you spend on short content across platforms like Instagram, YouTube, Snapchat, and Facebook, including their websites.';

  @override
  String get short_content_heading => 'Short content';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Left from $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Set a daily time limit for short content. Once your limit is reached, the short content will be paused until midnight.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Restrict features on instagram.';

  @override
  String get instagram_features_block_reels => 'Restrict reels section.';

  @override
  String get instagram_features_block_explore => 'Restrict explore section.';

  @override
  String get instagram_usage_limit_tile_title =>
      'Only after daily Instagram use';

  @override
  String get instagram_usage_limit_tile_subtitle_off =>
      'Block reels only after using Instagram for a set time each day.';

  @override
  String instagram_usage_limit_tile_subtitle_on(String time) {
    return 'Reels get blocked after $time of Instagram today.';
  }

  @override
  String get instagram_usage_limit_picker_title => 'Daily Instagram time';

  @override
  String get instagram_usage_limit_picker_info =>
      'Reels stay available until you have used Instagram for this long today. After that, reels are blocked until midnight.';

  @override
  String get in_app_blocking_feature_reels => 'Reels';

  @override
  String get in_app_blocking_feature_explore => 'Explore';

  @override
  String get in_app_blocking_feature_spotlight => 'Spotlight';

  @override
  String get in_app_blocking_feature_discover => 'Discover';

  @override
  String get in_app_blocking_feature_shorts => 'Shorts';

  @override
  String in_app_blocking_reels_after_usage(String time) {
    return 'Reels after $time of use';
  }

  @override
  String get snapchat_features_tile_title => 'Snapchat';

  @override
  String get snapchat_features_tile_subtitle =>
      'Restrict features on snapchat.';

  @override
  String get snapchat_features_block_spotlight => 'Restrict spotlight section.';

  @override
  String get snapchat_features_block_discover => 'Restrict discover section.';

  @override
  String get youtube_features_tile_title => 'Youtube';

  @override
  String get youtube_features_tile_subtitle => 'Restrict shorts on youtube.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => 'Restrict reels on facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => 'Restrict shorts on reddit.';

  @override
  String get websites_blocking_tab_title => 'Websites blocking';

  @override
  String get websites_blocking_tab_info =>
      'Block adult websites and any custom sites you choose to create a safer and more focused online experience. Take charge of your browsing and stay distraction-free.';

  @override
  String get adult_content_heading => 'Adult content';

  @override
  String get block_nsfw_title => 'Block Nsfw';

  @override
  String get block_nsfw_subtitle =>
      'Restrict browsers from opening adult and porn websites.';

  @override
  String get block_nsfw_dialog_info =>
      'Are you sure? This action is irreversible. Once adult sites blocker is turned ON, you cannot turn it OFF as long as this app is installed on your device.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Block anyway';

  @override
  String get blocked_websites_heading => 'Blocked websites';

  @override
  String get blocked_websites_empty_list_hint =>
      'Click on \'+ Add Website\' button to add distracting websites which you wish to block.';

  @override
  String get add_website_fab_button => 'Add Website';

  @override
  String get add_website_dialog_title => 'Distracting website';

  @override
  String get add_website_dialog_info =>
      'Enter url of a website which you want to block.';

  @override
  String get add_website_dialog_is_nsfw => 'Is nsfw site?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Warning: Nsfw sites cannot be removed once added.';

  @override
  String get add_website_dialog_button_block => 'Block';

  @override
  String get add_website_already_exist_snack_alert =>
      'The URL has already been added to the list of blocked websites.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Invalid URL! Unable to parse the host name.';

  @override
  String get focus_session_duration_tile_title => 'Session duration';

  @override
  String get focus_session_duration_dialog_info =>
      'Please select the desired duration for this focus session, determining how long you wish to remain focused and distraction-free.';

  @override
  String get timeline_tab_title => 'Timeline';

  @override
  String get calender_heading => 'Calender';

  @override
  String get active_session_reflection_dialog_title => 'Session reflection';

  @override
  String get active_session_reflection_dialog_info =>
      'Take a moment to reflect on your progress. What\'s your goal for this session? What did you accomplish during this session?';

  @override
  String get active_session_reflection_dialog_tip =>
      'Tip: You can always edit this later in the session timeline.';

  @override
  String get notifications_empty_list_hint =>
      'No notifications have been batched for the day.';

  @override
  String get conversations_label => 'Conversations';

  @override
  String get last_24_hours_heading => 'Last 24 hours';

  @override
  String get notification_timeline_tab_info =>
      'Browse your notification history by selecting a date from the calendar. See which apps grabbed your attention and reflect on your digital habits.';

  @override
  String get monthly_label => 'Monthly';

  @override
  String get daily_label => 'Daily';

  @override
  String get search_notifications_sheet_info =>
      'Easily find past notifications by searching through their title or content. Helps you quickly locate important alerts.';

  @override
  String get search_notifications_hint => 'Search notifications...';

  @override
  String get search_notifications_empty_list_hint =>
      'No notifications found matching your search.';

  @override
  String get app_info_none_warning =>
      'Couldn\'t find the app for the given package. Returning to the home screen.';

  @override
  String get emergency_fab_button => 'Emergency';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'This action will pause the app blocker for next 5 minutes. You have $leftPassesCount passes left. After using all passes, the app will stay blocked until midnight, or the active focus session ends.\n\nDo you still wish to proceed?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Use anyway';

  @override
  String get emergency_started_snack_alert =>
      'The app blocker is paused and will resume blocking in 5 minutes.';

  @override
  String get emergency_already_active_snack_alert =>
      'The app blocker is currently either paused or inactive. If notifications are enabled, you will receive updates regarding the remaining time.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'You have used all your emergency passes. The blocked apps will stay blocked until midnight, or the active focus session ends.';

  @override
  String get app_limit_status_not_set => 'Not set';

  @override
  String get app_timer_tile_title => 'App timer';

  @override
  String get app_timer_picker_dialog_info =>
      'Set a daily time limit for this app. Once your limit is reached, the app will be paused until midnight.';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => 'Launch limit';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Launched $count times today.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Set how many times you can open this app each day. Once the limit is reached, it will be paused until midnight.';

  @override
  String get app_active_period_tile_title => 'Active period';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'From $startTime to $endTime';
  }

  @override
  String get internet_access_tile_title => 'Internet access';

  @override
  String get internet_access_tile_subtitle =>
      'Switch off to block app\'s internet.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return '$appName\'s internet is blocked.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return '$appName\'s internet is unblocked.';
  }

  @override
  String get launch_app_tile_title => 'Launch app';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Open $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Go to app settings';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Manage app settings like notifications, permissions, storage and more.';

  @override
  String get include_in_stats_tile_title => 'Include in screen usage';

  @override
  String get include_in_stats_tile_subtitle =>
      'Switch off to exclude this app from total screen usage.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName is excluded from total screen usage.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName is included to total screen usage.';
  }

  @override
  String get general_tab_title => 'General';

  @override
  String get appearance_heading => 'Appearance';

  @override
  String get theme_mode_tile_title => 'Theme mode';

  @override
  String get theme_mode_system_label => 'System';

  @override
  String get theme_mode_light_label => 'Light';

  @override
  String get theme_mode_dark_label => 'Dark';

  @override
  String get material_color_tile_title => 'Material color';

  @override
  String get amoled_dark_tile_title => 'AMOLED dark';

  @override
  String get amoled_dark_tile_subtitle =>
      'Use pure black color for the dark theme.';

  @override
  String get dynamic_colors_tile_title => 'Dynamic colors';

  @override
  String get dynamic_colors_tile_subtitle => 'Use device colors if supported.';

  @override
  String get defaults_heading => 'Defaults';

  @override
  String get app_language_tile_title => 'App language';

  @override
  String get default_home_tab_tile_title => 'Home tab';

  @override
  String get usage_history_tile_title => 'Usage history';

  @override
  String get usage_history_15_days => '15 days';

  @override
  String get usage_history_1_month => '1 month';

  @override
  String get usage_history_3_month => '3 months';

  @override
  String get usage_history_6_month => '6 months';

  @override
  String get usage_history_1_year => '1 year';

  @override
  String get service_heading => 'Service';

  @override
  String get service_stopping_warning =>
      'If Mindful stops working unexpectedly, please grant the \'Ignore Battery Optimization\' permission to keep it running in the background. If the issue continues, try whitelisting Mindful for uninterrupted performance.';

  @override
  String get whitelist_app_tile_title => 'Whitelist Mindful';

  @override
  String get whitelist_app_tile_subtitle => 'Allow Mindful to auto start.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'This device does not support automatic startup management.';

  @override
  String get database_tab_title => 'Database';

  @override
  String get import_db_tile_title => 'Import database';

  @override
  String get import_db_tile_subtitle => 'Import database from a file.';

  @override
  String get export_db_tile_title => 'Export database';

  @override
  String get export_db_tile_subtitle => 'Export database to a file.';

  @override
  String get crash_logs_heading => 'Crash logs';

  @override
  String get crash_logs_info =>
      'If you encounter any issue, you can report it on GitHub along with the log file. The file will include details such as your device\'s manufacturer, model, Android version, SDK version, and crash logs. This information will help us identify and resolve the problem more effectively.';

  @override
  String get crash_logs_export_tile_title => 'Export crash logs';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Export crash logs to a json file.';

  @override
  String get crash_logs_view_tile_title => 'View logs';

  @override
  String get crash_logs_view_tile_subtitle => 'Explore stored crash logs.';

  @override
  String get crash_logs_empty_list_hint => 'No crash logged till now.';

  @override
  String get crash_logs_clear_tile_title => 'Clear logs';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Delete all crash logs from database.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Are you sure you wish to clear all crash logs from the database?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'Clear anyway';

  @override
  String get about_tab_title => 'About';

  @override
  String get changelog_tile_title => 'Changelog';

  @override
  String get changelog_tile_subtitle => 'Find out what\'s new.';

  @override
  String get full_changelog_tile_title => 'Full changelog';

  @override
  String get redirected_to_github_subtitle =>
      'You will be redirected to GitHub.';

  @override
  String get contribute_heading => 'Contribute';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'View the source code.';

  @override
  String get report_issue_tile_title => 'Report an issue';

  @override
  String get suggest_idea_tile_title => 'Suggest an idea';

  @override
  String get write_email_tile_title => 'Write to us via email';

  @override
  String get write_email_tile_subtitle =>
      'You will be redirected to Email app.';

  @override
  String get privacy_policy_heading => 'Privacy policy';

  @override
  String get privacy_policy_info =>
      'Mindful is committed to protecting your privacy. We do not collect, store, or transfer any type of user data. The app operates entirely offline and does not require an internet connection, ensuring that your personal information remains private and secure on your device. As a Free and Open Source Software (FOSS) application, Mindful guarantees complete transparency and user control over their data.';

  @override
  String get more_details_button => 'More details';
}
