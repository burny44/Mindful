// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get mindful_tagline => '聚焦重要的事';

  @override
  String get permission_status_off => '关';

  @override
  String get permission_status_allowed => '允许';

  @override
  String get permission_status_not_allowed => '不允许';

  @override
  String get permission_button_grant_permission => '授权';

  @override
  String get permission_button_agree_and_continue => '同意并继续';

  @override
  String get permission_button_not_now => '稍后再说';

  @override
  String get permission_button_help => '帮助？';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful 安全且不使用互联网。我们不收集或存储任何个人数据。';

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
    return '1. 点击 $button_label 按钮。';
  }

  @override
  String get permission_grant_step_two => '2. 请在下一个屏幕中选择 Mindful。';

  @override
  String get permission_grant_step_three => '3. 点击并开启如下开关。';

  @override
  String get permission_notification_title => '发送通知';

  @override
  String get permission_alarms_title => '闹钟和提醒';

  @override
  String get permission_alarms_info =>
      '请授予设置提醒和提醒的权限。 这将使您能够及时启动您的床上时间表，并且每天午夜重置应用程序计时器，并帮助您保持正常状态。';

  @override
  String get permission_alarms_device_tile_label => '允许设置闹钟和提醒';

  @override
  String get permission_usage_title => '使用访问';

  @override
  String get permission_usage_info =>
      '请授予使用访问权限。这将允许Mindful监控应用使用情况并管理对某些应用的访问，确保更专注和受控的数字环境。';

  @override
  String get permission_usage_device_tile_label => '允许使用访问';

  @override
  String get permission_overlay_title => '显示叠加层';

  @override
  String get permission_overlay_info =>
      '请授予显示叠加层权限。这将允许Mindful在暂停的应用打开时显示叠加层，帮助您保持专注并维持您的日程安排。';

  @override
  String get permission_overlay_device_tile_label => '允许在其他应用上显示';

  @override
  String get permission_accessibility_title => '无障碍';

  @override
  String get permission_accessibility_info =>
      '请授予无障碍权限。这将允许Mindful限制社交媒体应用和浏览器中的短视频内容（例如Reels、Shorts）访问，并过滤不当网站。';

  @override
  String get permission_accessibility_required => 'Mindful需要无障碍权限才能有效阻止短内容和网站。';

  @override
  String get permission_accessibility_device_tile_label => '使用Mindful';

  @override
  String get permission_battery_optimization_tile_title => '忽略电池优化';

  @override
  String get permission_battery_optimization_status_enabled => '已解除限制';

  @override
  String get permission_battery_optimization_status_disabled => '禁用后台限制';

  @override
  String get permission_battery_optimization_allow_info =>
      '允许\'忽略电池优化\'将在某些设备上自动授予\'闹钟和提醒\'权限。';

  @override
  String get permission_vpn_title => '创建VPN';

  @override
  String get permission_vpn_info =>
      '请授予创建虚拟专用网络（VPN）连接的权限。这将使Mindful能够通过在设备上创建本地VPN来限制指定应用程序的互联网访问。';

  @override
  String get permission_notification_access_title => '通知访问';

  @override
  String get permission_notification_access_info =>
      '请授予通知访问权限。这将允许Mindful组织您的通知并按照您的日程安排进行交付。';

  @override
  String get permission_notification_access_required =>
      'Mindful需要通知访问权限来批量和安排通知。';

  @override
  String get permission_notification_access_device_tile_label => '允许通知访问';

  @override
  String get day_today => '今天';

  @override
  String get day_yesterday => '昨天';

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
  String get time_separator_and => 'and';

  @override
  String get timer_status_active => '活动中';

  @override
  String get timer_status_paused => '暂停';

  @override
  String get create_button => '创建';

  @override
  String get update_button => '更新';

  @override
  String get dialog_button_cancel => '取消';

  @override
  String get dialog_button_remove => '移除';

  @override
  String get dialog_button_set => '设置';

  @override
  String get dialog_button_reset => '重置';

  @override
  String get dialog_button_infinite => '无限';

  @override
  String get schedule_start_label => '开始';

  @override
  String get schedule_end_label => '结束';

  @override
  String get development_dialog_info =>
      'Mindful 目前处于开发阶段，可能存在漏洞或不完整的功能。如果您遇到任何问题，请报告以帮助我们改进。\n\n感谢您的反馈！';

  @override
  String get development_dialog_button_report_issue => '报告问题';

  @override
  String get development_dialog_button_close => '关闭';

  @override
  String get quick_actions_heading => '快速操作';

  @override
  String get select_distracting_apps_heading => '选择分散注意力的应用';

  @override
  String get your_distracting_apps_heading => '您的分散注意力应用';

  @override
  String get select_more_apps_heading => '选择更多应用';

  @override
  String get imp_distracting_apps_snack_alert => '不允许将重要系统应用添加到分散注意力的应用列表中。';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      '此应用的屏幕使用和限制不可用，目前仅可访问网络使用情况';

  @override
  String get active_period_info => '设置允许访问的时间段。超出此时间范围，访问将受到限制。';

  @override
  String get donation_card_title => '支持我们';

  @override
  String get donation_card_info =>
      'Mindful 是免费且开源的，经过数月的奉献开发。如果它对您有帮助，您的捐款将对我们意义重大。每一份贡献都帮助我们继续改进和维护它，以造福所有人。';

  @override
  String get operation_failed_snack_alert => '操作失败，出了问题！';

  @override
  String get donation_card_button_donate => '捐赠';

  @override
  String get app_restart_dialog_title => '需要重启';

  @override
  String get app_restart_dialog_info => 'Mindful 将在倒计时结束后自动重启。请耐心等待，应用正在应用更改。';

  @override
  String get onboarding_skip_btn_label => '跳过';

  @override
  String get onboarding_finish_setup_btn_label => '完成设置';

  @override
  String get onboarding_page_one_title => '掌握专注。';

  @override
  String get onboarding_page_one_info =>
      '暂停分散注意力的应用，屏蔽短内容，并通过可定制的专注会话保持在正轨上。不论你是在工作、学习或放松，Mindful都能帮助你保持控制。';

  @override
  String get onboarding_page_two_title => '屏蔽干扰。';

  @override
  String get onboarding_page_two_info =>
      '设置使用限制，自动暂停应用，并创建更健康的数字习惯。使用睡前模式放松并享受无干扰的夜晚。';

  @override
  String get onboarding_page_three_title => '以隐私为首要。';

  @override
  String get onboarding_page_three_info =>
      'Mindful 是 100% 开源的，并且完全离线运行。我们不收集或分享您的个人数据——您的隐私在每个方面都得到保证。';

  @override
  String get onboarding_page_permissions_title => '必要权限。';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful 需要以下必要权限来跟踪和管理您的屏幕时间，帮助减少干扰并提高专注度。';

  @override
  String get dashboard_tab_title => '仪表盘';

  @override
  String get focus_now_fab_button => '立即专注';

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
  String get welcome_greetings => '欢迎回来，';

  @override
  String get username_snack_alert => '长按编辑用户名。';

  @override
  String get username_dialog_title => '用户名';

  @override
  String get username_dialog_info => '输入将在仪表盘上显示的用户名。';

  @override
  String get username_dialog_button_apply => '应用';

  @override
  String get restrictions_heading => '限制';

  @override
  String get apps_blocking_tile_title => '应用屏蔽';

  @override
  String get apps_blocking_tile_subtitle => '以多种方式限制应用。';

  @override
  String get websites_blocking_tile_subtitle => '限制成人和自定义网站。';

  @override
  String get screen_time_label => '屏幕时间';

  @override
  String get longest_streak_label => '最长连续记录';

  @override
  String get current_streak_label => '当前连续记录';

  @override
  String get successful_sessions_label => '成功会话';

  @override
  String get failed_sessions_label => '失败会话';

  @override
  String get statistics_tab_title => '统计';

  @override
  String get screen_segment_label => '屏幕';

  @override
  String get data_segment_label => '数据';

  @override
  String get mobile_label => '移动';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => '最常用应用';

  @override
  String get show_all_apps_tile_title => '显示所有应用';

  @override
  String get search_apps_hint => '搜寻应用……';

  @override
  String get notifications_tab_title => '通知';

  @override
  String get notifications_tab_info =>
      '批量处理来自应用的通知，并设置每天的早晨、中午、下午和晚上的时间表。无需不断打断即可保持更新。';

  @override
  String get batched_apps_tile_title => '批量应用';

  @override
  String get batch_recap_dropdown_title => '批量概括类型';

  @override
  String get batch_recap_dropdown_info => '选择触发计划时要推送的内容。\n所有通知或仅摘要。';

  @override
  String get batch_recap_option_summery_only => '摘要而已';

  @override
  String get batch_recap_option_all_notifications => '所有通知';

  @override
  String get notification_history_tile_title => '通知历史';

  @override
  String get store_all_tile_title => '储存所有通知';

  @override
  String get store_all_tile_subtitle => '一并保存未分组通知。';

  @override
  String get schedules_heading => '时间表';

  @override
  String get new_schedule_fab_button => '新建时间表';

  @override
  String get new_schedule_dialog_info => '为通知时间表输入一个名称，以便于识别。';

  @override
  String get new_schedule_dialog_field_label => '时间表名称';

  @override
  String get shorts_blocking_tab_title => '短视频阻止';

  @override
  String get shorts_blocking_tab_info =>
      '控制您在Instagram、YouTube、Snapchat和Facebook等平台上花费在短内容上的时间，包括它们的网站。';

  @override
  String get short_content_heading => '短内容';

  @override
  String shorts_time_left_from(String timeShortString) {
    return '剩余 $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      '为短内容设置每日时间限制。一旦达到限制，短内容将在午夜前暂停。';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle => '限制Instagram的功能。';

  @override
  String get instagram_features_block_reels => '限制视频段部分。';

  @override
  String get instagram_features_block_explore => '限制发现部分。';

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
  String get snapchat_features_tile_subtitle => '限制Snapchat的功能。';

  @override
  String get snapchat_features_block_spotlight => '限制聚光灯部分。';

  @override
  String get snapchat_features_block_discover => '限制发现部分。';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle => '限制YouTube的短视频。';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => '限制Facebook的视频段。';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => '限制Reddit的短视频。';

  @override
  String get websites_blocking_tab_title => '网站屏蔽';

  @override
  String get websites_blocking_tab_info =>
      '屏蔽成人网站和自定义网站，以创建更安全、更专注的在线体验。掌控你的浏览，保持无干扰。';

  @override
  String get adult_content_heading => '成人内容';

  @override
  String get block_nsfw_title => '屏蔽NSFW';

  @override
  String get block_nsfw_subtitle => '限制浏览器打开成人和色情网站。';

  @override
  String get block_nsfw_dialog_info =>
      '确定吗？此操作不可逆。只要应用程序安装在设备上，启用成人网站屏蔽后就无法关闭。';

  @override
  String get block_nsfw_dialog_button_block_anyway => '仍然屏蔽';

  @override
  String get blocked_websites_heading => '已屏蔽的网站';

  @override
  String get blocked_websites_empty_list_hint =>
      '点击 \'+ 添加网站\' 按钮添加你想屏蔽的分散注意力的网站。';

  @override
  String get add_website_fab_button => '添加网站';

  @override
  String get add_website_dialog_title => '分散注意力的网站';

  @override
  String get add_website_dialog_info => '输入你想屏蔽的网站的URL。';

  @override
  String get add_website_dialog_is_nsfw => '是否为NSFW网站？';

  @override
  String get add_website_dialog_nsfw_warning => '警告：添加后NSFW网站无法移除。';

  @override
  String get add_website_dialog_button_block => '屏蔽';

  @override
  String get add_website_already_exist_snack_alert => '该URL已添加到已屏蔽的网站列表中。';

  @override
  String get add_website_invalid_url_snack_alert => '无效的URL！无法解析主机名。';

  @override
  String get remove_website_dialog_title => '移除网站';

  @override
  String remove_website_dialog_info(String websitehost) {
    return '确定吗？你想从已屏蔽的网站中移除 \'$websitehost\'。';
  }

  @override
  String get focus_session_duration_tile_title => '会话时长';

  @override
  String get focus_session_duration_dialog_info =>
      '请选择此次专注会话的期望时长，以确定你希望保持专注和无干扰的时间长度。';

  @override
  String get timeline_tab_title => '时间轴';

  @override
  String get calender_heading => '日历';

  @override
  String get focus_session_tile_timestamp_label => '时间线';

  @override
  String get focus_session_tile_duration_label => '时长';

  @override
  String get focus_session_tile_reflection_label => '反映';

  @override
  String get active_session_reflection_dialog_title => '会话反思';

  @override
  String get active_session_reflection_dialog_info =>
      '花一点时间反思一下你的进展。\n你这次会议的目标是什么？你在这次会议中取得了哪些成果？';

  @override
  String get active_session_reflection_dialog_tip => '小提示：您可以随时在会话时间线中编辑此内容。';

  @override
  String get notifications_empty_list_hint => '今日没有被批量处理的通知。';

  @override
  String get conversations_label => '会话';

  @override
  String get last_24_hours_heading => '过去24小时';

  @override
  String get notification_timeline_tab_info =>
      '从日历中选择日期浏览您的通知记录。看看是哪些应用吸引了您的注意力，并反思您的使用习惯。';

  @override
  String get monthly_label => '每月';

  @override
  String get daily_label => '每日';

  @override
  String get search_notifications_sheet_info =>
      '使用标题或内容以方便的寻找过往的通知。帮助你快速找到重要的通知。';

  @override
  String get search_notifications_hint => '寻找通知……';

  @override
  String get search_notifications_empty_list_hint => '没有与你的搜索匹配的通知。';

  @override
  String get app_info_none_warning => '无法找到给定包名的应用程序。返回主屏幕。';

  @override
  String get emergency_fab_button => '紧急';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return '此操作将暂停应用程序阻止器5分钟。您还剩 $leftPassesCount 次机会。使用完所有机会后，应用程序将保持阻止状态，直到午夜或当前专注会话结束。\n\n您仍然要继续吗？';
  }

  @override
  String get emergency_dialog_button_use_anyway => '无论如何使用';

  @override
  String get emergency_started_snack_alert => '应用程序阻止器已暂停，并将在5分钟后恢复阻止。';

  @override
  String get emergency_already_active_snack_alert =>
      '应用程序阻止器当前处于暂停或非活动状态。如果启用了通知，您将收到有关剩余时间的更新。';

  @override
  String get emergency_no_pass_left_snack_alert =>
      '您已经使用了所有紧急通行证。被阻止的应用程序将保持阻止状态，直到午夜或当前专注会话结束。';

  @override
  String get app_limit_status_not_set => '未设置';

  @override
  String get app_timer_tile_title => '应用程序定时器';

  @override
  String get app_timer_picker_dialog_info =>
      '为此应用程序设置每日时间限制。一旦达到限制，应用程序将暂停，直到午夜。';

  @override
  String get usage_reminders_tile_title => '使用提醒';

  @override
  String get usage_reminders_tile_subtitle => '使用定时应用程序时获得提醒。';

  @override
  String get app_launch_limit_tile_title => '启动限制';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return '今天已启动 $count 次。';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      '设置每天可以打开此应用程序的次数。一旦达到限制，应用程序将暂停，直到午夜。';

  @override
  String get app_active_period_tile_title => '活动周期';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return '从 $startTime 到 $endTime';
  }

  @override
  String get internet_access_tile_title => '互联网访问';

  @override
  String get internet_access_tile_subtitle => '关闭以阻止应用程序访问互联网。';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return '$appName 的互联网已被阻止。';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return '$appName 的互联网访问已解除限制。';
  }

  @override
  String get launch_app_tile_title => '启动应用';

  @override
  String launch_app_tile_subtitle(String appName) {
    return '打开 $appName。';
  }

  @override
  String get go_to_app_settings_tile_title => '前往应用设置';

  @override
  String get go_to_app_settings_tile_subtitle => '管理应用设置，如通知、权限、存储等。';

  @override
  String get include_in_stats_tile_title => '包含在屏幕使用统计中';

  @override
  String get include_in_stats_tile_subtitle => '关闭后将排除此应用在总屏幕使用统计中。';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName 已排除在总屏幕使用统计之外。';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName 已加入总屏幕使用统计中。';
  }

  @override
  String get general_tab_title => '通用';

  @override
  String get appearance_heading => '外观';

  @override
  String get theme_mode_tile_title => '主题模式';

  @override
  String get theme_mode_system_label => '系统';

  @override
  String get theme_mode_light_label => '浅色';

  @override
  String get theme_mode_dark_label => '深色';

  @override
  String get material_color_tile_title => 'Material 颜色';

  @override
  String get amoled_dark_tile_title => 'AMOLED 深色';

  @override
  String get amoled_dark_tile_subtitle => '使用纯黑色作为深色主题。';

  @override
  String get dynamic_colors_tile_title => '动态颜色';

  @override
  String get dynamic_colors_tile_subtitle => '如果支持，则使用设备颜色。';

  @override
  String get defaults_heading => '默认设置';

  @override
  String get app_language_tile_title => '应用语言';

  @override
  String get default_home_tab_tile_title => '主页标签';

  @override
  String get usage_history_tile_title => '使用历史';

  @override
  String get usage_history_15_days => '15 天';

  @override
  String get usage_history_1_month => '1 个月';

  @override
  String get usage_history_3_month => '3 个月';

  @override
  String get usage_history_6_month => '6 个月';

  @override
  String get usage_history_1_year => '1 年';

  @override
  String get service_heading => '服务';

  @override
  String get service_stopping_warning =>
      '如果 Mindful 意外停止工作，请授予“忽略电池优化”权限以保持后台运行。如果问题持续，请将 Mindful 加入白名单以获得无间断性能。';

  @override
  String get whitelist_app_tile_title => '将 Mindful 加入白名单';

  @override
  String get whitelist_app_tile_subtitle => '允许 Mindful 自动启动。';

  @override
  String get whitelist_app_unsupported_snack_alert => '该设备不支持自动启动管理。';

  @override
  String get database_tab_title => '数据库';

  @override
  String get import_db_tile_title => '导入数据库';

  @override
  String get import_db_tile_subtitle => '从文件导入数据库';

  @override
  String get export_db_tile_title => '导出数据库';

  @override
  String get export_db_tile_subtitle => '将数据库导出至文件';

  @override
  String get crash_logs_heading => '崩溃日志';

  @override
  String get crash_logs_info =>
      '若遇到任何问题，您可将日志文件提交至GitHub进行反馈。该文件包含设备制造商、型号、Android版本、SDK版本及崩溃日志等信息，这些数据将帮助我们更有效地定位并解决问题。';

  @override
  String get crash_logs_export_tile_title => '导出崩溃日志';

  @override
  String get crash_logs_export_tile_subtitle => '将崩溃日志导出至json文件';

  @override
  String get crash_logs_view_tile_title => '查看日志';

  @override
  String get crash_logs_view_tile_subtitle => '浏览存储的崩溃日志';

  @override
  String get crash_logs_empty_list_hint => '当前暂无崩溃日志记录';

  @override
  String get crash_logs_clear_tile_title => '清除日志';

  @override
  String get crash_logs_clear_tile_subtitle => '从数据库中删除所有崩溃日志';

  @override
  String get crash_logs_clear_dialog_info => '确定要从数据库中清除所有崩溃日志吗？';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => '无论如何清除';

  @override
  String get about_tab_title => '关于';

  @override
  String get changelog_tile_title => '更新日志';

  @override
  String get changelog_tile_subtitle => '了解最新变化。';

  @override
  String get full_changelog_tile_title => '完整更新日志';

  @override
  String get redirected_to_github_subtitle => '您将被重定向到 GitHub。';

  @override
  String get contribute_heading => '贡献';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => '查看源代码。';

  @override
  String get report_issue_tile_title => '报告问题';

  @override
  String get suggest_idea_tile_title => '提出建议';

  @override
  String get write_email_tile_title => '通过电子邮件联系我们';

  @override
  String get write_email_tile_subtitle => '您将被重定向到电子邮件应用。';

  @override
  String get privacy_policy_heading => '隐私政策';

  @override
  String get privacy_policy_info =>
      'Mindful 致力于保护您的隐私。我们不收集、存储或传输任何类型的用户数据。该应用完全离线运行，不需要互联网连接，确保您的个人信息在您的设备上保持私密和安全。作为免费开源软件 (FOSS) 应用，Mindful 保证对用户数据的完全透明度和用户控制。';

  @override
  String get more_details_button => '更多详情';
}
