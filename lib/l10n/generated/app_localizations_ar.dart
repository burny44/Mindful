// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get mindful_tagline => 'Focus on what truly Matters';

  @override
  String get permission_status_off => 'إيقاف';

  @override
  String get permission_status_allowed => 'مسموح';

  @override
  String get permission_status_not_allowed => 'غير مسموح';

  @override
  String get permission_button_grant_permission => 'منح الإذن';

  @override
  String get permission_button_agree_and_continue => 'موافق ومتابعة';

  @override
  String get permission_button_not_now => 'ليس الآن';

  @override
  String get permission_button_help => 'مساعدة؟';

  @override
  String get permission_sheet_privacy_info =>
      'تطبيق Mindful آمن بنسبة ١٠٠% ويعمل دون اتصال بالإنترنت. ولا نقوم بجمع أو تخزين أي بيانات شخصية.';

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
    return '١. انقر على زر $button_label.';
  }

  @override
  String get permission_grant_step_two => '٢. حدد Mindful في الشاشة التالية.';

  @override
  String get permission_grant_step_three =>
      '٣. انقر فوق المفتاح وقم بتشغيله كما هو موضح أدناه.';

  @override
  String get permission_notification_title => 'إرسال الإشعارات';

  @override
  String get permission_alarms_title => 'التنبيهات والتذكيرات';

  @override
  String get permission_alarms_info =>
      'يرجى منح الإذن لضبط التنبيهات والتذكيرات. سيسمح هذا لتطبيق Mindful ببدء جدول وقت النوم في الوقت المحدد وإعادة ضبط مؤقتات التطبيق يوميًا عند منتصف الليل ومساعدتك على البقاء على المسار الصحيح.';

  @override
  String get permission_alarms_device_tile_label =>
      'السماح بإعداد التنبيهات والتذكيرات';

  @override
  String get permission_usage_title => 'الوصول إلى الاستخدام';

  @override
  String get permission_usage_info =>
      'يرجى منح إذن الوصول إلى الاستخدام. سيسمح هذا لـ Mindful بمراقبة استخدام التطبيق وإدارة الوصول إلى تطبيقات معينة، مما يضمن بيئة رقمية أكثر تركيزًا وتحكمًا.';

  @override
  String get permission_usage_device_tile_label =>
      'السماح بالوصول إلى الاستخدام';

  @override
  String get permission_overlay_title => 'عرض التراكب';

  @override
  String get permission_overlay_info =>
      'يرجى منح إذن عرض التراكب. سيسمح هذا لتطبيق Mindful بعرض تراكب عند فتح تطبيق متوقف مؤقتًا، مما يساعدك على البقاء مركزًا والالتزام بجدولك الزمني.';

  @override
  String get permission_overlay_device_tile_label =>
      'السماح بالعرض على التطبيقات الأخرى';

  @override
  String get permission_accessibility_title => 'إمكانية الوصول';

  @override
  String get permission_accessibility_info =>
      'يرجى منح إذن الوصول. سيسمح هذا لشركة Mindful بتقييد الوصول إلى محتوى الفيديو القصير (مثل Reels وShorts) داخل تطبيقات الوسائط الاجتماعية والمتصفحات، وتصفية المواقع الإلكترونية غير المناسبة.';

  @override
  String get permission_accessibility_required =>
      'يتطلب تطبيق Mindful إذن الوصول لتفعيل حظر المحتوى القصير والمواقع الإلكترونية بفعالية.';

  @override
  String get permission_accessibility_device_tile_label => 'استخدم Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'تجاهل تحسين البطارية';

  @override
  String get permission_battery_optimization_status_enabled =>
      'غير مقيد بالفعل';

  @override
  String get permission_battery_optimization_status_disabled =>
      'تعطيل تقييد الخلفية';

  @override
  String get permission_battery_optimization_allow_info =>
      'سيؤدي السماح بـ \"تجاهل تحسين البطارية\" إلى منح إذن \"التنبيهات والتذكيرات\" تلقائيًا على بعض الأجهزة';

  @override
  String get permission_vpn_title => 'إنشاء VPN';

  @override
  String get permission_vpn_info =>
      'يرجى منح الإذن لإنشاء اتصال بشبكة خاصة افتراضية (VPN). سيسمح هذا لـ Mindful بتقييد الوصول إلى الإنترنت للتطبيقات المحددة من خلال إنشاء شبكة VPN محلية على الجهاز.';

  @override
  String get permission_notification_access_title => 'الوصول إلى الإشعارات';

  @override
  String get permission_notification_access_info =>
      'يرجى منح إذن الوصول إلى الإشعارات. سيسمح هذا لـ Mindful بتنظيم إشعاراتك وتسليمها حسب جدولك.';

  @override
  String get permission_notification_access_required =>
      'يتطلب Mindful الوصول إلى الإشعارات للدفعات والإشعارات المجدولة.';

  @override
  String get permission_notification_access_device_tile_label =>
      'السماح بالوصول إلى الإشعارات';

  @override
  String get day_today => 'اليوم';

  @override
  String get day_yesterday => 'أمس';

  @override
  String nDays(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString أيام',
      one: 'يوم واحد',
      zero: '٠ يوم',
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
      other: '$countString ساعات',
      one: 'ساعة واحدة',
      zero: '٠ ساعة',
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
      other: '$countString دقائق',
      one: 'دقيقة واحدة',
      zero: '٠ دقيقة',
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
      other: '$countString ثواني',
      one: 'ثانية واحدة',
      zero: '٩ ثانية',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'و';

  @override
  String get timer_status_active => 'نشيط';

  @override
  String get timer_status_paused => 'متوقف مؤقتا';

  @override
  String get create_button => 'إنشاء';

  @override
  String get update_button => 'تحديث';

  @override
  String get dialog_button_cancel => 'إلغاء';

  @override
  String get dialog_button_remove => 'حذف';

  @override
  String get dialog_button_set => 'تعيين';

  @override
  String get dialog_button_reset => 'إعادة ضبط';

  @override
  String get dialog_button_infinite => 'لانهائي';

  @override
  String get schedule_start_label => 'يبدأ';

  @override
  String get schedule_end_label => 'نهاية';

  @override
  String get development_dialog_info =>
      'تطبيق Mindful قيد التطوير حاليًا وقد يحتوي على أخطاء أو ميزات غير مكتملة. إذا واجهت أي مشكلات، فيرجى الإبلاغ عنها لمساعدتنا على التحسين.\n\nشكرًا لك على ملاحظاتك!';

  @override
  String get development_dialog_button_report_issue => 'الإبلاغ عن المشكلة';

  @override
  String get development_dialog_button_close => 'غلق';

  @override
  String get quick_actions_heading => 'الإجراءات السريعة';

  @override
  String get select_distracting_apps_heading =>
      'حدد التطبيقات المشتتة للانتباه';

  @override
  String get your_distracting_apps_heading => 'تطبيقاتك المشتتة للانتباه';

  @override
  String get select_more_apps_heading => 'حدد المزيد من التطبيقات';

  @override
  String get imp_distracting_apps_snack_alert =>
      'لا يُسمح بإضافة تطبيقات النظام المهمة إلى قائمة التطبيقات المشتتة للانتباه.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'لا يتوفر استخدام الشاشة والقيود لهذا التطبيق. في الوقت الحالي، يمكن الوصول إلى استخدام الشبكة فقط';

  @override
  String get active_period_info =>
      'حدد مدّة زمنية يُسمح خلالها بالوصول. وخارج هذه المدّة الزمنية، سيتم تقييد الوصول.';

  @override
  String get donation_card_title => 'ادعمنا';

  @override
  String get donation_card_info =>
      'Mindful هو تطبيق مجاني ومفتوح المصدر، تم تطويره بعد شهور من التفاني. إذا ساعدك التطبيق، فإن تبرعك يعني الكثير بالنسبة لنا. تساعدنا كل مساهمة في تحسينه وصيانته من أجل الجميع.';

  @override
  String get operation_failed_snack_alert => 'فشلت العملية، حدث خطأ ما!';

  @override
  String get donation_card_button_donate => 'تبرع';

  @override
  String get app_restart_dialog_title => 'بحاجة لإعادة التشغيل';

  @override
  String get app_restart_dialog_info =>
      'سيتم إعادة تشغيل Mindful تلقائيًا بمجرد انتهاء العد التنازلي. يرجى التحلي بالصبر أثناء تطبيق التغييرات.';

  @override
  String get onboarding_skip_btn_label => 'تخطي';

  @override
  String get onboarding_finish_setup_btn_label => 'إنهاء الإعداد';

  @override
  String get onboarding_page_one_title => 'التركيز المتقن.';

  @override
  String get onboarding_page_one_info =>
      'قم بإيقاف التطبيقات المشتتة للانتباه مؤقتًا، وحظر المحتوى القصير، والتزم بالمسار الصحيح من خلال جلسات التركيز القابلة للتخصيص. سواء كنت تعمل أو تدرس أو تسترخي، يساعدك Mindful على البقاء متحكمًا.';

  @override
  String get onboarding_page_two_title => 'منع التشتيتات.';

  @override
  String get onboarding_page_two_info =>
      'قم بتعيين حدود الاستخدام وإيقاف التطبيقات تلقائيًا وإنشاء عادات رقمية أكثر صحة. استخدم وضع وقت النوم للاسترخاء والاستمتاع بليلة خالية من التشتيت.';

  @override
  String get onboarding_page_three_title => 'الخصوصية أولاً.';

  @override
  String get onboarding_page_three_info =>
      'Mindful هو تطبيق مفتوح المصدر بنسبة ١٠٠% ويعمل دون اتصال بالإنترنت بالكامل. نحن لا نجمع أو نشارك بياناتك الشخصية — خصوصيتك مضمونة بكل الطرق.';

  @override
  String get onboarding_page_permissions_title => 'الأذونات الأساسية.';

  @override
  String get onboarding_page_permissions_info =>
      'يتطلب Mindful اتباع الأذونات الأساسية لتتبع وإدارة وقت الشاشة، مما يساعد على تقليل عوامل التشتيت وتحسين التركيز.';

  @override
  String get dashboard_tab_title => 'لوحة التحكم';

  @override
  String get focus_now_fab_button => 'ركز الان';

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
  String get welcome_greetings => 'مرحبًا بعودتك،';

  @override
  String get username_snack_alert => 'اضغط لفترة طويلة لتعديل أسم المستخدم.';

  @override
  String get username_dialog_title => 'أسم المستخدم';

  @override
  String get username_dialog_info =>
      'أدخل أسم المستخدم الخاص بك والذي سيتم عرضه على لوحة التحكم.';

  @override
  String get username_dialog_button_apply => 'تطبيق';

  @override
  String get restrictions_heading => 'القيود';

  @override
  String get apps_blocking_tile_title => 'حظر التطبيقات';

  @override
  String get apps_blocking_tile_subtitle =>
      'حدد قيودا على التطبيقات بطرق متعددة.';

  @override
  String get websites_blocking_tile_subtitle =>
      'حدد قيودا على المواقع الإباحية والمخصصة.';

  @override
  String get screen_time_label => 'وقت استخدام الشاشة';

  @override
  String get longest_streak_label => 'أطول سلسلة';

  @override
  String get current_streak_label => 'السلسلة الحالية';

  @override
  String get successful_sessions_label => 'جلسات ناجحة';

  @override
  String get failed_sessions_label => 'الجلسات الفاشلة';

  @override
  String get statistics_tab_title => 'إحصائيات';

  @override
  String get screen_segment_label => 'الشاشة';

  @override
  String get data_segment_label => 'بيانات';

  @override
  String get mobile_label => 'الجوال';

  @override
  String get wifi_label => 'الواي فاي';

  @override
  String get most_used_apps_heading => 'التطبيقات الأكثر استخداما';

  @override
  String get show_all_apps_tile_title => 'عرض جميع التطبيقات';

  @override
  String get search_apps_hint => 'ابحث عن التطبيقات...';

  @override
  String get notifications_tab_title => 'الإشعارات';

  @override
  String get notifications_tab_info =>
      'جمع الإشعارات من التطبيقات وضبط جداول مثل الصباح، الظهر، المساء، والليل. كن على اطلاع دون انقطاعات مستمرة.';

  @override
  String get batched_apps_tile_title => 'التطبيقات المجمعة';

  @override
  String get batch_recap_dropdown_title => 'نوع ملخص الدفعة';

  @override
  String get batch_recap_dropdown_info =>
      'اختر ما يتم إرساله عند تفعيل الجدول — كل الإشعارات أو ملخص فقط.';

  @override
  String get batch_recap_option_summery_only => 'الملخص فقط';

  @override
  String get batch_recap_option_all_notifications => 'جميع الإشعارات';

  @override
  String get notification_history_tile_title => 'سجل الإشعارات';

  @override
  String get store_all_tile_title => 'تخزين جميع الإشعارات';

  @override
  String get store_all_tile_subtitle => 'حفظ الإشعارات غير المجمعة أيضا.';

  @override
  String get schedules_heading => 'الجداول الزمنية';

  @override
  String get new_schedule_fab_button => 'جدول جديد';

  @override
  String get new_schedule_dialog_info =>
      'أدخل اسما لجدول الإشعارات لتسهيل التعرف عليه.';

  @override
  String get new_schedule_dialog_field_label => 'اسم الجدول';

  @override
  String get shorts_blocking_tab_title => 'حجب الفيديوهات القصيرة';

  @override
  String get shorts_blocking_tab_info =>
      'تحكم في الوقت الذي تقضيه في مشاهدة المحتوى القصير عبر منصات مثل إنستجرام، يوتيوب، سناب شات، وفيسبوك، بما في ذلك مواقعهم الإلكترونية.';

  @override
  String get short_content_heading => 'المحتوى القصير';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'المتبقي من $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'حدد حدا زمنيا يوميا للمحتوى القصير. عند الوصول إلى الحد، سيتوقف عرض المحتوى القصير حتى منتصف الليل.';

  @override
  String get instagram_features_tile_title => 'إنستجرام';

  @override
  String get instagram_features_tile_subtitle => 'تقييد الميزات على إنستجرام.';

  @override
  String get instagram_features_block_reels => 'تقييد قسم الريلز.';

  @override
  String get instagram_features_block_explore => 'تقييد قسم الاستكشاف.';

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
  String get snapchat_features_tile_title => 'سناب شات';

  @override
  String get snapchat_features_tile_subtitle => 'تقييد الميزات على سناب شات.';

  @override
  String get snapchat_features_block_spotlight => 'تقييد قسم Spotlight.';

  @override
  String get snapchat_features_block_discover => 'تقييد قسم Discover.';

  @override
  String get youtube_features_tile_title => 'يوتيوب';

  @override
  String get youtube_features_tile_subtitle =>
      'تقييد الفيديوهات القصيرة على يوتيوب.';

  @override
  String get facebook_features_tile_title => 'فيسبوك';

  @override
  String get facebook_features_tile_subtitle => 'تقييد الريلز على فيسبوك.';

  @override
  String get reddit_features_tile_title => 'ريديت';

  @override
  String get reddit_features_tile_subtitle =>
      'تقييد الفيديوهات القصيرة على ريديت.';

  @override
  String get websites_blocking_tab_title => 'حجب المواقع الإلكترونية';

  @override
  String get websites_blocking_tab_info =>
      'حظر مواقع البالغين وأي مواقع مخصصة تختارها لخلق تجربة تصفح أكثر أمانًا وتركيزًا. تحكم في تصفحك وابقَ خاليًا من التشتيت.';

  @override
  String get adult_content_heading => 'محتوى للبالغين';

  @override
  String get block_nsfw_title => 'حظر المحتوى للبالغين';

  @override
  String get block_nsfw_subtitle =>
      'تقييد المتصفحات من فتح المواقع الإباحية والمحتوى غير المناسب.';

  @override
  String get block_nsfw_dialog_info =>
      'هل أنت متأكد؟ هذا الإجراء لا يمكن التراجع عنه. بمجرد تفعيل حجب المواقع الإباحية، لن تتمكن من إيقافه طالما أن هذا التطبيق مثبت على جهازك.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'احجب على أي حال';

  @override
  String get blocked_websites_heading => 'المواقع المحجوبة';

  @override
  String get blocked_websites_empty_list_hint =>
      'انقر على زر «+ إضافة موقع» لإضافة المواقع المشتتة التي ترغب في حجبها.';

  @override
  String get add_website_fab_button => 'إضافة موقع';

  @override
  String get add_website_dialog_title => 'موقع مشتت';

  @override
  String get add_website_dialog_info => 'أدخل رابط الموقع الذي تريد حظره.';

  @override
  String get add_website_dialog_is_nsfw =>
      'هل الموقع يحتوي على محتوى للبالغين؟';

  @override
  String get add_website_dialog_nsfw_warning =>
      'تحذير: لا يمكن إزالة مواقع البالغين بعد إضافتها.';

  @override
  String get add_website_dialog_button_block => 'حظر';

  @override
  String get add_website_already_exist_snack_alert =>
      'تمت إضافة الرابط مسبقا إلى قائمة المواقع المحظورة.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'رابط غير صالح! تعذر تحليل اسم المضيف.';

  @override
  String get remove_website_dialog_title => 'إزالة الموقع';

  @override
  String remove_website_dialog_info(String websitehost) {
    return 'هل أنت متأكد أنك تريد إزالة \'$websitehost\' من المواقع المحجوبة.';
  }

  @override
  String get focus_session_duration_tile_title => 'مدة الجلسة';

  @override
  String get focus_session_duration_dialog_info =>
      'يرجى اختيار المدة المطلوبة لهذه جلسة التركيز لتحديد الفترة التي ترغب في البقاء خلالها مركزا وخاليا من المشتتات.';

  @override
  String get timeline_tab_title => 'الجدول الزمني';

  @override
  String get calender_heading => 'التقويم';

  @override
  String get focus_session_tile_timestamp_label => 'الطابع الزمني';

  @override
  String get focus_session_tile_duration_label => 'المدة';

  @override
  String get focus_session_tile_reflection_label => 'تأمل';

  @override
  String get active_session_reflection_dialog_title => 'تأمل الجلسة';

  @override
  String get active_session_reflection_dialog_info =>
      'خذ لحظة للتأمل في تقدمك. ما هو هدفك من هذه الجلسة؟ ماذا أنجزت خلال هذه الجلسة؟';

  @override
  String get active_session_reflection_dialog_tip =>
      'نصيحة: يمكنك دائما تعديل هذا لاحقا في خط زمني الجلسة.';

  @override
  String get notifications_empty_list_hint =>
      'لم يتم تجميع أي إشعارات لهذا اليوم.';

  @override
  String get conversations_label => 'المحادثات';

  @override
  String get last_24_hours_heading => 'آخر 24 ساعة';

  @override
  String get notification_timeline_tab_info =>
      'تصفح سجل إشعاراتك عن طريق اختيار تاريخ من التقويم. راجع التطبيقات التي لفتت انتباهك وتأمل في عاداتك الرقمية.';

  @override
  String get monthly_label => 'شهريا';

  @override
  String get daily_label => 'يوميا';

  @override
  String get search_notifications_sheet_info =>
      'ابحث بسهولة في الإشعارات السابقة من خلال العنوان أو المحتوى. يساعدك ذلك على العثور بسرعة على التنبيهات المهمة.';

  @override
  String get search_notifications_hint => 'ابحث في الإشعارات...';

  @override
  String get search_notifications_empty_list_hint =>
      'لم يتم العثور على إشعارات تطابق بحثك.';

  @override
  String get app_info_none_warning =>
      'تعذر العثور على التطبيق للحزمة المحددة. جار العودة إلى الشاشة الرئيسية.';

  @override
  String get emergency_fab_button => 'طوارئ';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'سيؤدي هذا الإجراء إلى إيقاف مؤقت لحاجز التطبيقات لمدة 5 دقائق القادمة. لديك $leftPassesCount فرص متبقية. بعد استخدام كل الفرص، سيظل التطبيق محظورا حتى منتصف الليل أو انتهاء جلسة التركيز النشطة.\n\nهل ترغب في المتابعة؟';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'استخدم على أي حال';

  @override
  String get emergency_started_snack_alert =>
      'تم إيقاف حاجز التطبيقات مؤقتا وسيستأنف الحظر خلال 5 دقائق.';

  @override
  String get emergency_already_active_snack_alert =>
      'مؤقت التطبيق حاليا إما موقوف أو غير نشط. إذا كانت الإشعارات مفعلة، ستتلقى تحديثات حول الوقت المتبقي.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'لقد استخدمت جميع فرص الطوارئ المتاحة لك. ستظل التطبيقات المحجوبة محظورة حتى منتصف الليل، أو حتى انتهاء جلسة التركيز النشطة.';

  @override
  String get app_limit_status_not_set => 'غير محدد';

  @override
  String get app_timer_tile_title => 'مؤقت التطبيق';

  @override
  String get app_timer_picker_dialog_info =>
      'حدد حدا زمنيا يوميا لهذا التطبيق. عند الوصول إلى الحد، سيتم إيقاف التطبيق حتى منتصف الليل.';

  @override
  String get usage_reminders_tile_title => 'تذكيرات الاستخدام';

  @override
  String get usage_reminders_tile_subtitle =>
      'تنبيهات لطيفة عند استخدام التطبيقات المحددة بالوقت.';

  @override
  String get app_launch_limit_tile_title => 'حد الإطلاق';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'تم الإطلاق $count مرة اليوم.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'حدد عدد المرات التي يمكنك فيها فتح هذا التطبيق يوميا. بمجرد الوصول إلى الحد، سيتم إيقافه مؤقتا حتى منتصف الليل.';

  @override
  String get app_active_period_tile_title => 'الفترة النشطة';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'من $startTime إلى $endTime';
  }

  @override
  String get internet_access_tile_title => 'الوصول إلى الإنترنت';

  @override
  String get internet_access_tile_subtitle =>
      'قم بإيقاف التشغيل لحظر اتصال التطبيق بالإنترنت.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'تم حظر الإنترنت لتطبيق $appName.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'تم رفع الحظر عن الإنترنت لتطبيق $appName.';
  }

  @override
  String get launch_app_tile_title => 'فتح التطبيق';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'افتح $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'اذهب إلى إعدادات التطبيق';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'قم بإدارة إعدادات التطبيق مثل الإشعارات، الأذونات، التخزين والمزيد.';

  @override
  String get include_in_stats_tile_title => 'تضمين في استخدام الشاشة';

  @override
  String get include_in_stats_tile_subtitle =>
      'قم بإيقاف التشغيل لاستبعاد هذا التطبيق من إجمالي استخدام الشاشة.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return 'تم استبعاد $appName من إجمالي استخدام الشاشة.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return 'تم تضمين $appName في إجمالي استخدام الشاشة.';
  }

  @override
  String get general_tab_title => 'عام';

  @override
  String get appearance_heading => 'المظهر';

  @override
  String get theme_mode_tile_title => 'وضع السمة';

  @override
  String get theme_mode_system_label => 'النظام';

  @override
  String get theme_mode_light_label => 'فاتح';

  @override
  String get theme_mode_dark_label => 'داكن';

  @override
  String get material_color_tile_title => 'لون المواد';

  @override
  String get amoled_dark_tile_title => 'الوضع الداكن AMOLED';

  @override
  String get amoled_dark_tile_subtitle =>
      'استخدم اللون الأسود النقي في وضع السمة الداكنة.';

  @override
  String get dynamic_colors_tile_title => 'ألوان ديناميكية';

  @override
  String get dynamic_colors_tile_subtitle =>
      'استخدم ألوان الجهاز إذا كانت مدعومة.';

  @override
  String get defaults_heading => 'الإعدادات الافتراضية';

  @override
  String get app_language_tile_title => 'لغة التطبيق';

  @override
  String get default_home_tab_tile_title => 'علامة التبويب الرئيسية';

  @override
  String get usage_history_tile_title => 'سجل الاستخدام';

  @override
  String get usage_history_15_days => '15 يوما';

  @override
  String get usage_history_1_month => 'شهر 1';

  @override
  String get usage_history_3_month => '3 أشهر';

  @override
  String get usage_history_6_month => '6 أشهر';

  @override
  String get usage_history_1_year => 'سنة 1';

  @override
  String get service_heading => 'خدمة';

  @override
  String get service_stopping_warning =>
      'إذا توقف تطبيق Mindful عن العمل فجأة، يرجى منح إذن \"تجاهل تحسين البطارية\" ليتمكن من العمل في الخلفية. إذا استمرت المشكلة، حاول إضافة Mindful إلى القائمة البيضاء لضمان أداء مستمر دون انقطاع.';

  @override
  String get whitelist_app_tile_title => 'أضف Mindful إلى القائمة البيضاء';

  @override
  String get whitelist_app_tile_subtitle =>
      'اسمح لتطبيق Mindful بالبدء التلقائي.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'هذا الجهاز لا يدعم إدارة التشغيل التلقائي.';

  @override
  String get database_tab_title => 'قاعدة البيانات';

  @override
  String get import_db_tile_title => 'استيراد قاعدة البيانات';

  @override
  String get import_db_tile_subtitle => 'استيراد قاعدة البيانات من ملف.';

  @override
  String get export_db_tile_title => 'تصدير قاعدة البيانات';

  @override
  String get export_db_tile_subtitle => 'تصدير قاعدة البيانات إلى ملف.';

  @override
  String get crash_logs_heading => 'سجلات الأعطال';

  @override
  String get crash_logs_info =>
      'إذا واجهت أي مشكلة، يمكنك الإبلاغ عنها على GitHub مع ملف السجل. يحتوي الملف على تفاصيل مثل الشركة المصنعة لجهازك، الطراز، إصدار أندرويد، إصدار SDK، وسجلات الأعطال. ستساعدنا هذه المعلومات في تحديد المشكلة وحلها بشكل أفضل.';

  @override
  String get crash_logs_export_tile_title => 'تصدير سجلات الأعطال';

  @override
  String get crash_logs_export_tile_subtitle =>
      'تصدير سجلات الأعطال إلى ملف JSON.';

  @override
  String get crash_logs_view_tile_title => 'عرض السجلات';

  @override
  String get crash_logs_view_tile_subtitle => 'استعرض سجلات الأعطال المخزنة.';

  @override
  String get crash_logs_empty_list_hint => 'لم يتم تسجيل أي أعطال حتى الآن.';

  @override
  String get crash_logs_clear_tile_title => 'مسح السجلات';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'حذف جميع سجلات الأعطال من قاعدة البيانات.';

  @override
  String get crash_logs_clear_dialog_info =>
      'هل أنت متأكد أنك تريد مسح جميع سجلات الأعطال من قاعدة البيانات؟';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'امسح على أي حال';

  @override
  String get about_tab_title => 'حول';

  @override
  String get changelog_tile_title => 'سجل التغييرات';

  @override
  String get changelog_tile_subtitle => 'اكتشف الجديد.';

  @override
  String get full_changelog_tile_title => 'سجل التغييرات الكامل';

  @override
  String get redirected_to_github_subtitle => 'سيتم توجيهك إلى GitHub.';

  @override
  String get contribute_heading => 'شارك في التطوير';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'عرض كود المصدر.';

  @override
  String get report_issue_tile_title => 'الإبلاغ عن مشكلة';

  @override
  String get suggest_idea_tile_title => 'اقترح فكرة';

  @override
  String get write_email_tile_title => 'راسلنا عبر البريد الإلكتروني';

  @override
  String get write_email_tile_subtitle =>
      'سيتم توجيهك إلى تطبيق البريد الإلكتروني.';

  @override
  String get privacy_policy_heading => 'سياسة الخصوصية';

  @override
  String get privacy_policy_info =>
      'تلتزم Mindful بحماية خصوصيتك. نحن لا نجمع أو نخزن أو ننقل أي نوع من بيانات المستخدم. يعمل التطبيق بالكامل دون اتصال بالإنترنت، مما يضمن بقاء معلوماتك الشخصية خاصة وآمنة على جهازك. كبرنامج مجاني ومفتوح المصدر (FOSS)، يضمن Mindful شفافية كاملة وتحكم المستخدم الكامل في بياناته.';

  @override
  String get more_details_button => 'مزيد من التفاصيل';
}
