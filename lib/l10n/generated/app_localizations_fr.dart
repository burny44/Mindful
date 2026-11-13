// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get mindful_tagline => 'Concentrez-vous sur ce qui compte vraiment';

  @override
  String get permission_status_off => 'Désactivé';

  @override
  String get permission_status_allowed => 'Autorisé';

  @override
  String get permission_status_not_allowed => 'Accès non autorisé';

  @override
  String get permission_button_grant_permission => 'Donner l\'autorisation';

  @override
  String get permission_button_agree_and_continue => 'Accepter et continuer';

  @override
  String get permission_button_not_now => 'Pas maintenant';

  @override
  String get permission_button_help => 'Besoin d\'aide ?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful est 100% sécurisé et fonctionne hors ligne. Nous ne collectons ni stockons aucune donnée personnelle.';

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
    return '1. Cliquez sur le bouton $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Sélectionnez Mindful sur l\'écran suivant.';

  @override
  String get permission_grant_step_three =>
      '3. Cliquez sur le bouton et activez-le comme ci-dessous.';

  @override
  String get permission_notification_title => 'Envoyer des notifications';

  @override
  String get permission_alarms_title => 'Alarmes & Rappels';

  @override
  String get permission_alarms_info =>
      'Veuillez accorder la permission de régler les alarmes et les rappels. Cela permettra à Mindful de démarrer votre horaire de coucher à l\'heure, de réinitialiser les minuteurs de l\'application tous les jours à minuit et de vous aider à rester sur la bonne voie.';

  @override
  String get permission_alarms_device_tile_label =>
      'Autoriser à définir des alarmes et des rappels';

  @override
  String get permission_usage_title => 'Accès aux données d\'utilisation';

  @override
  String get permission_usage_info =>
      'Veuillez accorder l\'autorisation d\'accès aux données d\'utilisation. Cela permettra à Mindful de surveiller l\'utilisation des applications et de gérer l\'accès à certaines applications, pour un environnement numérique plus contrôlé et propice à la concentration.';

  @override
  String get permission_usage_device_tile_label =>
      'Autoriser l\'accès aux données d\'utilisation';

  @override
  String get permission_overlay_title => 'Afficher la superposition';

  @override
  String get permission_overlay_info =>
      'Veuillez accorder la permission d\'afficher la superposition. Cela permettra à Mindful d\'afficher une surcouche quand une application en pause est ouverte, ce qui vous aidera à rester concentré et à maintenir votre planning.';

  @override
  String get permission_overlay_device_tile_label =>
      'Autoriser la superposition sur d\'autres applis';

  @override
  String get permission_accessibility_title => 'Accessibilité';

  @override
  String get permission_accessibility_info =>
      'Veuillez accorder l\'autorisation d\'accessibilité. Cela permettra à Mindful de restreindre l\'accès au contenu vidéo court (ex : Reels, Shorts) dans les applications de réseaux sociaux et les navigateurs, et filtrer les sites Web inappropriés.';

  @override
  String get permission_accessibility_required =>
      'Mindful a besoin des permissions d\'accessibilité pour mieux bloquer les sites internet et les formats courts.';

  @override
  String get permission_accessibility_device_tile_label => 'Utiliser Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Désactiver l\'optimisation de la batterie';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Déjà non restreint';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Désactiver la restriction d\'arrière-plan';

  @override
  String get permission_battery_optimization_allow_info =>
      'Autoriser la désactivation de l\'optimisation de la batterie accordera automatiquement la permission \'Alarmes & Rappels\' sur certains appareils.';

  @override
  String get permission_vpn_title => 'Créer un VPN';

  @override
  String get permission_vpn_info =>
      'Veuillez accorder la permission de créer une connexion au réseau privé virtuel (VPN). Cela permettra à Mindful de restreindre l\'accès à Internet pour les applications désignées en créant un VPN local sur le périphérique.';

  @override
  String get permission_notification_access_title => 'Accès aux notifications';

  @override
  String get permission_notification_access_info =>
      'Veuillez accorder l\'autorisation d\'accès aux notifications. Cela permettra à Mindful d\'organiser vos notifications et de les envoyer selon votre planning.';

  @override
  String get permission_notification_access_required =>
      'Mindful nécessite un accès aux notifications pour regrouper et planifier les notifications.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Autoriser l\'accès aux notifications';

  @override
  String get day_today => 'Aujourd’hui';

  @override
  String get day_yesterday => 'Hier';

  @override
  String nDays(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jours',
      one: '1 jour',
      zero: '0 jour',
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
      other: '$countString heures',
      one: '1 heure',
      zero: '0 heure',
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
      other: '$countString secondes',
      one: '1 seconde',
      zero: '0 seconde',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'et';

  @override
  String get timer_status_active => 'Activé';

  @override
  String get timer_status_paused => 'En pause';

  @override
  String get create_button => 'Créer';

  @override
  String get update_button => 'Mettre à jour';

  @override
  String get dialog_button_cancel => 'Annuler';

  @override
  String get dialog_button_remove => 'Supprimer';

  @override
  String get dialog_button_set => 'Définir';

  @override
  String get dialog_button_reset => 'Réinitialiser';

  @override
  String get dialog_button_infinite => 'Infini';

  @override
  String get schedule_start_label => 'Démarrer';

  @override
  String get schedule_end_label => 'Fin';

  @override
  String get development_dialog_info =>
      'Mindful est actuellement en cours de développement et peut avoir des bugs ou des fonctionnalités incomplètes. Si vous rencontrez des problèmes, merci de les signaler pour nous aider à nous améliorer.\n\nMerci pour vos retours !';

  @override
  String get development_dialog_button_report_issue => 'Signaler un problème';

  @override
  String get development_dialog_button_close => 'Fermer';

  @override
  String get quick_actions_heading => 'Actions rapides';

  @override
  String get select_distracting_apps_heading =>
      'Sélectionner les apps qui vous distraient';

  @override
  String get your_distracting_apps_heading => 'Apps qui vous distraient';

  @override
  String get select_more_apps_heading => 'Sélectionnez plus d\'apps';

  @override
  String get imp_distracting_apps_snack_alert =>
      'L\'ajout d\'applications système importantes à la liste des applications qui vous déconcentrent n\'est pas autorisé.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Le temps d\'écran et les restrictions ne sont pas disponibles pour cette application. Pour l\'instant, seulement la consommation de données est disponible';

  @override
  String get active_period_info =>
      'Définissez une période pendant laquelle l\'accès sera autorisé. En dehors de cette période, l\'accès sera restreint.';

  @override
  String get donation_card_title => 'Soutenez-nous';

  @override
  String get donation_card_info =>
      'Mindful est une application gratuite et open-source, développée avec dévouement durant des mois. Si elle vous a aidé, votre don signifierait beaucoup pour nous. Chaque don nous permet de continuer à l\'améliorer et la maintenir pour tous.';

  @override
  String get operation_failed_snack_alert =>
      'L\'opération a échoué, une erreur s\'est produite !';

  @override
  String get donation_card_button_donate => 'Faire un don';

  @override
  String get app_restart_dialog_title => 'Redémarrage nécessaire';

  @override
  String get app_restart_dialog_info =>
      'Mindful redémarrera automatiquement à la fin du compte à rebours. Merci de patienter le temps que les modifications soient appliquées.';

  @override
  String get onboarding_skip_btn_label => 'Passer';

  @override
  String get onboarding_finish_setup_btn_label => 'Terminer la configuration';

  @override
  String get onboarding_page_one_title => 'Maitriser votre concentration.';

  @override
  String get onboarding_page_one_info =>
      'Que vous travailliez, étudiiez, ou que vous reposiez, Mindful met en pause les distractions et vous permet de garder le contrôle avec des sessions de concentration personnalisables.';

  @override
  String get onboarding_page_two_title => 'Bloquer les distractions.';

  @override
  String get onboarding_page_two_info =>
      'Définissez des limites d\'utilisation, mettez automatiquement en pause les applications et créez des habitudes numériques plus saines. Utilisez le mode temps de sommeil pour vous détendre et profiter d\'une nuit sans distraction.';

  @override
  String get onboarding_page_three_title => 'Confidentialité avant tout.';

  @override
  String get onboarding_page_three_info =>
      'Mindful est 100% open-source et fonctionne entièrement hors ligne. Nous ne collectons ni ne partageons pas vos données personnelles — votre vie privée est garantie à tous les niveaux.';

  @override
  String get onboarding_page_permissions_title => 'Permissions indispensables.';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful a besoin des autorisations suivantes pour suivre et gérer votre temps d\'écran, vous aider à réduire les distractions et améliorer votre concentration.';

  @override
  String get dashboard_tab_title => 'Tableau de bord';

  @override
  String get focus_now_fab_button => 'Se concentrer';

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
  String get welcome_greetings => 'Bienvenue à nouveau,';

  @override
  String get username_snack_alert =>
      'Appuyez longuement pour modifier le nom d\'utilisateur.';

  @override
  String get username_dialog_title => 'Nom d’utilisateur';

  @override
  String get username_dialog_info =>
      'Entrez le nom d\'utilisateur qui s\'affichera sur le tableau de bord.';

  @override
  String get username_dialog_button_apply => 'Confirmer';

  @override
  String get restrictions_heading => 'Restrictions';

  @override
  String get apps_blocking_tile_title => 'Blocage des applications';

  @override
  String get apps_blocking_tile_subtitle =>
      'Limitez vos applications de plusieurs façons.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Limit adult and custom websites.';

  @override
  String get screen_time_label => 'Temps d\'écran';

  @override
  String get longest_streak_label => 'Plus longue série';

  @override
  String get current_streak_label => 'Série en cours';

  @override
  String get successful_sessions_label => 'Sessions réussies';

  @override
  String get failed_sessions_label => 'Sessions échouées';

  @override
  String get statistics_tab_title => 'Statistiques';

  @override
  String get screen_segment_label => 'Écran';

  @override
  String get data_segment_label => 'Données';

  @override
  String get mobile_label => 'Mobile';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'Applications les plus utilisées';

  @override
  String get show_all_apps_tile_title => 'Afficher toutes les apps';

  @override
  String get search_apps_hint => 'Search apps...';

  @override
  String get notifications_tab_title => 'Notifications';

  @override
  String get notifications_tab_info =>
      'Batch notification from apps and set schedules like morning, noon, evening and night. Stay updated without constant interruptions.';

  @override
  String get batched_apps_tile_title => 'Apps regroupées';

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
  String get schedules_heading => 'Horaires';

  @override
  String get new_schedule_fab_button => 'Nouvel horaire';

  @override
  String get new_schedule_dialog_info =>
      'Entrez un nom pour l\'horaire de notification pour l\'identifier facilement.';

  @override
  String get new_schedule_dialog_field_label => 'Nom de l\'horaire';

  @override
  String get shorts_blocking_tab_title => 'In app blocking';

  @override
  String get shorts_blocking_tab_info =>
      'Control how much time you spend on short content across platforms like Instagram, YouTube, Snapchat, and Facebook, including their websites.';

  @override
  String get short_content_heading => 'Contenu court';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Temps restant sur $timeShortString';
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
  String get adult_content_heading => 'Contenu pour adultes';

  @override
  String get block_nsfw_title => 'Bloquer le NSFW';

  @override
  String get block_nsfw_subtitle =>
      'Empêcher les navigateurs d\'ouvrir des sites pour adultes et pornographiques.';

  @override
  String get block_nsfw_dialog_info =>
      'Êtes-vous sûr(e) ? Cette action est irréversible. Une fois que le bloqueur de sites pour adultes est activé, vous ne pouvez pas le désactiver tant que cette application est installée sur votre appareil.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Bloquer quand même';

  @override
  String get blocked_websites_heading => 'Sites web bloqués';

  @override
  String get blocked_websites_empty_list_hint =>
      'Click on \'+ Add Website\' button to add distracting websites which you wish to block.';

  @override
  String get add_website_fab_button => 'Ajouter un site web';

  @override
  String get add_website_dialog_title => 'Sites web qui vous distraient';

  @override
  String get add_website_dialog_info =>
      'Entrez l\'Url d\'un site web que vous voulez bloquer.';

  @override
  String get add_website_dialog_is_nsfw => 'Is nsfw site?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Warning: Nsfw sites cannot be removed once added.';

  @override
  String get add_website_dialog_button_block => 'Bloquer';

  @override
  String get add_website_already_exist_snack_alert =>
      'L\'URL a déjà été ajouté à la liste des sites web bloqués.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'URL invalide ! Impossible d\'analyser le nom d\'hôte.';

  @override
  String get remove_website_dialog_title => 'Retirer le site web';

  @override
  String remove_website_dialog_info(String websitehost) {
    return 'Êtes-vous sûr(e) ? Vous voulez supprimer \'$websitehost\' des sites web bloqués.';
  }

  @override
  String get focus_session_duration_tile_title => 'Durée de la session';

  @override
  String get focus_session_duration_dialog_info =>
      'Veuillez sélectionner la durée souhaitée pour cette session de concentration, en déterminant la durée pendant laquelle vous souhaitez rester concentré et sans distraction.';

  @override
  String get timeline_tab_title => 'Timeline';

  @override
  String get calender_heading => 'Calender';

  @override
  String get focus_session_tile_timestamp_label => 'Timestamp';

  @override
  String get focus_session_tile_duration_label => 'Duration';

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
  String get emergency_fab_button => 'Urgence';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Cette action mettra en pause le bloqueur de l\'application pour les 5 prochaines minutes. Il vous reste $leftPassesCount délais. Après avoir utilisé tous les délais, l\'application restera bloquée jusqu\'à minuit, ou la session de concentration active se terminera.\n\nContinuer quand même ?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Utiliser quand même';

  @override
  String get emergency_started_snack_alert =>
      'Le bloqueur d\'application est suspendu et reprendra le blocage dans 5 minutes.';

  @override
  String get emergency_already_active_snack_alert =>
      'Le bloqueur de l\'application est actuellement suspendu ou inactif. Si les notifications sont activées, vous recevrez informations concernant le temps restant.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Vous avez utilisé tous vos délais d\'urgence. Les applications bloquées resteront bloquées jusqu\'à minuit, ou la session de concentration active se termine.';

  @override
  String get app_limit_status_not_set => 'Non défini';

  @override
  String get app_timer_tile_title => 'Minuteur de l\'application';

  @override
  String get app_timer_picker_dialog_info =>
      'Définissez une limite de temps quotidienne pour cette application. Une fois votre limite atteinte, l\'application sera suspendue jusqu\'à minuit.';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => 'Limite de lancements';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Lancé $count fois aujourd\'hui.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Définissez combien de fois vous pouvez ouvrir cette application chaque jour. Une fois la limite atteinte, elle sera suspendue jusqu\'à minuit.';

  @override
  String get app_active_period_tile_title => 'Période d\'activité';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'De $startTime à $endTime';
  }

  @override
  String get internet_access_tile_title => 'Accès internet';

  @override
  String get internet_access_tile_subtitle =>
      'Désactivez pour bloquer Internet pour l\'app.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'Internet est bloqué pour $appName.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'Internet est débloqué pour $appName.';
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
