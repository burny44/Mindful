// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get mindful_tagline => 'Фокусирај се на оно што је заиста важно';

  @override
  String get permission_status_off => 'Искључено';

  @override
  String get permission_status_allowed => 'Дозвољено';

  @override
  String get permission_status_not_allowed => 'Није дозвољено';

  @override
  String get permission_button_grant_permission => 'Дозволи';

  @override
  String get permission_button_agree_and_continue => 'Прихвати и настави';

  @override
  String get permission_button_not_now => 'Не сада';

  @override
  String get permission_button_help => 'Помоћ?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful је 100% сигуран и ради ван мреже. Не прикупљамо, нити чувамо било какве личне податке.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. Кликни на дугме $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Изабери Mindful на следећем екрану.';

  @override
  String get permission_grant_step_three =>
      '3. Кликни и укључи подешавање испод.';

  @override
  String get permission_notification_title => 'Пошаљи обавештења';

  @override
  String get permission_alarms_title => 'Аларми и подсетници';

  @override
  String get permission_alarms_info =>
      'Молимо те да одобриш дозволу за постављање аларма и подсећања. Ово ће омогућити Mindful да на време започне твој распоред за спавање. Такође, апликација ће дневно ресетовати тајмере у поноћ и помоћи ти да останеш на правом путу.';

  @override
  String get permission_alarms_device_tile_label =>
      'Омогући подешавање аларма и подсетника';

  @override
  String get permission_usage_title => 'Приступ коришћењу';

  @override
  String get permission_usage_info =>
      'Молимо дозволите приступ подацима о коришћењу. Ово ће омогућити да Mindful прати употребу апликација и управља приступом одређеним апликацијама, обезбеђујући фокусираније и контролисаније дигитално окружење.';

  @override
  String get permission_usage_device_tile_label => 'Дозволи приступ коришћењу';

  @override
  String get permission_overlay_title => 'Приказ преко других апликација';

  @override
  String get permission_overlay_info =>
      'Молимо одобрите дозволу за приказ преко других апликација. Ово ће омогућити апликацији да прикаже преклоп када се отвори паузирана апликација, што ће вам помоћи да останете фокусирани и придржавате се свог распореда.';

  @override
  String get permission_overlay_device_tile_label =>
      'Дозволи приказ преко других апликација';

  @override
  String get permission_accessibility_title => 'Приступачност';

  @override
  String get permission_accessibility_info =>
      'Молимо одобрите дозволу за приступачност. Ово ће омогућити апликацији Mindful да ограничи приступ кратком видео садржају (нпр. Reels, Shorts) у оквиру апликација друштвених мрежа и интернет прегледача, као и да филтрира непримерене веб-сајтове.';

  @override
  String get permission_accessibility_required =>
      'Mindful захтева дозволу за приступачност како би ефикасно блокирао кратки садржај и веб-сајтове.';

  @override
  String get permission_accessibility_device_tile_label => 'Користи Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Занемари оптимизацију батерије';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Већ неограничено';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Онемогући позадинска ограничења';

  @override
  String get permission_battery_optimization_allow_info =>
      'Дозвола за „Занемаривање оптимизације батерије“ на неким уређајима такође аутоматски омогућава приступ „Алармима и подсетницима“.';

  @override
  String get permission_vpn_title => 'Креирај VPN';

  @override
  String get permission_vpn_info =>
      'Одобри дозволу за креирање виртуелне приватне мреже (VPN). Ово ће омогућити апликацији Mindful да ограничи приступ интернету за одређене апликације креирањем локалне VPN мреже на уређају.';

  @override
  String get permission_notification_access_title => 'Приступ обавештењима';

  @override
  String get permission_notification_access_info =>
      'Молимо те да одобриш дозволу за приступ обавештењима. Ово ће омогућити Mindful да организује твоја обавештења и достави их по твом распореду.';

  @override
  String get permission_notification_access_required =>
      'Апликација Mindful захтева приступ обавештењима како би груписао и заказивао обавештења.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Дозволи приступ обавештењима';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString сати',
      one: '1 сат',
      zero: '0 сати',
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
      other: '$countString минута',
      one: '1 минута',
      zero: '0 минута',
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
      other: '$countString секунди',
      one: '1 секунда',
      zero: '0 секунди',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'и';

  @override
  String get timer_status_paused => 'Паузирано';

  @override
  String get create_button => 'Креирај';

  @override
  String get update_button => 'Ажурирај';

  @override
  String get dialog_button_cancel => 'Поништи';

  @override
  String get dialog_button_remove => 'Уклони';

  @override
  String get dialog_button_set => 'Постави';

  @override
  String get dialog_button_reset => 'Ресетуј';

  @override
  String get dialog_button_infinite => 'Бесконачно';

  @override
  String get schedule_start_label => 'Почетак';

  @override
  String get schedule_end_label => 'Крај';

  @override
  String get quick_actions_heading => 'Брзе радње';

  @override
  String get select_distracting_apps_heading =>
      'Избор апликација које одвлаче пажњу';

  @override
  String get your_distracting_apps_heading => 'Апликације које одвлаче пажњу';

  @override
  String get select_more_apps_heading => 'Изаберите још апликација';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Додавање важних системских апликација на листу апликација које одвлаче пажњу није дозвољено.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Подаци о коришћењу екрана и ограничењима нису доступни за ову апликацију. Тренутно је доступан само преглед коришћења мреже.';

  @override
  String get active_period_info =>
      'Подеси временски период током ког ће приступ бити дозвољен. Ван тог периода, приступ ће бити ограничен.';

  @override
  String get donation_card_title => 'Подржи нас';

  @override
  String get donation_card_info =>
      'Mindful је бесплатна апликација отвореног кода, развијана месецима уз велику посвећеност. Ако ти је била од помоћи, донација би нам значила пуно. Сваки допринос нам помаже да наставимо са унапређивањем и одржавањем апликације за све.';

  @override
  String get operation_failed_snack_alert =>
      'Mindful је бесплатна апликација отвореног кода, развијана месецима уз велику посвећеност. Ако ти је била од помоћи, донација би нам значила пуно. Сваки допринос нам помаже да наставимо са унапређивањем и одржавањем апликације за све.\n';

  @override
  String get donation_card_button_donate => 'Донирај';

  @override
  String get app_restart_dialog_title => 'Потребно је поновно покретање';

  @override
  String get app_restart_dialog_info =>
      'Mindful ће се аутоматски поново покренути када се одбројавање заврши. Молимо за стрпљење док се измене примењују.';

  @override
  String get onboarding_skip_btn_label => 'Прескочи';

  @override
  String get onboarding_finish_setup_btn_label => 'Завршите подешавање';

  @override
  String get onboarding_page_one_title => 'Мастер фокус.';

  @override
  String get onboarding_page_one_info =>
      'Паузирај апликације које те ометају, блокирај кратак садржај и остани фокусиран уз флексибилне фокус сесије. Без обзира да ли радиш, учиш или се одмараш, Mindful ти помаже да задржиш контролу.';

  @override
  String get onboarding_page_two_title => 'Блокирај ометања.';

  @override
  String get onboarding_page_two_info =>
      'Ограничи коришћење апликација, паузирај их аутоматски и изгради здравије дигиталне навике. Активирај режим за спавање како би се опустио и провео вече без ометања.';

  @override
  String get onboarding_page_three_title => 'Приватност на првом месту.';

  @override
  String get onboarding_page_three_info =>
      'Mindful је у 100% отвореног кода и ради потпуно офлајн. Не прикупљамо нити делимо било какве личне податке — твоја приватност је у потпуности загарантована.';

  @override
  String get onboarding_page_permissions_title => 'Основне дозволе.';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful захтева следеће основне дозволе како би могао да прати и управља временом проведеним испред екрана, смањи ометања и побољша фокус.';

  @override
  String get dashboard_tab_title => 'Контролна табла';

  @override
  String get focus_now_fab_button => 'Добродошао/ла назад!';

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
  String get welcome_greetings => 'Добродошао/ла назад,';

  @override
  String get username_snack_alert => 'Дуго притисни да измениш корисничко име.';

  @override
  String get username_dialog_title => 'Корисничко име';

  @override
  String get username_dialog_info =>
      'Унеси корисничко име које ће бити приказано на контролној табли.';

  @override
  String get username_dialog_button_apply => 'Примени';

  @override
  String get restrictions_heading => 'Ограничења';

  @override
  String get apps_blocking_tile_title => 'Блокирање апликација';

  @override
  String get apps_blocking_tile_subtitle =>
      'Ограничи апликације на више начина.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Ограничи садржај за одрасле и одабране веб сајтове.';

  @override
  String get screen_time_label => 'Време испред екрана';

  @override
  String get statistics_tab_title => 'Статистика';

  @override
  String get screen_segment_label => 'Екран';

  @override
  String get data_segment_label => 'Подаци';

  @override
  String get mobile_label => 'Мобилни подаци';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'Најчешће коришћене апликације';

  @override
  String get show_all_apps_tile_title => 'Прикажи све апликације';

  @override
  String get search_apps_hint => 'Претражи апликације...';

  @override
  String get notifications_tab_title => 'Обавештења';

  @override
  String get notifications_tab_info =>
      'Групна обавештења од апликација и подешавање распореда као што су јутро, подне, вече и ноћ. Остани у току без сталних прекида.';

  @override
  String get batched_apps_tile_title => 'Груписане апликације';

  @override
  String get batch_recap_dropdown_title => 'Тип груписања обавештења';

  @override
  String get batch_recap_dropdown_info =>
      'Тип груписаних обавештења: Изабери шта да пошаљеш када се активира распоред — сва обавештења или само сажетак.';

  @override
  String get batch_recap_option_summery_only => 'Само сажетак';

  @override
  String get batch_recap_option_all_notifications => 'Сва обавештења';

  @override
  String get notification_history_tile_title => 'Историја обавештења';

  @override
  String get store_all_tile_title => 'Складишти сва обавештења';

  @override
  String get store_all_tile_subtitle =>
      'Чувај и обавештења која нису груписана.';

  @override
  String get schedules_heading => 'Распореди';

  @override
  String get new_schedule_fab_button => 'Нови распоред';

  @override
  String get new_schedule_dialog_info =>
      'Унеси име за распоред обавештења како би га лакше препознао/ла.';

  @override
  String get new_schedule_dialog_field_label => 'Назив распореда';

  @override
  String get shorts_blocking_tab_title => 'Блокирање кратких садржаја';

  @override
  String get shorts_blocking_tab_info =>
      'Контролиши колико времена проводиш гледајући кратке садржаје на платформама као што су Instagram, YouTube, Snapchat и Facebook, укључујући и њихове веб-сајтове.';

  @override
  String get short_content_heading => 'Кратки садржаји';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Преостало: $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Постави дневно временско ограничење за кратке садржаје. Када достигнеш лимит, кратки садржаји ће бити паузирани до поноћи.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Ограничи функције у оквиру апликације Instagram.';

  @override
  String get instagram_features_block_reels => 'Ограничи одељак Reels.';

  @override
  String get instagram_features_block_explore => 'Ограничи одељак Explore.';

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
      'Ограничи функције у оквиру апликације Snapchat.';

  @override
  String get snapchat_features_block_spotlight => 'Ограничи одељак Spotlight.';

  @override
  String get snapchat_features_block_discover => 'Ограничи одељак Discover.';

  @override
  String get youtube_features_tile_title => 'Youtube';

  @override
  String get youtube_features_tile_subtitle =>
      'Ограничи кратке видео-садржаје на YouTube платформи.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle =>
      'Ограничи Reels у оквиру апликације Facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle =>
      'Ограничи кратке видео-садржаје на Reddit платформи.';

  @override
  String get websites_blocking_tab_title => 'Блокирање сајтова';

  @override
  String get websites_blocking_tab_info =>
      'Блокирај сајтове са садржајем за одрасле и друге сајтове по сопственом избору како би креирао безбедније и фокусираније онлајн искуство. Преузми контролу над својом интернет претрагом и смањи ометања.';

  @override
  String get adult_content_heading => 'Садржај за одрасле';

  @override
  String get block_nsfw_title => 'Блокирај неприкладан садржај';

  @override
  String get block_nsfw_subtitle =>
      'Ограничи претраживач да не приступа сајтовима за одрасле и порнографији.';

  @override
  String get block_nsfw_dialog_info =>
      'Да ли си сигуран/сигурна? Ова радња је неповратна. Када укључиш блокатор за сајтове за одрасле, нећеш моћи да га искључиш све док је ова апликација инсталирана на твом уређају.';

  @override
  String get block_nsfw_dialog_button_block_anyway =>
      'Блокирај у сваком случају';

  @override
  String get blocked_websites_heading => 'Блокирани сајтови';

  @override
  String get blocked_websites_empty_list_hint =>
      'Кликни на дугме „+ Додај сајт“ да додаш сајтове који те ометају и које желиш да блокираш.';

  @override
  String get add_website_fab_button => 'Додај сајт';

  @override
  String get add_website_dialog_title => 'Сајт који одвлачи пажњу';

  @override
  String get add_website_dialog_info =>
      'Унеси URL сајта који желиш да блокираш.';

  @override
  String get add_website_dialog_is_nsfw =>
      'Да ли је овај сајт NSFW (неприкладног садржаја)?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Упозорење: NSFW сајтови не могу бити уклоњени након што су додати..';

  @override
  String get add_website_dialog_button_block => 'Блокирај';

  @override
  String get add_website_already_exist_snack_alert =>
      'URL је већ додат на листу блокираних сајтова.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Неважећа URL адреса! Сајт није пронађен.';

  @override
  String get focus_session_duration_tile_title => 'Трајање сесије';

  @override
  String get focus_session_duration_dialog_info =>
      'Молимо те да изабереш жељено трајање ове фокус сесије. Одреди колико дуго желиш да останеш фокусиран и без ометања.';

  @override
  String get timeline_tab_title => 'Временска линија';

  @override
  String get calender_heading => 'Календар';

  @override
  String get active_session_reflection_dialog_title => 'Осврт на сесију';

  @override
  String get active_session_reflection_dialog_info =>
      'Одвоји тренутак да размислиш о свом напретку. Који ти је циљ за ову сесију? Шта си постигао током ње?';

  @override
  String get active_session_reflection_dialog_tip =>
      'Савет: Ово увек можеш касније изменити у временској линији сесије.';

  @override
  String get notifications_empty_list_hint =>
      'Ниједно обавештење није груписано данас.';

  @override
  String get conversations_label => 'Преписке';

  @override
  String get last_24_hours_heading => 'Последња 24 сата';

  @override
  String get notification_timeline_tab_info =>
      'Прегледај историју обавештења бирањем датума са календара.\nПогледај које су ти апликације највише одвлачиле пажњу и размисли о својим дигиталним навикама.';

  @override
  String get monthly_label => 'На месечном нивоу';

  @override
  String get daily_label => 'Дневно';

  @override
  String get search_notifications_sheet_info =>
      'Лако пронађи стара обавештења претрагом по наслову или садржају.\nОлакшава брзо проналажење важних обавештења.';

  @override
  String get search_notifications_hint => 'Претрага обавештења...';

  @override
  String get search_notifications_empty_list_hint =>
      'Нема обавештења која се поклапају са претрагом.';

  @override
  String get app_info_none_warning =>
      'Није могуће пронаћи апликацију за дати пакет. Враћам се на почетни екран.';

  @override
  String get emergency_fab_button => 'Упозорење';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Ова радња ће паузирати блокатор апликација на наредних 5 минута. Преостало ти је $leftPassesCount пропусница. Након што искористиш све пропуснице, апликација ће остати блокирана до поноћи, или док активна фокус сесија не заврши.\n\nДа ли желиш да наставиш?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Користи у сваком случају';

  @override
  String get emergency_started_snack_alert =>
      'Блокатор апликација је паузиран и наставиће са блокирањем за 5 минута.';

  @override
  String get emergency_already_active_snack_alert =>
      'Блокатор апликација је тренутно паузиран или неактиван. Ако су обавештења омогућена, добићеш ажурирања о преосталом времену.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Искористио си све своје хитне пропуснице. Блокиране апликације ће остати блокиране до поноћи, или док се активна фокус сесија не заврши.';

  @override
  String get app_limit_status_not_set => 'Није подешено';

  @override
  String get app_timer_tile_title => 'Тајмер апликације';

  @override
  String get app_timer_picker_dialog_info =>
      'Постави дневно временско ограничење за ову апликацију. Када достигнеш своје ограничење, коришћење апликације ће бити онемогућено до поноћи.';

  @override
  String get usage_reminders_tile_title => 'Обавештења о коришћењу';

  @override
  String get usage_reminders_tile_subtitle =>
      'Подсетници при коришћењу апликација са временским ограничењем.';

  @override
  String get app_launch_limit_tile_title => 'Ограничење покретања';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Започето $count пута данас.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Постави колико пута можеш да отвориш ову апликацију сваког дана. Када се достигне лимит, апликација ће бити паузирана до поноћи.';

  @override
  String get app_active_period_tile_title => 'Активни период';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'Од $startTime до $endTime';
  }

  @override
  String get internet_access_tile_title => 'Приступ интернету';

  @override
  String get internet_access_tile_subtitle =>
      'Искључи да блокираш интернет за апликацију.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'Интернет за апликацију $appName је блокиран.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return ' Интернет за апликацију $appName је блокиран.';
  }

  @override
  String get launch_app_tile_title => 'Покрени апликацију';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Отвори $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Отвори подешавања апликације';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Управљај подешавањима апликације као што су обавештења, дозволе, складиштење и друго.';

  @override
  String get include_in_stats_tile_title => 'Укључи у коришћење екрана';

  @override
  String get include_in_stats_tile_subtitle =>
      'Искључи ову апликацију из укупног времена проведеног испред екрана.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName је искључен из укупног времена проведеног испред екрану.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName је укључен у укупно време коришћења екрана.';
  }

  @override
  String get general_tab_title => 'Опште';

  @override
  String get appearance_heading => 'Приказ';

  @override
  String get theme_mode_tile_title => 'Режим теме';

  @override
  String get theme_mode_system_label => 'Системски';

  @override
  String get theme_mode_light_label => 'Светла';

  @override
  String get theme_mode_dark_label => 'Тамна';

  @override
  String get material_color_tile_title => 'Боја у стилу Material дизајна';

  @override
  String get amoled_dark_tile_title => 'AMOLED тамна';

  @override
  String get amoled_dark_tile_subtitle =>
      'Користи чисто црну боју за тамну тему.';

  @override
  String get dynamic_colors_tile_title => 'Динамичне боје';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Користи боје уређаја ако су подржане.';

  @override
  String get defaults_heading => 'Подразумеване вредности';

  @override
  String get app_language_tile_title => 'Језик апликације';

  @override
  String get default_home_tab_tile_title => 'Почетна картица';

  @override
  String get usage_history_tile_title => 'Историја употребе';

  @override
  String get usage_history_15_days => '15 дана';

  @override
  String get usage_history_1_month => '1 месец';

  @override
  String get usage_history_3_month => '3 месеца';

  @override
  String get usage_history_6_month => '6 месеци';

  @override
  String get usage_history_1_year => '1 година';

  @override
  String get service_heading => 'Услуга';

  @override
  String get service_stopping_warning =>
      'Ако Mindful престане да ради изненада, молимо те да доделиш дозволу \'Игнориши оптимизацију батерије\' како би апликација наставила да ради у позадини. Ако то не реши проблем, покушај да ставиш Mindful на белу листу за неометан рад.';

  @override
  String get whitelist_app_tile_title => 'Додај Mindful на белу листу';

  @override
  String get whitelist_app_tile_subtitle =>
      'Одобри да се Mindful аутоматски покреће.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Овај уређај не подржава управљање аутоматским покретањем.';

  @override
  String get database_tab_title => 'База података';

  @override
  String get import_db_tile_title => 'Увоз базе података';

  @override
  String get import_db_tile_subtitle => 'Увоз базе података из фајла.';

  @override
  String get export_db_tile_title => 'Извоз базе података';

  @override
  String get export_db_tile_subtitle => 'Извоз базе података у фајл.';

  @override
  String get crash_logs_heading => 'Извештаји о квару';

  @override
  String get crash_logs_info =>
      'Ако наидеш на било који проблем, можеш да га пријавиш на GitHub уз извештаје о квару. Фајл ће садржати детаље као што су произвођач твог уређаја, модел, верзија Андроида, верзија SDK-а и извештаје о квару. Ове информације ће нам помоћи да ефикасније идентификујемо и решимо проблем.';

  @override
  String get crash_logs_export_tile_title => 'Извези извештаје о квару';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Извези извештаје о квару као json фајл.';

  @override
  String get crash_logs_view_tile_title => 'Прегледај извештаје (логове)';

  @override
  String get crash_logs_view_tile_subtitle => 'Прегледај извештаје (логове)';

  @override
  String get crash_logs_empty_list_hint =>
      'До сада није забележен ниједан квар.';

  @override
  String get crash_logs_clear_tile_title => 'Очисти записнике';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Обриши све извештаје (логове) квара из базе података.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Да ли си сигуран да желиш да обришеш све логове квара из базе података?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'Обриши';

  @override
  String get about_tab_title => 'О нама';

  @override
  String get changelog_tile_title => 'Историја измена';

  @override
  String get changelog_tile_subtitle => 'Сазнај шта је ново.';

  @override
  String get full_changelog_tile_title => 'Целокупан дневник измена';

  @override
  String get redirected_to_github_subtitle => 'Бићеш преусмерен на GitHub.';

  @override
  String get contribute_heading => 'Допринеси';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Погледај изворни код.';

  @override
  String get report_issue_tile_title => 'Пријави проблем';

  @override
  String get suggest_idea_tile_title => 'Пошаљи нам предлог';

  @override
  String get write_email_tile_title => 'Пиши нам путем мејла';

  @override
  String get write_email_tile_subtitle =>
      'Бићеш преусмерен у апликацију за е-пошту.';

  @override
  String get privacy_policy_heading => 'Политика приватности';

  @override
  String get privacy_policy_info =>
      'Mindful је посвећен заштити твоје приватности. Не прикупљамо, не чувамо и не делимо било какве податке наших корисника. Апликација ради потпуно офлајн и не захтева интернет везу. Твоје личне информације остају приватне и безбедне на твом уређају. Као апликација отвореног кода (FOSS), Mindful гарантује потпуну транспарентност и контролу корисника над сопственим подацима.';

  @override
  String get more_details_button => 'Још детаља';
}
