// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get mindful_tagline => '本当に大切なことに集中しよう';

  @override
  String get permission_status_off => 'オフ';

  @override
  String get permission_status_allowed => 'アクセス可能';

  @override
  String get permission_status_not_allowed => 'アクセス不可';

  @override
  String get permission_button_grant_permission => 'アクセスを許可する';

  @override
  String get permission_button_agree_and_continue => '同意して続ける';

  @override
  String get permission_button_not_now => '後で';

  @override
  String get permission_button_help => 'ヘルプ';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful は100%安全で、オフラインでも動作します。個人情報の収集または保存をすることはありません。';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. $button_label を選択してください。';
  }

  @override
  String get permission_grant_step_two => '2. 次の画面で Mindful を選択してください。';

  @override
  String get permission_grant_step_three => '3. 下記を参考に、切り替えを選択して有効にしてください。';

  @override
  String get permission_notification_title => '通知を受け取る';

  @override
  String get permission_alarms_title => 'アラームとリマインダー';

  @override
  String get permission_alarms_info =>
      'Mindful が就寝スケジュールとアプリタイマーを管理できるように、アラームとリマインダーへのアクセスを許可してください。';

  @override
  String get permission_alarms_device_tile_label => 'アラームとリマインダーの設定を許可する';

  @override
  String get permission_usage_title => '使用状況';

  @override
  String get permission_usage_info =>
      'Mindful がアプリの使用状況を把握し、アプリの利用時間を管理できるように、使用状況へのアクセスを許可してください。';

  @override
  String get permission_usage_device_tile_label => '使用状況へのアクセス許可';

  @override
  String get permission_overlay_title => '他のアプリの上に重ねて表示';

  @override
  String get permission_overlay_info =>
      'Mindful が利用時間を超えたアプリを制限できるように、他のアプリの上に重ねて表示を許可してください。';

  @override
  String get permission_overlay_device_tile_label => '他のアプリの上に重ねて表示できるようにする';

  @override
  String get permission_accessibility_title => 'ユーザー補助';

  @override
  String get permission_accessibility_info =>
      'リール・ショート動画へのアクセス制限や不適切なSNS・ウェブサイトのブロックをするために、ユーザー補助を有効にしてください。';

  @override
  String get permission_accessibility_required =>
      'Mindful がショートコンテンツやウェブサイトを効果的にブロックするには、ユーザー補助の権限が必要です。';

  @override
  String get permission_accessibility_device_tile_label => 'Mindful の使用';

  @override
  String get permission_battery_optimization_tile_title => 'バッテリー最適化を無視する';

  @override
  String get permission_battery_optimization_status_enabled => 'バックグラウンドで動作中';

  @override
  String get permission_battery_optimization_status_disabled =>
      'バックグラウンドで動作していません';

  @override
  String get permission_battery_optimization_allow_info =>
      '「バッテリー最適化を無視する」を許可すると、一部のデバイスでは「アラームとリマインダー」の権限が自動的に付与されます。';

  @override
  String get permission_vpn_title => 'VPNを作成';

  @override
  String get permission_vpn_info =>
      'Mindful がアプリのインターネットアクセスを制限するために、仮想プライベートネットワーク（VPN）接続の作成を許可してください。';

  @override
  String get permission_notification_access_title => '通知へのアクセス';

  @override
  String get permission_notification_access_info =>
      '通知へのアクセス権限を許可してください。これにより、Mindful が通知を整理し、あなたのスケジュールに合わせて通知を配信できるようになります。';

  @override
  String get permission_notification_access_required =>
      'Mindful が通知をまとめてスケジュール配信するには、通知へのアクセス権限が必要です。';

  @override
  String get permission_notification_access_device_tile_label => '通知へのアクセスを許可';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 時間',
      one: '1 時間',
      zero: '0 時間',
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
      other: '$countString 分',
      one: '1 分',
      zero: '0 分',
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
      other: '$countString 秒',
      one: '1 秒',
      zero: '0 秒',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'と';

  @override
  String get timer_status_paused => '一時停止';

  @override
  String get create_button => '作成';

  @override
  String get update_button => '更新';

  @override
  String get dialog_button_cancel => 'キャンセル';

  @override
  String get dialog_button_remove => '削除';

  @override
  String get dialog_button_set => '設定';

  @override
  String get dialog_button_reset => 'リセット';

  @override
  String get dialog_button_infinite => '無制限';

  @override
  String get schedule_start_label => '開始';

  @override
  String get schedule_end_label => '終了';

  @override
  String get quick_actions_heading => '簡単操作';

  @override
  String get select_distracting_apps_heading => '使用制限するアプリを選択';

  @override
  String get your_distracting_apps_heading => '使用制限中のアプリ';

  @override
  String get select_more_apps_heading => 'さらにアプリを選択';

  @override
  String get imp_distracting_apps_snack_alert => 'システムアプリは使用制限アプリに追加できません。';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'このアプリでは、ネットワークの使用状況のみ確認できます。画面の使用状況と制限機能は現在ご利用いただけません。';

  @override
  String get active_period_info =>
      'アクセスを許可する時間帯を設定してください。この時間帯以外では、アクセスが制限されます。';

  @override
  String get donation_card_title => '開発を支援する';

  @override
  String get donation_card_info =>
      'Mindful は、数ヶ月の開発期間を経て、無料で公開しています。このアプリをより多くの人々に届け、改善し続けるために、皆様からの温かいご支援をお待ちしています。';

  @override
  String get operation_failed_snack_alert => 'エラーが発生し、操作を完了できませんでした。';

  @override
  String get donation_card_button_donate => '寄付する';

  @override
  String get app_restart_dialog_title => '再起動してください';

  @override
  String get app_restart_dialog_info =>
      'カウントダウン終了後、Mindful は自動的に再起動します。変更の適用には少し時間がかかりますので、お待ちください。';

  @override
  String get onboarding_skip_btn_label => 'スキップ';

  @override
  String get onboarding_finish_setup_btn_label => '設定終了';

  @override
  String get onboarding_page_one_title => '集中力を持続させる';

  @override
  String get onboarding_page_one_info =>
      'Mindful で集中力をマスターしましょう。気が散るアプリやショートコンテンツをブロックし、あなただけの集中時間を作り出します。';

  @override
  String get onboarding_page_two_title => '邪魔をブロック';

  @override
  String get onboarding_page_two_info =>
      'アプリの使用制限を設定し、自動的にアプリを一時停止し、より健全なデジタル習慣を身につけましょう。サイレントモードを使用して、リラックスして邪魔のない夜を楽しみましょう。';

  @override
  String get onboarding_page_three_title => 'プライバシー重視';

  @override
  String get onboarding_page_three_info =>
      'Mindful は、あなたのプライバシーを最優先に考えています。アプリは100%オープンソースで、オフラインで動作するため、個人情報は一切収集されません。';

  @override
  String get onboarding_page_permissions_title => '必要な権限';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful が画面の使用時間を追跡・管理し、集中力を高めるために必要な権限は以下のとおりです。';

  @override
  String get dashboard_tab_title => 'ダッシュボード';

  @override
  String get focus_now_fab_button => '今すぐ集中';

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
  String get welcome_greetings => 'おかえりなさい';

  @override
  String get username_snack_alert => 'ユーザー名を編集するには長押ししてください。';

  @override
  String get username_dialog_title => 'ユーザー名';

  @override
  String get username_dialog_info => 'ダッシュボードに表示されるユーザー名を入力してください。';

  @override
  String get username_dialog_button_apply => '保存';

  @override
  String get restrictions_heading => 'アプリの制限';

  @override
  String get apps_blocking_tile_title => 'アプリのブロック';

  @override
  String get apps_blocking_tile_subtitle => '複数の方法でアプリを制限します。';

  @override
  String get websites_blocking_tile_subtitle => 'アダルトサイトやカスタムウェブサイトを制限します。';

  @override
  String get screen_time_label => '使用時間';

  @override
  String get statistics_tab_title => '統計データ';

  @override
  String get screen_segment_label => '使用時間';

  @override
  String get data_segment_label => 'データ使用量';

  @override
  String get mobile_label => 'モバイル';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'よく使うアプリ';

  @override
  String get show_all_apps_tile_title => 'すべてのアプリを表示';

  @override
  String get search_apps_hint => 'Search apps...';

  @override
  String get notifications_tab_title => '通知';

  @override
  String get notifications_tab_info =>
      'アプリからの通知をまとめて、朝、昼、夕方、夜などのスケジュールを設定します。常に中断されることなく、必要な情報を得られます。';

  @override
  String get batched_apps_tile_title => '通知をまとめるアプリ';

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
  String get schedules_heading => 'スケジュール';

  @override
  String get new_schedule_fab_button => '新しいスケジュール';

  @override
  String get new_schedule_dialog_info => '通知スケジュールの名前を入力して、簡単に識別できるようにしてください。';

  @override
  String get new_schedule_dialog_field_label => 'スケジュール名';

  @override
  String get shorts_blocking_tab_title => 'ショート動画ブロック';

  @override
  String get shorts_blocking_tab_info =>
      'Instagram、YouTube、Snapchat、Facebookなどのプラットフォームやそのウェブサイトで、ショート動画に費やす時間をコントロールできます。';

  @override
  String get short_content_heading => 'ショート動画';

  @override
  String shorts_time_left_from(String timeShortString) {
    return '残りあと $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'ショート動画の毎日の利用時間を制限できます。制限時間に達すると、深夜0時までショート動画は視聴できなくなります。';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle => 'Instagramの機能を制限します。';

  @override
  String get instagram_features_block_reels => 'リールセクションを制限します。';

  @override
  String get instagram_features_block_explore => '探索セクションを制限します。';

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
  String get snapchat_features_tile_subtitle => 'Snapchatの機能を制限します。';

  @override
  String get snapchat_features_block_spotlight => 'スポットライトセクションを制限します。';

  @override
  String get snapchat_features_block_discover => 'ディスカバーセクションを制限します。';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle => 'YouTubeのショート動画を制限します。';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => 'Facebookのリールを制限します。';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => 'Redditのショート動画を制限します。';

  @override
  String get websites_blocking_tab_title => 'ウェブサイトブロック';

  @override
  String get websites_blocking_tab_info =>
      'アダルトウェブサイトや任意のカスタムサイトをブロックして、より安全で集中できるオンライン環境を作成します。ブラウジングを管理し、気が散らないようにしましょう。';

  @override
  String get adult_content_heading => 'アダルトコンテンツ';

  @override
  String get block_nsfw_title => '職場閲覧注意をブロック';

  @override
  String get block_nsfw_subtitle => 'アダルトサイトやポルノサイトの閲覧を制限する';

  @override
  String get block_nsfw_dialog_info =>
      'この操作は元に戻せません。アダルトサイトブロッカーを有効にすると、このアプリがデバイスにインストールされている間は、無効にすることができなくなります。';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'ブロックする';

  @override
  String get blocked_websites_heading => 'ブロック済みのウェブサイト';

  @override
  String get blocked_websites_empty_list_hint =>
      '集中を妨げるウェブサイトをブロックするには、ウェブサイトを追加するボタンを選択してください。';

  @override
  String get add_website_fab_button => 'ウェブサイトを追加';

  @override
  String get add_website_dialog_title => '集中を妨げるウェブサイト';

  @override
  String get add_website_dialog_info => 'ブロックするウェブサイトのURLを入力してください。';

  @override
  String get add_website_dialog_is_nsfw => 'アダルトサイトですか？';

  @override
  String get add_website_dialog_nsfw_warning => '警告：アダルトサイトは一度追加すると削除できません。';

  @override
  String get add_website_dialog_button_block => 'ブロック';

  @override
  String get add_website_already_exist_snack_alert =>
      'このURLは既にブロック済みのウェブサイトに追加されています。';

  @override
  String get add_website_invalid_url_snack_alert => 'URLが無効です。ホスト名を確認してください。';

  @override
  String get focus_session_duration_tile_title => '集中する時間';

  @override
  String get focus_session_duration_dialog_info => '集中したい時間を選択してください。';

  @override
  String get timeline_tab_title => '使用履歴';

  @override
  String get calender_heading => 'カレンダー';

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
  String get last_24_hours_heading => '過去24時間';

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
  String get app_info_none_warning => '指定されたパッケージのアプリが見つかりませんでした。ホーム画面に戻ります。';

  @override
  String get emergency_fab_button => '緊急時の使用';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'アプリブロッカーを5分間一時停止しますか？残りパスは $leftPassesCount 回です。すべてのパスを使用すると、アプリは深夜まで、または有効な集中記録が終了するまでブロックされたままになります。';
  }

  @override
  String get emergency_dialog_button_use_anyway => '使用する';

  @override
  String get emergency_started_snack_alert =>
      'アプリブロッカーは一時停止されました。5分後にブロックが再開されます。';

  @override
  String get emergency_already_active_snack_alert =>
      'アプリブロッカーは現在一時停止中、または無効になっています。通知が有効な場合は、残り時間についてお知らせします。';

  @override
  String get emergency_no_pass_left_snack_alert =>
      '緊急時パスは残り0回です。ブロックされたアプリは、深夜または集中記録終了まで使用できません。';

  @override
  String get app_limit_status_not_set => '未設定';

  @override
  String get app_timer_tile_title => 'アプリタイマー';

  @override
  String get app_timer_picker_dialog_info =>
      'このアプリに毎日の使用時間の制限を設定しましょう。制限時間に達すると、アプリは深夜0時まで一時停止します。';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => '起動回数の制限';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return '今日は $count 回起動しました。';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      '毎日、アプリを起動できる回数を制限できます。制限回数を超えると、深夜0時までアプリは起動できなくなります。';

  @override
  String get app_active_period_tile_title => '使用可能な時間';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return '$startTime から $endTime まで';
  }

  @override
  String get internet_access_tile_title => 'インターネット接続';

  @override
  String get internet_access_tile_subtitle => 'オフにすると、アプリのインターネット接続を遮断します。';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return '$appName はインターネットに接続できません。';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return '$appName はインターネットに接続できます。';
  }

  @override
  String get launch_app_tile_title => 'アプリの起動';

  @override
  String launch_app_tile_subtitle(String appName) {
    return '$appName を開く';
  }

  @override
  String get go_to_app_settings_tile_title => '設定画面へ';

  @override
  String get go_to_app_settings_tile_subtitle => '通知や権限、ストレージなどのアプリ設定を管理します。';

  @override
  String get include_in_stats_tile_title => '使用時間に含める';

  @override
  String get include_in_stats_tile_subtitle =>
      'このアプリを合計使用時間から除外するには、オフにしてください。';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName は使用時間に含まれません。';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName は使用時間に含まれます。';
  }

  @override
  String get general_tab_title => '全般設定';

  @override
  String get appearance_heading => '外観';

  @override
  String get theme_mode_tile_title => 'カラーテーマ';

  @override
  String get theme_mode_system_label => 'システムに従う';

  @override
  String get theme_mode_light_label => 'ライトモード';

  @override
  String get theme_mode_dark_label => 'ダークモード';

  @override
  String get material_color_tile_title => '配色';

  @override
  String get amoled_dark_tile_title => 'AMOLED ダークモード';

  @override
  String get amoled_dark_tile_subtitle => 'ダークモードより深い黒色を使用';

  @override
  String get dynamic_colors_tile_title => 'ダイナミックカラー';

  @override
  String get dynamic_colors_tile_subtitle => '壁紙に合わせたカラーを使用';

  @override
  String get defaults_heading => '基本設定';

  @override
  String get app_language_tile_title => '言語設定';

  @override
  String get default_home_tab_tile_title => 'ホームタブ';

  @override
  String get usage_history_tile_title => '使用履歴';

  @override
  String get usage_history_15_days => '15日間';

  @override
  String get usage_history_1_month => '1ヶ月間';

  @override
  String get usage_history_3_month => '3ヶ月間';

  @override
  String get usage_history_6_month => '6ヶ月間';

  @override
  String get usage_history_1_year => '1年間';

  @override
  String get service_heading => 'サービス';

  @override
  String get service_stopping_warning =>
      'Mindfulが予期せず動作を停止した場合は、バッテリーの最適化を無視することを許可し、バックグラウンドで実行できるようにしてください。それでも問題が続く場合は、Mindfulを許可リストに登録して、動作を中断されないようにしてください。';

  @override
  String get whitelist_app_tile_title => 'Mindful を許可リストに追加';

  @override
  String get whitelist_app_tile_subtitle => 'Mindfulの自動起動を有効にする';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'このデバイスは自動起動の設定に対応していません。';

  @override
  String get database_tab_title => 'データベース';

  @override
  String get import_db_tile_title => 'データベースを読み込む';

  @override
  String get import_db_tile_subtitle => 'ファイルからデータベースを読み込む';

  @override
  String get export_db_tile_title => 'データベースを書き出す';

  @override
  String get export_db_tile_subtitle => 'データベースをファイルに保存';

  @override
  String get crash_logs_heading => 'クラッシュログ';

  @override
  String get crash_logs_info =>
      '問題が発生した場合は、GitHubにエラーレポートを添付して報告してください。エラーレポートには、デバイスのメーカー、モデル、Androidバージョン、SDKバージョン、クラッシュログなどの情報が含まれており、問題解決に役立ちます。';

  @override
  String get crash_logs_export_tile_title => 'エラーレポートを保存';

  @override
  String get crash_logs_export_tile_subtitle => 'エラーレポートをJSONファイルで書き出す';

  @override
  String get crash_logs_view_tile_title => 'ログを表示';

  @override
  String get crash_logs_view_tile_subtitle => '保存されたクラッシュログを確認します。';

  @override
  String get crash_logs_empty_list_hint => '現在までにクラッシュログはありません。';

  @override
  String get crash_logs_clear_tile_title => 'ログを削除';

  @override
  String get crash_logs_clear_tile_subtitle => 'すべてのクラッシュログを削除';

  @override
  String get crash_logs_clear_dialog_info =>
      'データベースからすべてのクラッシュログを削除してもよろしいですか？';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => '削除する';

  @override
  String get about_tab_title => '概要';

  @override
  String get changelog_tile_title => '変更履歴';

  @override
  String get changelog_tile_subtitle => '最新の変更点を確認できます。';

  @override
  String get full_changelog_tile_title => '完全な変更履歴';

  @override
  String get redirected_to_github_subtitle => 'GitHubに移動';

  @override
  String get contribute_heading => '貢献';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'ソースコードを確認';

  @override
  String get report_issue_tile_title => '問題を報告';

  @override
  String get suggest_idea_tile_title => 'アイデアを提案';

  @override
  String get write_email_tile_title => 'メールでご連絡';

  @override
  String get write_email_tile_subtitle => 'メールアプリを開く';

  @override
  String get privacy_policy_heading => 'プライバシーポリシー';

  @override
  String get privacy_policy_info =>
      'Mindfulはプライバシー保護に最優先で取り組んでいます。ユーザーデータの収集、保存、または第三者に提供することはありません。アプリは完全にオフラインで動作し、インターネット接続を必要としないため、ユーザーの個人情報はデバイス上で安全に保護されます。無料でオープンソースのソフトウェア（FOSS）であり、完全な透明性とユーザーによるデータの制御を保証します。';

  @override
  String get more_details_button => '詳細情報';
}
