// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get mindful_tagline => 'Сфокусуйтесь на тому, що дійсно має значення';

  @override
  String get permission_status_off => 'Вимкнено';

  @override
  String get permission_status_allowed => 'Дозволено';

  @override
  String get permission_status_not_allowed => 'Не дозволено';

  @override
  String get permission_button_grant_permission => 'Надати дозвіл';

  @override
  String get permission_button_agree_and_continue => 'Погодитись та продовжити';

  @override
  String get permission_button_not_now => 'Не зараз';

  @override
  String get permission_button_help => 'Допомога?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful є на 100 % безпечним і працює в автономному режимі. Ми не збираємо або зберігаємо жодні персональні дані.';

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
    return '1. Натисніть кнопку $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Оберіть Mindful на наступному екрані.';

  @override
  String get permission_grant_step_three =>
      '3. Клацніть та увімкніть перемикач нижче.';

  @override
  String get permission_notification_title => 'Відправляти сповіщення';

  @override
  String get permission_alarms_title => 'Будильники та нагадування';

  @override
  String get permission_alarms_info =>
      'Будь ласка, дозвольте налаштування будильників та нагадувань. Це надасть можливість Mindful встановлювати ваш режим сну вчасно і щоденно скидати о півночі таймери застосунку, та допомогти вам залишитись на шляху.';

  @override
  String get permission_alarms_device_tile_label =>
      'Дозволити налаштування будильників та нагадувань';

  @override
  String get permission_usage_title => 'Доступ до статистики використання';

  @override
  String get permission_usage_info =>
      'Будь ласка, дозвольте збирати статистику використання. Це надасть можливість Mindful контролювати використання застосунку та управляти доступом до певних застосунків, забезпечити більш сфокусоване та контрольоване цифрове середовище.';

  @override
  String get permission_usage_device_tile_label =>
      'Дозволити доступ до статистики використання';

  @override
  String get permission_overlay_title => 'Показ нашарування';

  @override
  String get permission_overlay_info =>
      'Будь ласка, дозвольте нашарування. Це надасть можливість Mindful показувати нашарування, коли застосунок є на паузі, допомагаючи вам залишатись у фокусі та підтримувати свій графік.';

  @override
  String get permission_overlay_device_tile_label =>
      'Дозволити показ поверх інших застосунків';

  @override
  String get permission_accessibility_title => 'Обмеження доступу';

  @override
  String get permission_accessibility_info =>
      'Будь ласка, дозвольте обмеження доступу. Це надасть можливість Mindful обмежувати дозвіл до короткого відеоконтенту (наприклад, Reels, Shorts) у застосунках соцмереж і браузерах, та фільтрувати недоречні вебсайти.';

  @override
  String get permission_accessibility_required =>
      'Mindful потребує дозвіл на обмеження доступу для ефективного блокування контенту та вебсайтів.';

  @override
  String get permission_accessibility_device_tile_label =>
      'Використання Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Ігнорувати оптимізацію батареї';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Вже без обмежень';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Вимкнути обмеження у фоновому режимі';

  @override
  String get permission_battery_optimization_allow_info =>
      'Дозвіл «Ігнорування оптимізації батареї» автоматично надасть дозвіл на «Будильники й Нагадування» на деяких пристроях.';

  @override
  String get permission_vpn_title => 'Створити VPN';

  @override
  String get permission_vpn_info =>
      'Будь ласка, дозвольте створення підключення віртуальної приватної мережі (VPN). Це надасть можливість Mindful обмежити доступ для призначених застосунків, створюючи локальну мережу VPN.';

  @override
  String get permission_notification_access_title => 'Доступ до сповіщень';

  @override
  String get permission_notification_access_info =>
      'Будь ласка, дозвольте сповіщення. Це надасть можливість Mindful організувати сповіщення та надсилати їх за вашим розкладом.';

  @override
  String get permission_notification_access_required =>
      'Mindful потребує доступ до сповіщень для того, щоб збирати в пакети та планувати сповіщення.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Дозволити доступ до сповіщень';

  @override
  String get day_today => 'Сьогодні';

  @override
  String get day_yesterday => 'Вчора';

  @override
  String nDays(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString днів',
      one: '1 день',
      zero: '0 днів',
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
      other: '$countString годин',
      one: '1 година',
      zero: '0 годин',
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
      other: '$countString хвилин',
      one: '1 хвилина',
      zero: '0 хвилин',
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
      other: '$countString секунд',
      one: '1 секунда',
      zero: '0 секунд',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'та';

  @override
  String get timer_status_active => 'Активний';

  @override
  String get timer_status_paused => 'На паузі';

  @override
  String get create_button => 'Створити';

  @override
  String get update_button => 'Обновити';

  @override
  String get dialog_button_cancel => 'Скасувати';

  @override
  String get dialog_button_remove => 'Видалити';

  @override
  String get dialog_button_set => 'Налаштувати';

  @override
  String get dialog_button_reset => 'Скинути';

  @override
  String get dialog_button_infinite => 'Необмежено';

  @override
  String get schedule_start_label => 'Початок';

  @override
  String get schedule_end_label => 'Кінець';

  @override
  String get development_dialog_info =>
      'Mindful перебуває зараз в процесі розробки і може містити помилки чи незакінчені функції. Якщо ви стикаєтесь з будь-якими проблемами, буль ласка, повідомте про них, щоб допомогти нам у покращенні.\n\nДякуємо за ваш відгук!';

  @override
  String get development_dialog_button_report_issue =>
      'Повідомити про проблему';

  @override
  String get development_dialog_button_close => 'Закрити';

  @override
  String get quick_actions_heading => 'Швидкі дії';

  @override
  String get select_distracting_apps_heading =>
      'Оберіть застосунки, що відволікають';

  @override
  String get your_distracting_apps_heading =>
      'Ваші застосунки, що відволікають';

  @override
  String get select_more_apps_heading => 'Оберіть більше застосунків';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Додавання важливих системних застосунків до списку таких, що відволікають, не допускається.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Використання дисплея та обмеження недоступні для цього застосунку. На даний час, доступне лише використання мережі.';

  @override
  String get active_period_info =>
      'Встановіть часовий період, протягом якого буде дозволений доступ. Поза цим часом доступ буде обмежений.';

  @override
  String get donation_card_title => 'Підтримайте нас';

  @override
  String get donation_card_info =>
      'Mindful є безплатний та відкритий, розроблений з відданістю протягом місяців. Якщо застосунок вам допоміг, ваша пожертва буде безмежно цінною для нас. Кожен внесок нам допомагає вдосконалювати для підтримувати застосунок для кожного.';

  @override
  String get operation_failed_snack_alert =>
      'Помилка операції, щось пішло не так!';

  @override
  String get donation_card_button_donate => 'Пожертвувати';

  @override
  String get app_restart_dialog_title => 'Потрібен перезапуск';

  @override
  String get app_restart_dialog_info =>
      'Mindful буде автоматично перезапущений після завершення зворотного відліку. Будь ласка, будьте терплячі, оскільки будуть застосовані зміни.';

  @override
  String get onboarding_skip_btn_label => 'Пропустити';

  @override
  String get onboarding_finish_setup_btn_label => 'Завершити налаштування';

  @override
  String get onboarding_page_one_title => 'Опануйте Зосередження.';

  @override
  String get onboarding_page_one_info =>
      'Призупиніть відволікаючі застосунки, блокуйте короткий контент та залишайтесь у фокусі з налаштованими сесіями зосередження. Незалежно від того, чи ви працюєте, навчаєтесь або відпочиваєте, Mindful допомагає вам зберігати контроль.';

  @override
  String get onboarding_page_two_title => 'Блокуйте відволікання.';

  @override
  String get onboarding_page_two_info =>
      'Встановіть ліміти використання, автоматично призупиняйте застосунки та створіть здоровіші цифрові звички. Використовуйте Режим Сну, щоб розслабитись та насолодитись безтурботною ніччю.';

  @override
  String get onboarding_page_three_title => 'Конфіденційність понад усе.';

  @override
  String get onboarding_page_three_info =>
      'Mindful є на 100 % з відкритим вихідним кодом і повністю працює в автономному режимі. Ми не збираємо і не передаємо ваші персональні дані — ваша конфіденційність гарантується будь-яким чином.';

  @override
  String get onboarding_page_permissions_title => 'Необхідні дозволи.';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful вимагає забезпечення необхідних дозволів для відстежування та управління екранним часом, допомагаючи зменшити відволікання та покращити фокусування.';

  @override
  String get dashboard_tab_title => 'Головна';

  @override
  String get focus_now_fab_button => 'Зосередитися зараз';

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
  String get welcome_greetings => 'З поверненням,';

  @override
  String get username_snack_alert =>
      'Утримуйте для редагування імені користувача.';

  @override
  String get username_dialog_title => 'Ім\'я користувача';

  @override
  String get username_dialog_info =>
      'Введіть ваше ім\'я користувача, яке буде показане на панелі управління.';

  @override
  String get username_dialog_button_apply => 'Прийняти';

  @override
  String get restrictions_heading => 'Обмеження';

  @override
  String get apps_blocking_tile_title => 'Блокування додатків';

  @override
  String get apps_blocking_tile_subtitle =>
      'Обмежити додатки різними способами.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Обмежити сайти для дорослих та вибрані сайти.';

  @override
  String get screen_time_label => 'Час екрану';

  @override
  String get longest_streak_label => 'Найтриваліший період';

  @override
  String get current_streak_label => 'Поточний відрізок';

  @override
  String get successful_sessions_label => 'Успішні сесії';

  @override
  String get failed_sessions_label => 'Провалені сесії';

  @override
  String get statistics_tab_title => 'Статистика';

  @override
  String get screen_segment_label => 'Екран';

  @override
  String get data_segment_label => 'Трафік';

  @override
  String get mobile_label => 'Мобільні дані';

  @override
  String get wifi_label => 'Wifi';

  @override
  String get most_used_apps_heading => 'Найбільш використовувані програми';

  @override
  String get show_all_apps_tile_title => 'Показати всі додатки';

  @override
  String get search_apps_hint => 'Шукати додатки...';

  @override
  String get notifications_tab_title => 'Сповіщення';

  @override
  String get notifications_tab_info =>
      'Отримуйте зведені сповіщення та встановлюйте розклад, як-от: ранок, обід, вечір або ніч. Будьте в курсі подій без постійних відволікань.';

  @override
  String get batched_apps_tile_title => 'Програми зі зведенням сповіщень';

  @override
  String get batch_recap_dropdown_title => 'Тип підсумку для зведень';

  @override
  String get batch_recap_dropdown_info =>
      'Виберіть, що надсилати, коли спрацьовує розклад - всі сповіщення або тільки підсумок.';

  @override
  String get batch_recap_option_summery_only => 'Тільки підсумок';

  @override
  String get batch_recap_option_all_notifications => 'Всі сповіщення';

  @override
  String get notification_history_tile_title => 'Історія сповіщень';

  @override
  String get store_all_tile_title => 'Зберігати всі сповіщення';

  @override
  String get store_all_tile_subtitle =>
      'Зберігати не зведені сповіщення також.';

  @override
  String get schedules_heading => 'Розклади';

  @override
  String get new_schedule_fab_button => 'Новий Розклад';

  @override
  String get new_schedule_dialog_info =>
      'Введіть назву для сповіщення, щоб легше його ідентифікувати.';

  @override
  String get new_schedule_dialog_field_label => 'Назва розкладу';

  @override
  String get shorts_blocking_tab_title =>
      'Блокування контенту короткого формату';

  @override
  String get shorts_blocking_tab_info =>
      'Контролюйте, скільки часу ви витрачаєте на перегляд короткого контенту на таких платформах, як Instagram, YouTube, Snapchat і Facebook, включно з їхніми вебсайтами.';

  @override
  String get short_content_heading => 'Короткий контент';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Залишилось з $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Встановіть денний ліміт часу для короткого контенту. Коли ліміт буде вичерпано, показ короткого контенту буде призупинено до опівночі.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle => 'Обмежити функції Instagram.';

  @override
  String get instagram_features_block_reels => 'Обмежити секцію Reels.';

  @override
  String get instagram_features_block_explore => 'Обмежити секцію Цікаве.';

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
  String get snapchat_features_tile_subtitle => 'Обмежити функції Snapchat.';

  @override
  String get snapchat_features_block_spotlight => 'Обмежити секцію Spotlight.';

  @override
  String get snapchat_features_block_discover => 'Обмежити секцію Цікаве.';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle => 'Обмежити Shorts не YouTube.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => 'Обмежити Reels в Facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle =>
      'Обмежити короткий контент на Reddit.';

  @override
  String get websites_blocking_tab_title => 'Блокування сайтів';

  @override
  String get websites_blocking_tab_info =>
      'Блокуйте сайти для дорослих та будь-які власні сайти, щоб отримати безпечніший та продуктивніший онлайн-досвід. Керуйте онлайн-контентом та зменште фактори, що відволікають.';

  @override
  String get adult_content_heading => 'Контент для дорослих';

  @override
  String get block_nsfw_title => 'Блокувати відвертий контент';

  @override
  String get block_nsfw_subtitle =>
      'Заборонити браузерам відкривати сайти для дорослих і порнографічні сайти.';

  @override
  String get block_nsfw_dialog_info =>
      'Ви впевнені? Ця дія незворотна. Після того, як блокування для дорослих сайтів буде увімкнено, ви не зможете вимкнути його, поки додаток встановлено на пристрої.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Все одно блокувати';

  @override
  String get blocked_websites_heading => 'Заблоковані сайти';

  @override
  String get blocked_websites_empty_list_hint =>
      'Натисніть кнопку \"+ Додати вебсайт\", щоб додати вебсайти, що відволікають, які ви бажаєте заблокувати.';

  @override
  String get add_website_fab_button => 'Додати Вебсайт';

  @override
  String get add_website_dialog_title => 'Вебсайти, що відволікають';

  @override
  String get add_website_dialog_info =>
      'Введіть Url-адресу вебсайту, який ви хочете заблокувати.';

  @override
  String get add_website_dialog_is_nsfw => 'Nsfw(з делікатним вмістом) сайт?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Увага: Вебсайти з Nsfw(делікатний вміст) не можуть бути видалені після додавання.';

  @override
  String get add_website_dialog_button_block => 'Блокувати';

  @override
  String get add_website_already_exist_snack_alert =>
      'URL-адреса вже була додана до списку заблокованих вебсайтів.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Недійсна URL-адреса! Не вдалося обробити ім\'я хосту.';

  @override
  String get remove_website_dialog_title => 'Видалити вебсайт';

  @override
  String remove_website_dialog_info(String websitehost) {
    return 'Ви впевнені? Сайт $websitehost буде видалено з заблокованих.';
  }

  @override
  String get focus_session_duration_tile_title => 'Тривалість сеансу';

  @override
  String get focus_session_duration_dialog_info =>
      'Будь ласка, виберіть бажану тривалість для цього сеансу зосередження, визначаючи, скільки часу ви хочете залишатися зосередженим та без відволікань.';

  @override
  String get timeline_tab_title => 'Хронологія';

  @override
  String get calender_heading => 'Календар';

  @override
  String get focus_session_tile_timestamp_label => 'Час';

  @override
  String get focus_session_tile_duration_label => 'Тривалість';

  @override
  String get focus_session_tile_reflection_label => 'Аналіз';

  @override
  String get active_session_reflection_dialog_title =>
      'Підбиття підсумків сеансу';

  @override
  String get active_session_reflection_dialog_info =>
      'Знайдіть хвилинку, щоб поміркувати про свій прогрес. Яка ваша мета на цю сесію? Чого ви досягли під час цієї сесії?';

  @override
  String get active_session_reflection_dialog_tip =>
      'Порада: Ви завжди можете редагувати це пізніше в хронології сенсів.';

  @override
  String get notifications_empty_list_hint =>
      'Немає зведених повідомлень на сьогодні.';

  @override
  String get conversations_label => 'Чати';

  @override
  String get last_24_hours_heading => 'Останні 24 години';

  @override
  String get notification_timeline_tab_info =>
      'Перегляньте історію сповіщень вибравши дату з календаря. Перегляньте, які програми забирали вашу увагу і поміркуйте над своїми цифровими звичками.';

  @override
  String get monthly_label => 'Щомісяця';

  @override
  String get daily_label => 'Щоденно';

  @override
  String get search_notifications_sheet_info =>
      'Легко знаходьте минулі сповіщення, шукаючи їх заголовок або зміст. Допомагає швидко знайти важливі сповіщення.';

  @override
  String get search_notifications_hint => 'Пошук сповіщень...';

  @override
  String get search_notifications_empty_list_hint =>
      'Не знайдено сповіщень, що співпадають з вашим запитом.';

  @override
  String get app_info_none_warning =>
      'Не вдалося знайти додаток для даного пакету. Переходимо на домашній екран.';

  @override
  String get emergency_fab_button => 'Екстрений доступ';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Ця дія призупинить блокування програми на наступні 5 хвилин. У вас залишилося $leftPassesCount пропусків. Після використання всіх пропусків додаток залишиться заблокованим до опівночі або до завершення сеансу активного фокусування.\n\nВи все ще бажаєте продовжити?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Все одно використати';

  @override
  String get emergency_started_snack_alert =>
      'Блокування програм призупинено і він буде відновлено через 5 хвилин.';

  @override
  String get emergency_already_active_snack_alert =>
      'Блокування додатків зараз призупинено або неактивно. Якщо сповіщення увімкнено, ви будете отримувати оновлення щодо часу, що залишився.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Ви використали всі свої екстрені пропуски. Заблоковані програми залишатимуться заблокованими до півночі або до завершення активного сеансу зосередження.';

  @override
  String get app_limit_status_not_set => 'Не встановлено';

  @override
  String get app_timer_tile_title => 'Таймер додатку';

  @override
  String get app_timer_picker_dialog_info =>
      'Встановіть денний ліміт часу для цієї програми. Як тільки ви досягнете ліміту, програма буде призупинена до опівночі.';

  @override
  String get usage_reminders_tile_title => 'Нагадування про використання';

  @override
  String get usage_reminders_tile_subtitle =>
      'Ввічливі нагадування під час використання програм з таймером.';

  @override
  String get app_launch_limit_tile_title => 'Ліміт запуску';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Сьогодні запущено $count разів.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Вкажіть скільки разів на день ви можете відкривати цей додаток. Після досягнення ліміту додаток буде призупинений до опівночі.';

  @override
  String get app_active_period_tile_title => 'Активний період';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'Від $startTime до $endTime';
  }

  @override
  String get internet_access_tile_title => 'Доступ до інтернету';

  @override
  String get internet_access_tile_subtitle =>
      'Вимкніть для блокування інтернету для додатків.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'Інтернет для $appName заблоковано.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'Інтернет для $appName розблоковано.';
  }

  @override
  String get launch_app_tile_title => 'Запустити додаток';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Відкрити $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Перейти до налаштувань додатку';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Керуйте налаштуваннями додатку, такими як: сповіщення, дозволи, зберігання даних та інше.';

  @override
  String get include_in_stats_tile_title => 'Включати до часу екрану';

  @override
  String get include_in_stats_tile_subtitle =>
      'Вимкнути, щоб виключити цю програму з загального часу екрану.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName виключено з загального використання екрану.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName включено до загального використання екрану.';
  }

  @override
  String get general_tab_title => 'Загальні';

  @override
  String get appearance_heading => 'Вигляд';

  @override
  String get theme_mode_tile_title => 'Тема';

  @override
  String get theme_mode_system_label => 'Системна';

  @override
  String get theme_mode_light_label => 'Світла';

  @override
  String get theme_mode_dark_label => 'Темна';

  @override
  String get material_color_tile_title => 'Колір Material';

  @override
  String get amoled_dark_tile_title => 'Темний AMOLED';

  @override
  String get amoled_dark_tile_subtitle =>
      'Використовувати чистий чорний колір для темної теми.';

  @override
  String get dynamic_colors_tile_title => 'Динамічні кольори';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Використовувати кольори пристрою, якщо це підтримується.';

  @override
  String get defaults_heading => 'Типові';

  @override
  String get app_language_tile_title => 'Мова додатку';

  @override
  String get default_home_tab_tile_title => 'Домашня вкладка';

  @override
  String get usage_history_tile_title => 'Історія використання';

  @override
  String get usage_history_15_days => '15 днів';

  @override
  String get usage_history_1_month => '1 місяць';

  @override
  String get usage_history_3_month => '3 місяці';

  @override
  String get usage_history_6_month => '6 місяців';

  @override
  String get usage_history_1_year => '1 рік';

  @override
  String get service_heading => 'Служба';

  @override
  String get service_stopping_warning =>
      'Якщо Mindful несподівано перестає працювати, надайте дозвіл \"Ігнорувати оптимізацію заряду батареї\", щоб програма продовжувала працювати у фоновому режимі. Якщо проблема не зникне, спробуйте додати Mindful до білого списку для безперебійної роботи.';

  @override
  String get whitelist_app_tile_title => 'Додати Mindful до білого списку';

  @override
  String get whitelist_app_tile_subtitle =>
      'Дозволити автоматичний запуск для Mindful.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Цей пристрій не підтримує керування автоматичним запуском.';

  @override
  String get database_tab_title => 'База даних';

  @override
  String get import_db_tile_title => 'Імпорт бази даних';

  @override
  String get import_db_tile_subtitle => 'Імпортувати з файлу.';

  @override
  String get export_db_tile_title => 'Експорт бази даних';

  @override
  String get export_db_tile_subtitle => 'Експортувати базу даних до файлу.';

  @override
  String get crash_logs_heading => 'Журнал збоїв';

  @override
  String get crash_logs_info =>
      'Якщо ви зіткнулися з будь-якою проблемою, ви можете повідомити про неї на GitHub разом із файлом журналу. Файл буде містити такі дані, як виробник вашого пристрою, модель, версія Android, версія SDK та журнали збоїв. Ця інформація допоможе нам виявити й розв\'язати проблему більш ефективно.';

  @override
  String get crash_logs_export_tile_title => 'Експорт журналу збоїв';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Експорт журналів збою в json файл.';

  @override
  String get crash_logs_view_tile_title => 'Перегляд журналу';

  @override
  String get crash_logs_view_tile_subtitle =>
      'Переглянути збережені звіти про збої.';

  @override
  String get crash_logs_empty_list_hint =>
      'Поки що не було зафіксовано жодних помилок.';

  @override
  String get crash_logs_clear_tile_title => 'Очистити журнал';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Видалити всі журнали збоїв з бази даних.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Ви впевнені, що хочете очистити всі журнали збоїв з бази даних?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'Очистити все одно';

  @override
  String get about_tab_title => 'Про додаток';

  @override
  String get changelog_tile_title => 'Журнал змін';

  @override
  String get changelog_tile_subtitle => 'Дізнайтеся, що нового.';

  @override
  String get full_changelog_tile_title => 'Повний журнал змін';

  @override
  String get redirected_to_github_subtitle =>
      'Вас буде перенаправлено на GitHub.';

  @override
  String get contribute_heading => 'Допомога проєкту';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Переглянути вихідний код.';

  @override
  String get report_issue_tile_title => 'Повідомити про проблему';

  @override
  String get suggest_idea_tile_title => 'Запропонувати ідею';

  @override
  String get write_email_tile_title => 'Напишіть нам на електронну пошту';

  @override
  String get write_email_tile_subtitle =>
      'Вас буде перенаправлено до програми Email.';

  @override
  String get privacy_policy_heading => 'Політика конфіденційності';

  @override
  String get privacy_policy_info =>
      'Mindful зобов\'язується захищати вашу конфіденційність. Ми не збираємо, не зберігаємо і не передаємо жодних даних користувачів. Додаток працює повністю офлайн і не вимагає підключення до Інтернету, гарантуючи, що ваша особиста інформація залишається приватною і захищеною на вашому пристрої. Як додаток з вільним та відкритим вихідним кодом (FOSS), Mindful гарантує повну прозорість та контроль користувача над своїми даними.';

  @override
  String get more_details_button => 'Детальніше';
}
