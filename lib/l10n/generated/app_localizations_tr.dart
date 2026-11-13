// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get mindful_tagline => 'Neyin önemli olduğuna odaklan';

  @override
  String get permission_status_off => 'Kapalı';

  @override
  String get permission_status_allowed => 'İzin verildi';

  @override
  String get permission_status_not_allowed => 'İzin verilmedi';

  @override
  String get permission_button_grant_permission => 'İzin verin';

  @override
  String get permission_button_agree_and_continue => 'Kabul edin ve devam edin';

  @override
  String get permission_button_not_now => 'Şimdi değil';

  @override
  String get permission_button_help => 'Yardım?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful 100% güvenli ve çevrimdışı çalışır. Sizin kişisel verileriniz toplamıyor ve depolamıyoruz.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. $button_label\'a tıklayın.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Sonraki ekranda Mindful\'u seçin.';

  @override
  String get permission_grant_step_three =>
      '3. Tıklayın ve alttaki gibi dönüştürmeyi açın.';

  @override
  String get permission_notification_title => 'Bildirimleri gönder';

  @override
  String get permission_alarms_title => 'Alarm & hatırlatıcılar';

  @override
  String get permission_alarms_info =>
      'Lütfen alarm ve hatırlatıcı için izin verin. Bu sayede Mindful ';

  @override
  String get permission_alarms_device_tile_label =>
      'Alarm ve hatırlatıcılara izin verin';

  @override
  String get permission_usage_title => 'Kullanım erişimi';

  @override
  String get permission_usage_info =>
      'Lütfen kullanım erişim izni verin. Bu, Mindful\'un uygulama kullanımını izlemesine ve belirli uygulamalara erişimi yönetmesine olanak tanıyarak daha odaklı ve kontrollü bir dijital ortam sağlayacaktır.';

  @override
  String get permission_usage_device_tile_label => 'Kullanım erişimi verin';

  @override
  String get permission_overlay_title => 'Kaplamayı Görüntüle';

  @override
  String get permission_overlay_info =>
      'Lütfen diğer uygulamaların üzerinde gösterme izni verin. Bu, Mindful\'un duraklatılmış bir uygulama açıldığında bir kaplama göstermesine izin vererek odaklanmanıza ve programınızı sürdürmenize yardımcı olacaktır.';

  @override
  String get permission_overlay_device_tile_label =>
      'Diğer uygulamaların üzerinde gösterime izin ver';

  @override
  String get permission_accessibility_title => 'Erişilebilirlik';

  @override
  String get permission_accessibility_info =>
      'Lütfen erişilebilirlik izni verin. Bu, Mindful\'un sosyal medya uygulamaları ve tarayıcılarda kısa biçimli video içeriğine (ör. Reels, Shorts) erişimi kısıtlamasına ve uygunsuz web sitelerini filtrelemesine olanak tanıyacaktır.';

  @override
  String get permission_accessibility_required =>
      'Mindful, kısa içerikleri ve internet sitelerini etkili bir şekilde engellemek için erişilebilirlik izni gerektirir.';

  @override
  String get permission_accessibility_device_tile_label =>
      'Dikkatliyi kullanın';

  @override
  String get permission_battery_optimization_tile_title =>
      'Batarya optimizasyonu devre dışı bırakın';

  @override
  String get permission_battery_optimization_status_enabled => 'Zaten sınırsız';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Arka plan kısıtlamalarını devre dışı bırak';

  @override
  String get permission_battery_optimization_allow_info =>
      '\'Pil Optimizasyonunu Yoksay\'a izin vermek, bazı cihazlarda otomatik olarak \'Alarmlar ve Hatırlatıcılar\' iznini verecektir.';

  @override
  String get permission_vpn_title => 'Sanal özel ağ oluştur';

  @override
  String get permission_vpn_info =>
      'Lütfen sanal özel ağ(VPN) oluşturmaya izin veriniz. Bu sayede Mindful internetizi lokal bir şekilde kısıtlayacaktır.';

  @override
  String get permission_notification_access_title => 'Bildirim izni';

  @override
  String get permission_notification_access_info =>
      'Lütfen bildirim erişim izni verin. Bu, Mindful\'un bildirimlerinizi düzenlemesine ve bunları programınıza göre göndermesine izin verecektir.';

  @override
  String get permission_notification_access_required =>
      'Mindful, bildirimleri toplu hale getirmek ve zamanlamak için bildirim erişimi gerektirir.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Bildirimlere izin ver';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString saat',
      one: '1 saat',
      zero: '0 saat',
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
      other: '$countString dakika',
      one: '1 dakika',
      zero: '0 dakika',
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
      other: '$countString saniye',
      one: '1 saniye',
      zero: '0 saniye',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 've';

  @override
  String get timer_status_paused => 'Duraklatıldı';

  @override
  String get create_button => 'Oluştur';

  @override
  String get update_button => 'Güncelleme';

  @override
  String get dialog_button_cancel => 'İptal';

  @override
  String get dialog_button_remove => 'Kaldır';

  @override
  String get dialog_button_set => 'Ayarla';

  @override
  String get dialog_button_reset => 'Sıfırla';

  @override
  String get dialog_button_infinite => 'Sonsuz';

  @override
  String get schedule_start_label => 'Başlat';

  @override
  String get schedule_end_label => 'Bitir';

  @override
  String get quick_actions_heading => 'Kısayollar';

  @override
  String get select_distracting_apps_heading =>
      'Dikkat dağıtan uygulamaları seç';

  @override
  String get your_distracting_apps_heading =>
      'Dikkatinizi dağıtan uygulamalarınız';

  @override
  String get select_more_apps_heading => 'Daha fazla uygulama seçin';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Dikkat dağıtıcı uygulamalar listesine önemli sistem uygulamalarının eklenmesine izin verilmez.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Ekran süresi ve kısıtlama bu uygulama için kullanılamıyor. Sadece internet kullanımı erişilebilir';

  @override
  String get active_period_info =>
      'Erişime izin verilecek bir zaman aralığı belirleyin. Bu zaman diliminin dışında erişim kısıtlanacaktır.';

  @override
  String get donation_card_title => 'Bizi destekleyin';

  @override
  String get donation_card_info =>
      'Mindful ücretsiz ve açık kaynak kodludur, aylar süren özverili çalışmalarla geliştirilmiştir. Eğer size yardımcı olduysa, bağışınız bizim için dünyalara bedeldir. Her katkı, onu herkes için geliştirmeye ve sürdürmeye devam etmemize yardımcı olur.';

  @override
  String get operation_failed_snack_alert =>
      'Operasyon başarısız oldu, bir şeyler ters gitti!';

  @override
  String get donation_card_button_donate => 'Bağış';

  @override
  String get app_restart_dialog_title => 'Yeniden Başlatma Gerekli';

  @override
  String get app_restart_dialog_info =>
      'Geri sayım bittiğinde Mindful otomatik olarak yeniden başlayacaktır. Değişiklikler uygulanırken lütfen sabırlı olun.';

  @override
  String get onboarding_skip_btn_label => 'Atla';

  @override
  String get onboarding_finish_setup_btn_label => 'Kurulumu bitirin';

  @override
  String get onboarding_page_one_title => 'En iyi odak.';

  @override
  String get onboarding_page_one_info =>
      'Dikkatinizi dağıtan uygulamaları duraklatın, kısa içerikleri engelleyin ve özelleştirilebilir odaklanma oturumlarıyla yolunuzdan sapmayın. İster çalışıyor, ister ders çalışıyor veya dinleniyor olun, Mindful kontrolü elinizde tutmanıza yardımcı olur.';

  @override
  String get onboarding_page_two_title => 'Dikkat Dağıtıcıları Engelleyin.';

  @override
  String get onboarding_page_two_info =>
      'Kullanım sınırları belirleyin, uygulamaları otomatik olarak duraklatın ve daha sağlıklı dijital alışkanlıklar oluşturun. Gevşemek ve dikkatinizin dağılmadığı bir gecenin tadını çıkarmak için Yatma Zamanı Modu\'nu kullanın.';

  @override
  String get onboarding_page_three_title => 'Öncelik gizlilik.';

  @override
  String get onboarding_page_three_info =>
      'Mindful 100% açık kaynaklıdır ve tamamen çevrimdışı çalışır. Kişisel verilerinizi toplamıyor veya paylaşmıyoruz — gizliliğiniz her şekilde garanti altındadır.';

  @override
  String get onboarding_page_permissions_title => 'Temel İzinler.';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful, ekran sürenizi takip etmek ve yönetmek için temel izinleri takip etmeyi gerektirir, dikkat dağıtıcı unsurları azaltmaya ve odaklanmayı geliştirmeye yardımcı olur.';

  @override
  String get dashboard_tab_title => 'Kontrol Paneli';

  @override
  String get focus_now_fab_button => 'Şimdi odaklan';

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
  String get welcome_greetings => 'Tekrar hoş geldin,';

  @override
  String get username_snack_alert => 'İsmi düzenlemek için uzun basın.';

  @override
  String get username_dialog_title => 'Kullanıcı adı';

  @override
  String get username_dialog_info =>
      'Kontrol panelinde görüntülenecek olan kullanıcı adınızı girin.';

  @override
  String get username_dialog_button_apply => 'Uygula';

  @override
  String get restrictions_heading => 'Kısıtlamalar';

  @override
  String get apps_blocking_tile_title => 'Uygulama engelleme';

  @override
  String get apps_blocking_tile_subtitle =>
      'Uygulamaları çeşitli şekillerde sınırlandırın.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Yetişkin ve özel web sitelerini sınırlayın.';

  @override
  String get screen_time_label => 'Ekran süresi';

  @override
  String get statistics_tab_title => 'İstatistikler';

  @override
  String get screen_segment_label => 'Ekran';

  @override
  String get data_segment_label => 'Veri';

  @override
  String get mobile_label => 'Mobil';

  @override
  String get wifi_label => 'Wifi';

  @override
  String get most_used_apps_heading => 'En çok kullanılan uygulamalar';

  @override
  String get show_all_apps_tile_title => 'Tüm uygulamaları göster';

  @override
  String get search_apps_hint => 'Uygulama ara...';

  @override
  String get notifications_tab_title => 'Bildirimler';

  @override
  String get notifications_tab_info =>
      'Uygulamalardan toplu bildirim alın ve sabah, öğlen, akşam ve gece gibi programlar ayarlayın. Sürekli kesinti olmadan güncel kalın.';

  @override
  String get batched_apps_tile_title => 'Gruplanmış uygulamalar';

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
  String get store_all_tile_title => 'Tüm bildirimleri sakla';

  @override
  String get store_all_tile_subtitle => 'Save non-batched notifications too.';

  @override
  String get schedules_heading => 'Program';

  @override
  String get new_schedule_fab_button => 'Yeni program';

  @override
  String get new_schedule_dialog_info =>
      'Kolayca tanımlanmasına yardımcı olmak için bildirim zamanlamasına bir ad girin.';

  @override
  String get new_schedule_dialog_field_label => 'Program adı';

  @override
  String get shorts_blocking_tab_title => 'Kısa video engelleyici';

  @override
  String get shorts_blocking_tab_info =>
      'Web siteleri de dahil olmak üzere Instagram, YouTube, Snapchat ve Facebook gibi platformlarda kısa içeriklere ne kadar zaman harcadığınızı kontrol edin.';

  @override
  String get short_content_heading => 'Kısa video içeriği';

  @override
  String shorts_time_left_from(String timeShortString) {
    return '$timeShortString \'den kalan süre';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Kısa içerik için günlük bir zaman sınırı belirleyin. Sınırınıza ulaşıldığında, kısa içerik gece yarısına kadar duraklatılacaktır.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Instagram\'daki içeriği kısıtlayın.';

  @override
  String get instagram_features_block_reels => 'Reels bölümünü kısıtlayın.';

  @override
  String get instagram_features_block_explore => 'Keşfet bölümünü kısıtlayın.';

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
      'Snapchat\'teki içeriği kısıtlayın.';

  @override
  String get snapchat_features_block_spotlight =>
      'Spotlight bölümünü kısıtlayın.';

  @override
  String get snapchat_features_block_discover => 'Keşfet bölümünü kısıtlayın.';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle =>
      'Youtube\'daki kısa içeriği kısıtla.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle =>
      'Facebook\'ta reelsları kısıtla.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle =>
      'Reddit\'teki kısa videoları kısıtla.';

  @override
  String get websites_blocking_tab_title => 'Website engelleyici';

  @override
  String get websites_blocking_tab_info =>
      'Daha güvenli ve daha odaklı bir çevrimiçi deneyim oluşturmak için yetişkinlere yönelik web sitelerini ve seçtiğiniz tüm özel siteleri engelleyin. Gezinmenizin sorumluluğunu üstlenin ve dikkatiniz dağılmasın.';

  @override
  String get adult_content_heading => 'Yetişkin içeriği';

  @override
  String get block_nsfw_title => 'Nsfw içeriği engelle';

  @override
  String get block_nsfw_subtitle =>
      'Tarayıcıların yetişkin ve porno web sitelerini açmasını kısıtlayın.';

  @override
  String get block_nsfw_dialog_info =>
      'Emin misiniz? Bu işlem geri döndürülemez. Yetişkin siteleri engelleyici AÇIK konuma getirildikten sonra, bu uygulama cihazınızda yüklü olduğu sürece KAPALI konuma getiremezsiniz.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Yinede Engelle';

  @override
  String get blocked_websites_heading => 'Engellenen internet siteleri';

  @override
  String get blocked_websites_empty_list_hint =>
      'Engellemek istediğiniz dikkat dağıtıcı web sitelerini eklemek için \'+ Web Sitesi Ekle\' düğmesine tıklayın.';

  @override
  String get add_website_fab_button => 'Site ekle';

  @override
  String get add_website_dialog_title => 'Dikkat dağıtıcı siteler';

  @override
  String get add_website_dialog_info =>
      'Engellemek istediğiniz web sitesinin url\'sini girin.';

  @override
  String get add_website_dialog_is_nsfw => 'Nsfw sitesi mi?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Uyarı: Nsfw siteleri eklendikten sonra kaldırılamaz.';

  @override
  String get add_website_dialog_button_block => 'Engelle';

  @override
  String get add_website_already_exist_snack_alert =>
      'URL zaten engellenen web siteleri listesine eklenmiştir.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Geçersiz URL! Sunucu adresi ayrıştırılamıyor.';

  @override
  String get focus_session_duration_tile_title => 'Oturum süresi';

  @override
  String get focus_session_duration_dialog_info =>
      'Lütfen bu odaklanma oturumu için istediğiniz süreyi seçin, ne kadar süre odaklanmış ve dikkatiniz dağılmadan kalmak istediğinizi belirleyin.';

  @override
  String get timeline_tab_title => 'Zaman çizelgesi';

  @override
  String get calender_heading => 'Takvim';

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
  String get conversations_label => 'Sohbetler';

  @override
  String get last_24_hours_heading => 'Son 24 Saat';

  @override
  String get notification_timeline_tab_info =>
      'Browse your notification history by selecting a date from the calendar. See which apps grabbed your attention and reflect on your digital habits.';

  @override
  String get monthly_label => 'Aylık';

  @override
  String get daily_label => 'Günlük';

  @override
  String get search_notifications_sheet_info =>
      'Easily find past notifications by searching through their title or content. Helps you quickly locate important alerts.';

  @override
  String get search_notifications_hint => 'Bildirimleri ara...';

  @override
  String get search_notifications_empty_list_hint =>
      'No notifications found matching your search.';

  @override
  String get app_info_none_warning =>
      'Verilen paket için uygulama bulunamadı. Ana ekrana dönülüyor.';

  @override
  String get emergency_fab_button => 'Acil durum';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Bu işlem, uygulama engelleyicisini bir sonraki 5 dakika için duraklatacaktır. $leftPassesCount geçişiniz kaldı. Tüm geçişleri kullandıktan sonra, uygulama gece yarısına kadar veya aktif odaklanma oturumu bitene kadar engellenmiş kalacaktır. \n\nDevam etmek istiyor musunuz?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Yine de kullan';

  @override
  String get emergency_started_snack_alert =>
      'Uygulama engelleyici duraklatıldı ve 5 dakika içinde engellemeye devam edecek.';

  @override
  String get emergency_already_active_snack_alert =>
      'Uygulama engelleyici şu anda ya duraklatılmış ya da etkin değil. Bildirimler etkinse, kalan süreyle ilgili güncellemeler alırsınız.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Tüm acil durum geçişlerinizi kullandınız. Engellenen uygulamalar gece yarısına veya etkin odaklanma oturumu sona erene kadar engellenmiş olarak kalacaktır.';

  @override
  String get app_limit_status_not_set => 'Belirlenmemiş';

  @override
  String get app_timer_tile_title => 'Uygulama zamanlayıcı';

  @override
  String get app_timer_picker_dialog_info =>
      'Bu uygulama için günlük bir zaman sınırı belirleyin. Sınırınıza ulaşıldığında, uygulama gece yarısına kadar duraklatılacaktır.';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => 'Başlatma limiti';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Bugün $count kez başlatıldı.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Bu uygulamayı her gün kaç kez açabileceğinizi ayarlayın. Sınıra ulaşıldığında, gece yarısına kadar duraklatılacaktır.';

  @override
  String get app_active_period_tile_title => 'Aktif dönem';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return '$startTime \'den $endTime \'e kadar';
  }

  @override
  String get internet_access_tile_title => 'Internet erişimi';

  @override
  String get internet_access_tile_subtitle =>
      'Uygulamanın internetini engellemek için kapatın.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return '$appName\'in interneti engellendi.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return '$appName\'in internet engeli kaldırıldı.';
  }

  @override
  String get launch_app_tile_title => 'Uygulamayı başlat';

  @override
  String launch_app_tile_subtitle(String appName) {
    return '$appName uygulamasını açın.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Uygulama ayarlarına gidin';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Bildirimler, izinler, depolama ve daha fazlası gibi uygulama ayarlarını yönetin.';

  @override
  String get include_in_stats_tile_title => 'Ekran kullanımına dahil et';

  @override
  String get include_in_stats_tile_subtitle =>
      'Bu uygulamayı toplam ekran kullanımından hariç tutmak için kapatın.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName toplam ekran kullanımından hariç tutulur.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return 'Toplam ekran kullanımına $appName dahildir.';
  }

  @override
  String get general_tab_title => 'Genel';

  @override
  String get appearance_heading => 'Görünüm';

  @override
  String get theme_mode_tile_title => 'Tema modu';

  @override
  String get theme_mode_system_label => 'Sistem';

  @override
  String get theme_mode_light_label => 'Aydınlık';

  @override
  String get theme_mode_dark_label => 'Karanlık';

  @override
  String get material_color_tile_title => 'Materyal rengi';

  @override
  String get amoled_dark_tile_title => 'AMOLED siyah';

  @override
  String get amoled_dark_tile_subtitle =>
      'Koyu tema için saf siyah rengini kullanın.';

  @override
  String get dynamic_colors_tile_title => 'Dinamik renkler';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Destekleniyorsa cihaz renklerini kullanın.';

  @override
  String get defaults_heading => 'Varsayılanlar';

  @override
  String get app_language_tile_title => 'Uygulama dili';

  @override
  String get default_home_tab_tile_title => 'Ana Sayfa';

  @override
  String get usage_history_tile_title => 'Kullanım Günlüğü';

  @override
  String get usage_history_15_days => '15 gün';

  @override
  String get usage_history_1_month => '1 ay';

  @override
  String get usage_history_3_month => '3 ay';

  @override
  String get usage_history_6_month => '6 ay';

  @override
  String get usage_history_1_year => '1 yıl';

  @override
  String get service_heading => 'Servis';

  @override
  String get service_stopping_warning =>
      'Mindful beklenmedik bir şekilde çalışmayı durdurursa, lütfen arka planda çalışmaya devam etmesi için \'Pil Optimizasyonunu Yoksay\' iznini verin. Sorun devam ederse, kesintisiz performans için Mindful\'u beyaz listeye almayı deneyin.';

  @override
  String get whitelist_app_tile_title => 'Beyaz Liste Mindful';

  @override
  String get whitelist_app_tile_subtitle =>
      'Mindfulun otomatik başlatılmasına izin ver.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Bu cihaz, otomatik başlatma yönetimini desteklemiyor.';

  @override
  String get database_tab_title => 'Veritabanı';

  @override
  String get import_db_tile_title => 'Veritabanını içe aktar';

  @override
  String get import_db_tile_subtitle => 'Veritabanını dosyadan içeri aktar.';

  @override
  String get export_db_tile_title => 'Veritabanını dışa aktar';

  @override
  String get export_db_tile_subtitle => 'Veritabanını dosyadan dışarı aktar.';

  @override
  String get crash_logs_heading => 'Çökme günlüğü';

  @override
  String get crash_logs_info =>
      'Herhangi bir sorunla karşılaşırsanız, bunu GitHub üzerinde log dosyasıyla birlikte rapor edebilirsiniz. Dosya, cihazınızın üreticisi, modeli, Android sürümü, SDK sürümü ve çökme günlükleri gibi detayları içerecektir. Bu bilgiler, problemi daha etkili bir şekilde tanımlamamıza ve çözmemize yardımcı olacaktır.';

  @override
  String get crash_logs_export_tile_title => 'Çökme günlüğünü dışarı aktar';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Çökme günlüğünü json dosyası olarak dışarı aktar.';

  @override
  String get crash_logs_view_tile_title => 'Günlüğü görüntüle';

  @override
  String get crash_logs_view_tile_subtitle =>
      'Saklanan çökme günlüklerini inceleyin.';

  @override
  String get crash_logs_empty_list_hint =>
      'Şu ana kadar hiçbir çökme kaydedilmedi.';

  @override
  String get crash_logs_clear_tile_title => 'Günlükleri temizle';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Tüm çökme raporlarını veritabanından kaldırın.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Veritabanından tüm çökme günlüklerini silmek istediğinizden emin misiniz?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway => 'Temizle';

  @override
  String get about_tab_title => 'Hakkında';

  @override
  String get changelog_tile_title => 'Değişiklik Notları';

  @override
  String get changelog_tile_subtitle => 'Yenilikleri öğrenin.';

  @override
  String get full_changelog_tile_title => 'Tam değişiklik notları';

  @override
  String get redirected_to_github_subtitle =>
      'Şuraya yönlendirileceksiniz: GitHub.';

  @override
  String get contribute_heading => 'Katkıda bulunun';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Kaynak kodunu incele.';

  @override
  String get report_issue_tile_title => 'Sorun bildir';

  @override
  String get suggest_idea_tile_title => 'Bir fikir öner';

  @override
  String get write_email_tile_title => 'Bize e-posta ile yazın';

  @override
  String get write_email_tile_subtitle =>
      'E-posta uygulamasına yönlendirileceksiniz.';

  @override
  String get privacy_policy_heading => 'Gizlilik politikası';

  @override
  String get privacy_policy_info =>
      'Mindful, gizliliğinizi korumaya kararlıdır. Herhangi bir kullanıcı verisini toplamaz, depolamaz veya aktarmaz. Uygulama tamamen çevrimdışıdır ve internet bağlantısı gerektirmez, böylece kişisel bilgileriniz cihazınızda özel ve güvenli kalır. Ücretsiz ve Açık Kaynak Yazılım (FOSS) uygulaması olarak, Mindful, verileriniz üzerinde tam şeffaflık ve kullanıcı kontrolü sağlar.';

  @override
  String get more_details_button => 'Daha fazla bilgi';
}
