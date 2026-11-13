// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get mindful_tagline => 'Concentrati sulle cose importanti';

  @override
  String get permission_status_off => 'Spento';

  @override
  String get permission_status_allowed => 'Concesso';

  @override
  String get permission_status_not_allowed => 'Non concesso';

  @override
  String get permission_button_grant_permission => 'Concedi permesso';

  @override
  String get permission_button_agree_and_continue => 'Accetta e Continua';

  @override
  String get permission_button_not_now => 'Non ora';

  @override
  String get permission_button_help => 'Aiuto?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful è sicura al 100% e funziona offline. Nessun dato personale viene raccolto o conservato.';

  @override
  String get missing_permissions_dialog_title => 'Permissions needed';

  @override
  String missing_permissions_dialog_info(String permissions) {
    return 'Mindful needs these permissions to track screen time and block apps:\n\n$permissions';
  }

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return 'Premi il pulsante $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      'Seleziona Mindful nella prossima schermata.';

  @override
  String get permission_grant_step_three =>
      'Premi per abilitare Mindful come mostrato qui.';

  @override
  String get permission_notification_title => 'Invia Notifiche';

  @override
  String get permission_alarms_title => 'Sveglie e Promemoria';

  @override
  String get permission_alarms_info =>
      'Per favore concedi l\'autorizzazione per l\'impostazione di avvisi e promemoria. Questo permetterà a Mindful di avviare la programmazione notturna e di resettare i timer delle app ogni giorno a mezzanotte.';

  @override
  String get permission_alarms_device_tile_label =>
      'Consenti l\'impostazione di sveglie e promemoria';

  @override
  String get permission_usage_title => 'Accesso ai dati di utilizzo';

  @override
  String get permission_usage_info =>
      'Si prega di concedere il permesso di accesso all\'uso. Questo consentirà a Mindful di monitorare l\'utilizzo delle app e gestire l\'accesso a determinate app, garantendo un ambiente digitale più mirato e controllato.';

  @override
  String get permission_usage_device_tile_label =>
      'Consenti accesso ai dati di utilizzo';

  @override
  String get permission_overlay_title => 'Overlay Schermo';

  @override
  String get permission_overlay_info =>
      'Please grant display overlay permission. This will allow Mindful to show an overlay when a paused app is opened, helping you stay focused and maintain your schedule.';

  @override
  String get permission_overlay_device_tile_label =>
      'Allow display over other apps';

  @override
  String get permission_accessibility_title => 'Accessibilità';

  @override
  String get permission_accessibility_info =>
      'Please grant accessibility permission. This will allow Mindful to restrict access to short-form video content (e.g., Reels, Shorts) within social media apps and browsers, and filter inappropriate websites.';

  @override
  String get permission_accessibility_required =>
      'Mindful requires accessibility permission to block short content and websites effectively.';

  @override
  String get permission_accessibility_device_tile_label => 'Usa Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Ignora Ottimizzazioni Batteria';

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
  String get permission_vpn_title => 'Crea VPN';

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
  String get day_today => 'Oggi';

  @override
  String get day_yesterday => 'Ieri';

  @override
  String nDays(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      one: '1 day',
      zero: '0 day',
    );
    return '$_temp0';
  }

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
  String get time_separator_and => 'e';

  @override
  String get timer_status_active => 'Active';

  @override
  String get timer_status_paused => 'Paused';

  @override
  String get create_button => 'Create';

  @override
  String get update_button => 'Update';

  @override
  String get dialog_button_cancel => 'Cancella';

  @override
  String get dialog_button_remove => 'Remove';

  @override
  String get dialog_button_set => 'Set';

  @override
  String get dialog_button_reset => 'Reset';

  @override
  String get dialog_button_infinite => 'Infinite';

  @override
  String get schedule_start_label => 'Inizia';

  @override
  String get schedule_end_label => 'Termina';

  @override
  String get development_dialog_info =>
      'Mindful is currently under development and may have bugs or incomplete features. If you encounter any issues, please report them to help us improve.\n\nThank you for your feedback!';

  @override
  String get development_dialog_button_report_issue => 'Segnala un problema';

  @override
  String get development_dialog_button_close => 'Chiudi';

  @override
  String get quick_actions_heading => 'Quick actions';

  @override
  String get select_distracting_apps_heading => 'Select distracting apps';

  @override
  String get your_distracting_apps_heading => 'Your distracting apps';

  @override
  String get select_more_apps_heading => 'Seleziona altre app';

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
  String get donation_card_button_donate => 'Dona';

  @override
  String get app_restart_dialog_title => 'Need restart';

  @override
  String get app_restart_dialog_info =>
      'Mindful will automatically restart once the countdown finishes. Please be patient as changes are applied.';

  @override
  String get onboarding_skip_btn_label => 'Salta';

  @override
  String get onboarding_finish_setup_btn_label => 'Termina Setup';

  @override
  String get onboarding_page_one_title => 'Master Focus.';

  @override
  String get onboarding_page_one_info =>
      'Pause distracting apps, block short content, and stay on track with customizable focus sessions. Whether you\'re working, studying, or relaxing, Mindful helps you stay in control.';

  @override
  String get onboarding_page_two_title => 'Blocca distrazioni.';

  @override
  String get onboarding_page_two_info =>
      'Set usage limits, automatically pause apps, and create healthier digital habits. Use Bedtime Mode to unwind and enjoy a distraction-free night.';

  @override
  String get onboarding_page_three_title => 'Privacy prima di tutto.';

  @override
  String get onboarding_page_three_info =>
      'Mindful is 100% open-source and operates entirely offline. We don\'t collect or share your personal data — your privacy is guaranteed in every way.';

  @override
  String get onboarding_page_permissions_title => 'Permessi essenziali.';

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
  String get new_session_status_active => 'Active now';

  @override
  String get new_session_status_break => 'On break';

  @override
  String get new_session_status_idle => 'Outside schedule';

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
  String get welcome_greetings => 'Felice di rivederti,';

  @override
  String get username_snack_alert =>
      'Premi a lungo per modificare il nome utente.';

  @override
  String get username_dialog_title => 'Nome utente';

  @override
  String get username_dialog_info =>
      'Enter your username which will be displayed on dashboard.';

  @override
  String get username_dialog_button_apply => 'Applica';

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
  String get longest_streak_label => 'Longest streak';

  @override
  String get current_streak_label => 'Current streak';

  @override
  String get successful_sessions_label => 'Successful sessions';

  @override
  String get failed_sessions_label => 'Failed sessions';

  @override
  String get statistics_tab_title => 'Statistiche';

  @override
  String get screen_segment_label => 'Screen';

  @override
  String get data_segment_label => 'Dati';

  @override
  String get mobile_label => 'Dati Mobili';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'App più usate';

  @override
  String get show_all_apps_tile_title => 'Mostra tutte le app';

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
  String get short_content_heading => 'Contenuti brevi';

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
  String get adult_content_heading => 'Contenuti per adulti';

  @override
  String get block_nsfw_title => 'Blocca NSFW';

  @override
  String get block_nsfw_subtitle =>
      'Restrict browsers from opening adult and porn websites.';

  @override
  String get block_nsfw_dialog_info =>
      'Are you sure? This action is irreversible. Once adult sites blocker is turned ON, you cannot turn it OFF as long as this app is installed on your device.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Blocca comunque';

  @override
  String get blocked_websites_heading => 'Siti bloccati';

  @override
  String get blocked_websites_empty_list_hint =>
      'Click on \'+ Add Website\' button to add distracting websites which you wish to block.';

  @override
  String get add_website_fab_button => 'Aggiungi sito';

  @override
  String get add_website_dialog_title => 'Distracting website';

  @override
  String get add_website_dialog_info =>
      'Inserisci l\'indirizzo del sito che vuoi bloccare.';

  @override
  String get add_website_dialog_is_nsfw => 'Is nsfw site?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Warning: Nsfw sites cannot be removed once added.';

  @override
  String get add_website_dialog_button_block => 'Blocca';

  @override
  String get add_website_already_exist_snack_alert =>
      'The URL has already been added to the list of blocked websites.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Invalid URL! Unable to parse the host name.';

  @override
  String get remove_website_dialog_title => 'Rimuovi sito';

  @override
  String remove_website_dialog_info(String websitehost) {
    return 'Are you sure? you want to remove \'$websitehost\' from blocked websites.';
  }

  @override
  String get focus_session_duration_tile_title => 'Session duration';

  @override
  String get focus_session_duration_dialog_info =>
      'Please select the desired duration for this focus session, determining how long you wish to remain focused and distraction-free.';

  @override
  String get timeline_tab_title => 'Cronologia';

  @override
  String get calender_heading => 'Calendario';

  @override
  String get focus_session_tile_timestamp_label => 'Timestamp';

  @override
  String get focus_session_tile_duration_label => 'Durata';

  @override
  String get focus_session_tile_reflection_label => 'Reflection';

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
  String get emergency_fab_button => 'Emergenza';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'This action will pause the app blocker for next 5 minutes. You have $leftPassesCount passes left. After using all passes, the app will stay blocked until midnight, or the active focus session ends.\n\nDo you still wish to proceed?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Usa comunque';

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
  String get app_limit_status_not_set => 'Non impostato';

  @override
  String get app_timer_tile_title => 'Timer app';

  @override
  String get app_timer_picker_dialog_info =>
      'Set a daily time limit for this app. Once your limit is reached, the app will be paused until midnight.';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => 'Limite di avvii';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Launched $count times today.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Set how many times you can open this app each day. Once the limit is reached, it will be paused until midnight.';

  @override
  String get app_active_period_tile_title => 'Periodo di attività';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'From $startTime to $endTime';
  }

  @override
  String get internet_access_tile_title => 'Accesso a Internet';

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
  String get launch_app_tile_title => 'Lancia app';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Apri $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Vai alle impostazioni';

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
  String get theme_mode_system_label => 'Sistema';

  @override
  String get theme_mode_light_label => 'Chiaro';

  @override
  String get theme_mode_dark_label => 'Scuro';

  @override
  String get material_color_tile_title => 'Colore Material';

  @override
  String get amoled_dark_tile_title => 'Scuro AMOLED';

  @override
  String get amoled_dark_tile_subtitle =>
      'Use pure black color for the dark theme.';

  @override
  String get dynamic_colors_tile_title => 'Dynamic colors';

  @override
  String get dynamic_colors_tile_subtitle => 'Use device colors if supported.';

  @override
  String get defaults_heading => 'Default';

  @override
  String get app_language_tile_title => 'Lingua applicazione';

  @override
  String get default_home_tab_tile_title => 'Home tab';

  @override
  String get usage_history_tile_title => 'Usage history';

  @override
  String get usage_history_15_days => '15 giorni';

  @override
  String get usage_history_1_month => '1 mese';

  @override
  String get usage_history_3_month => '3 mesi';

  @override
  String get usage_history_6_month => '6 mesi';

  @override
  String get usage_history_1_year => '1 anno';

  @override
  String get service_heading => 'Servizio';

  @override
  String get service_stopping_warning =>
      'If Mindful stops working unexpectedly, please grant the \'Ignore Battery Optimization\' permission to keep it running in the background. If the issue continues, try whitelisting Mindful for uninterrupted performance.';

  @override
  String get whitelist_app_tile_title => 'Whitelist Mindful';

  @override
  String get whitelist_app_tile_subtitle =>
      'Permetti a Mindful di avviarsi automaticamente.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Questo dispositivo non supporta la gestione dell\'avvio automatico.';

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
  String get crash_logs_heading => 'Report di arresto';

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
  String get crash_logs_clear_tile_title => 'Cancella report';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Cancella tutti i report di arresto dal database.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Confermi la cancellazione dei report dal database?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'Pulisci comunque';

  @override
  String get about_tab_title => 'Su di noi';

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
  String get contribute_heading => 'Contribuisci';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Esplora il codice sorgente.';

  @override
  String get report_issue_tile_title => 'Segnala un problema';

  @override
  String get suggest_idea_tile_title => 'Suggerisci un\'idea';

  @override
  String get write_email_tile_title => 'Scrivici via e-mail';

  @override
  String get write_email_tile_subtitle =>
      'Sarai reindirizzato al tuo client mail.';

  @override
  String get privacy_policy_heading => 'Privacy policy';

  @override
  String get privacy_policy_info =>
      'Mindful is committed to protecting your privacy. We do not collect, store, or transfer any type of user data. The app operates entirely offline and does not require an internet connection, ensuring that your personal information remains private and secure on your device. As a Free and Open Source Software (FOSS) application, Mindful guarantees complete transparency and user control over their data.';

  @override
  String get more_details_button => 'Più dettagli';
}
