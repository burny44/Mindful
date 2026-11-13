// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get mindful_tagline => 'Concéntrate en lo que realmente Importa';

  @override
  String get permission_status_off => 'Desactivado';

  @override
  String get permission_status_allowed => 'Permitido';

  @override
  String get permission_status_not_allowed => 'No permitido';

  @override
  String get permission_button_grant_permission => 'Autorizar';

  @override
  String get permission_button_agree_and_continue => 'Aceptar y continuar';

  @override
  String get permission_button_not_now => 'Ahora no';

  @override
  String get permission_button_help => '¿Ayuda?';

  @override
  String get permission_sheet_privacy_info =>
      'Mindful es 100% seguro y funciona sin conexión. No recopilamos ni almacenamos datos personales.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. Haz clic en el botón $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Seleccione Mindful en la siguiente pantalla.';

  @override
  String get permission_grant_step_three =>
      '3. Haga clic y encienda el interruptor como abajo.';

  @override
  String get permission_notification_title => 'Enviar notificaciones';

  @override
  String get permission_alarms_title => 'Alarmas y Recordatorios';

  @override
  String get permission_alarms_info =>
      'Por favor, concede permisos para configurar alarmas y recordatorios. Esto permitirá que Mindful inicie tu horario de sueño a tiempo, reinicie los temporizadores de la aplicación diariamente a medianoche y te ayude a mantener el control.';

  @override
  String get permission_alarms_device_tile_label =>
      'Permitir establecer alarmas y recordatorios';

  @override
  String get permission_usage_title => 'Acceso al uso';

  @override
  String get permission_usage_info =>
      'Por favor, concede permiso de acceso de uso. Esto permitirá a Mindful monitorizar el uso de aplicaciones y gestionar el acceso a ciertas apps, asegurando un entorno digital más enfocado y controlado.';

  @override
  String get permission_usage_device_tile_label => 'Permitir acceso al uso';

  @override
  String get permission_overlay_title => 'Mostrar superposición';

  @override
  String get permission_overlay_info =>
      'Por favor, concede el permiso de superposición de pantalla. Esto permitirá a Mindful mostrar una superposición cuando se abra una aplicación en pausa, ayudándote a mantenerte centrado y así mantener su horario.';

  @override
  String get permission_overlay_device_tile_label =>
      'Permitir mostrar sobre otras aplicaciones';

  @override
  String get permission_accessibility_title => 'Accesibilidad';

  @override
  String get permission_accessibility_info =>
      'Por favor, concede el permiso de accesibilidad. Esto permitirá a Mindful restringir el acceso al contenido de \"vídeo corto\" (P. ej., Reels, Shorts) dentro de las apps de redes sociales y los navegadores, y filtrar sitios web inapropiados.';

  @override
  String get permission_accessibility_required =>
      'Mindful requiere permiso de accesibilidad para bloquear de forma efectiva el contenido corto y los sitios web.';

  @override
  String get permission_accessibility_device_tile_label => 'Usar Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Ignorar la Optimización de la Batería';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Actualmente \'sin restricciones\'';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Desactivar las restricciones en segundo plano';

  @override
  String get permission_battery_optimization_allow_info =>
      'Permitir \'Ignorar la optimización de la batería\' automáticamente concederá el permiso \'Alarmas y Recordatorios\' en algunos dispositivos.';

  @override
  String get permission_vpn_title => 'Crear una VPN';

  @override
  String get permission_vpn_info =>
      'Por favor, concede el permiso para crear una conexión de Red Privada Virtual (VPN). Esto permitirá a Mindful restringir el acceso a internet para las aplicaciones designadas creando una VPN local en el dispositivo.';

  @override
  String get permission_notification_access_title => 'Acceso a Notificaciones';

  @override
  String get permission_notification_access_info =>
      'Por favor, concede el permiso de acceso a notificaciones. Esto permitirá a Mindful organizar tus notificaciones y entregarlas según tu horario.';

  @override
  String get permission_notification_access_required =>
      'Mindful requiere acceso a notificaciones para agrupar y programar las mismas.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Permitir el acceso a las notificaciones';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString horas',
      one: '1 hora',
      zero: '0 horas',
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
      other: '$countString minutos',
      one: '1 minuto',
      zero: '0 minutos',
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
      other: '$countString segundos',
      one: '1 segundo',
      zero: '0 segundos',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'Y';

  @override
  String get timer_status_paused => 'Pausado';

  @override
  String get create_button => 'Crear';

  @override
  String get update_button => 'Actualizar';

  @override
  String get dialog_button_cancel => 'Cancelar';

  @override
  String get dialog_button_remove => 'Eliminar';

  @override
  String get dialog_button_set => 'Aplicar';

  @override
  String get dialog_button_reset => 'Reiniciar';

  @override
  String get dialog_button_infinite => 'Infinito';

  @override
  String get schedule_start_label => 'Comienza';

  @override
  String get schedule_end_label => 'Termina';

  @override
  String get quick_actions_heading => 'Acciones rápidas';

  @override
  String get select_distracting_apps_heading =>
      'Selecciona las apps que te distraen';

  @override
  String get your_distracting_apps_heading =>
      'Tus aplicaciones que te distraen';

  @override
  String get select_more_apps_heading => 'Selecciona más apps';

  @override
  String get imp_distracting_apps_snack_alert =>
      'No está permitido añadir aplicaciones de sistema importantes a la lista de aplicaciones de distracción.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Las restricciones y el uso de pantalla no están disponibles para esta aplicación. Actualmente, solo el uso de la red es accesible';

  @override
  String get active_period_info =>
      'Establece un período de tiempo durante el cual se permitirá el acceso. Fuera de este marco de tiempo, el acceso estará restringido.';

  @override
  String get donation_card_title => 'Ayúdanos';

  @override
  String get donation_card_info =>
      'Mindful es gratuito y de código abierto, desarrollado con meses de dedicación. Si te ha sido útil, tu donación significaría muchísimo para nosotros. Cada contribución nos ayuda a seguir mejorando y manteniéndolo para todos.';

  @override
  String get operation_failed_snack_alert =>
      'Operación fallida, ¡algo salió mal!';

  @override
  String get donation_card_button_donate => 'Donar';

  @override
  String get app_restart_dialog_title => 'Es necesario reiniciar';

  @override
  String get app_restart_dialog_info =>
      'Mindful se reiniciará automáticamente una vez que termine la cuenta regresiva. Por favor, ten paciencia mientras se aplican los cambios.';

  @override
  String get onboarding_skip_btn_label => 'Saltar';

  @override
  String get onboarding_finish_setup_btn_label => 'Finalizar';

  @override
  String get onboarding_page_one_title => 'Domina el Enfoque';

  @override
  String get onboarding_page_one_info =>
      'Pausa las apps que te distraen, bloquea el contenido corto y mantente centrado con sesiones de enfoque personalizables. Ya sea que estés trabajando, estudiando o relajándote, Mindful te ayuda a mantener el control.';

  @override
  String get onboarding_page_two_title => 'Bloquea las Distracciones';

  @override
  String get onboarding_page_two_info =>
      'Establece límites de uso, pausa aplicaciones automáticamente y crea hábitos digitales más saludables. Usa el Modo Descanso para desconectar y disfrutar de una noche sin distracciones.';

  @override
  String get onboarding_page_three_title => 'Privacidad Ante Todo';

  @override
  String get onboarding_page_three_info =>
      'Mindful es 100% de código abierto y funciona completamente sin conexión. No recopilamos ni compartimos tus datos personales; tu privacidad está garantizada de todas las maneras.';

  @override
  String get onboarding_page_permissions_title => 'Permisos Esenciales';

  @override
  String get onboarding_page_permissions_info =>
      'Mindful requiere los siguientes permisos esenciales para monitorizar y gestionar tu tiempo de pantalla, ayudando a reducir las distracciones y mejorando el enfoque.';

  @override
  String get dashboard_tab_title => 'Panel de Control';

  @override
  String get focus_now_fab_button => 'Centrarse ahora';

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
  String get welcome_greetings => 'Bienvenido,';

  @override
  String get username_snack_alert =>
      'Mantenga pulsado para editar el nombre de usuario.';

  @override
  String get username_dialog_title => 'Nombre de Usuario';

  @override
  String get username_dialog_info =>
      'Introduzca su nombre de usuario que se mostrará en el panel de control.';

  @override
  String get username_dialog_button_apply => 'Aplicar';

  @override
  String get restrictions_heading => 'Restricciones';

  @override
  String get apps_blocking_tile_title => 'Bloqueo de apps';

  @override
  String get apps_blocking_tile_subtitle =>
      'Limita las aplicaciones de muchas maneras.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Limitar sitios para adultos y personalizados.';

  @override
  String get screen_time_label => 'Tiempo de pantalla';

  @override
  String get statistics_tab_title => 'Estadísticas';

  @override
  String get screen_segment_label => 'Pantalla';

  @override
  String get data_segment_label => 'Datos';

  @override
  String get mobile_label => 'Datos';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'Aplicaciones más usadas';

  @override
  String get show_all_apps_tile_title => 'Mostrar todas las aplicaciones';

  @override
  String get search_apps_hint => 'Buscar aplicaciones...';

  @override
  String get notifications_tab_title => 'Notificaciones';

  @override
  String get notifications_tab_info =>
      'Agrupa notificaciones de aplicaciones y establece horarios como por la mañana, mediodía, tarde y noche. Mantente actualizado sin interrupciones constantes.';

  @override
  String get batched_apps_tile_title => 'Aplicaciones Agrupadas';

  @override
  String get batch_recap_dropdown_title =>
      'Tipo de resumen de las agrupaciones';

  @override
  String get batch_recap_dropdown_info =>
      'Elige qué quieres que se muestre cuando se active un horario — todas las notificaciones o solo un resumen.';

  @override
  String get batch_recap_option_summery_only => 'Solo un resumen';

  @override
  String get batch_recap_option_all_notifications => 'Todas las notificaciones';

  @override
  String get notification_history_tile_title => 'Historial de notificaciones';

  @override
  String get store_all_tile_title => 'Almacenar todas las notificaciones';

  @override
  String get store_all_tile_subtitle =>
      'Guardar también las notificaciones no agrupadas.';

  @override
  String get schedules_heading => 'Sesiones';

  @override
  String get new_schedule_fab_button => 'Nueva sesión';

  @override
  String get new_schedule_dialog_info =>
      'Introduce un nombre para el horario de notificaciones que te ayude a identificarlo fácilmente.';

  @override
  String get new_schedule_dialog_field_label => 'Nombre de la programación';

  @override
  String get shorts_blocking_tab_title => 'Bloqueo de vídeos cortos';

  @override
  String get shorts_blocking_tab_info =>
      'Controla cuánto tiempo pasas en contenido de vídeo corto en plataformas como Instagram, YouTube, Snapchat y Facebook, incluyendo sus sitios web.';

  @override
  String get short_content_heading => 'Contenido Corto';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Faltan $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Establece un límite de tiempo diario para el contenido corto. Una vez alcanzado tu límite, el contenido corto se pausará hasta la medianoche.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Restringir funciones en Instagram.';

  @override
  String get instagram_features_block_reels => 'Restringe la sección de Reels.';

  @override
  String get instagram_features_block_explore =>
      'Restringir sección de Explorar.';

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
      'Restringir funciones en Snapchat.';

  @override
  String get snapchat_features_block_spotlight =>
      'Restringe la sección de Spotlight.';

  @override
  String get snapchat_features_block_discover =>
      'Restringir la sección Descubrir.';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle => 'Restringir Shorts en YouTube.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => 'Restringir Reels en Facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => 'Restringir Shorts en Reddit.';

  @override
  String get websites_blocking_tab_title => 'Bloqueo de webs';

  @override
  String get websites_blocking_tab_info =>
      'Bloquea sitios web para adultos y cualquier sitio personalizado que elijas para crear una experiencia online más segura y enfocada. Toma el control de tu navegación y mantente libre de distracciones.';

  @override
  String get adult_content_heading => 'Contenido para adultos';

  @override
  String get block_nsfw_title => 'Bloquear Nsfw';

  @override
  String get block_nsfw_subtitle =>
      'Restringir a los navegadores de abrir webs para adultos y porno.';

  @override
  String get block_nsfw_dialog_info =>
      '¿Estás seguro? Esta acción es irreversible. Una vez que el bloqueador de sitios para adultos esté ACTIVADO, no podrás DESACTIVARLO mientras esta aplicación esté instalada en tu dispositivo.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Bloquear de todos modos';

  @override
  String get blocked_websites_heading => 'Webs bloqueadas';

  @override
  String get blocked_websites_empty_list_hint =>
      'Haz clic en el botón \"+ Añadir Webs\" para añadir sitios web que te distraen y que deseas bloquear.';

  @override
  String get add_website_fab_button => 'Añadir web';

  @override
  String get add_website_dialog_title => 'Web distractoria';

  @override
  String get add_website_dialog_info =>
      'Introduce la URL de una web que quieras bloquear.';

  @override
  String get add_website_dialog_is_nsfw => '¿Es un sitio NSFW?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Advertencia: Las webs NSFW no se pueden eliminar una vez añadidas.';

  @override
  String get add_website_dialog_button_block => 'Bloquear';

  @override
  String get add_website_already_exist_snack_alert =>
      'La URL ya ha sido añadida a la lista de webs bloqueadas.';

  @override
  String get add_website_invalid_url_snack_alert =>
      '¡URL inválida! No se puede analizar el nombre del host.';

  @override
  String get focus_session_duration_tile_title => 'Duración de la sesión';

  @override
  String get focus_session_duration_dialog_info =>
      'Por favor, selecciona la duración deseada para esta sesión de concentración, determinando cuánto tiempo deseas permanecer concentrado y libre de distracciones.';

  @override
  String get timeline_tab_title => 'Cronología';

  @override
  String get calender_heading => 'Calendario';

  @override
  String get active_session_reflection_dialog_title => 'Reflexión de la sesión';

  @override
  String get active_session_reflection_dialog_info =>
      'Tómate un momento para reflexionar sobre tu progreso. ¿Cuál es tu objetivo para esta sesión? ¿Qué lograste durante esta sesión?';

  @override
  String get active_session_reflection_dialog_tip =>
      'Consejo: Siempre puedes editar esto más tarde en la línea de tiempo de la sesión.';

  @override
  String get notifications_empty_list_hint =>
      'No se han agrupado notificaciones para el día.';

  @override
  String get conversations_label => 'Conversaciones';

  @override
  String get last_24_hours_heading => 'Últimas 24 horas';

  @override
  String get notification_timeline_tab_info =>
      'Navega por tu historial de notificaciones seleccionando una fecha del calendario. Mira qué aplicaciones captaron tu atención y reflexiona sobre tus hábitos digitales.';

  @override
  String get monthly_label => 'Mensual';

  @override
  String get daily_label => 'Diario';

  @override
  String get search_notifications_sheet_info =>
      'Encuentra fácilmente notificaciones pasadas buscando por su título o contenido. Te ayuda a localizar rápidamente alertas importantes.';

  @override
  String get search_notifications_hint => 'Buscar notificaciones...';

  @override
  String get search_notifications_empty_list_hint =>
      'No se han encontrado notificaciones que coincidan con tu búsqueda.';

  @override
  String get app_info_none_warning =>
      'No se pudo encontrar la aplicación para el paquete dado. Volviendo a la pantalla de inicio.';

  @override
  String get emergency_fab_button => 'Emergencia';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Esta acción pausará el bloqueador de aplicaciones durante los próximos 5 minutos. Te quedan $leftPassesCount pases. Después de usar todos los pases, la aplicación permanecerá bloqueada hasta medianoche, o hasta que termine la sesión de concentración activa.';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Usar de todos modos';

  @override
  String get emergency_started_snack_alert =>
      'El bloqueador de aplicaciones está pausado y se reanudará el bloqueo en 5 minutos.';

  @override
  String get emergency_already_active_snack_alert =>
      'El bloqueador de aplicaciones está actualmente pausado o inactivo. Si las notificaciones están habilitadas, recibirás actualizaciones sobre el tiempo restante.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Has usado todos tus pases de emergencia. Las aplicaciones bloqueadas permanecerán bloqueadas hasta medianoche, o hasta que termine la sesión de concentración activa.';

  @override
  String get app_limit_status_not_set => 'No establecido';

  @override
  String get app_timer_tile_title => 'Temporizador';

  @override
  String get app_timer_picker_dialog_info =>
      'Establece un límite de tiempo diario para esta aplicación. Una vez que se alcance tu límite, la aplicación se pausará hasta medianoche.';

  @override
  String get usage_reminders_tile_title => 'Recordatorios de uso';

  @override
  String get usage_reminders_tile_subtitle =>
      'Recordatorios suaves al usar aplicaciones con temporizador.';

  @override
  String get app_launch_limit_tile_title => 'Límite de lanzamiento';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Lanzado $count veces hoy.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Establece cuántas veces puedes abrir esta aplicación cada día. Una vez que se alcance el límite, se pausará hasta medianoche.';

  @override
  String get app_active_period_tile_title => 'Período activo';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'Desde las $startTime hasta las $endTime';
  }

  @override
  String get internet_access_tile_title => 'Acceso a Internet';

  @override
  String get internet_access_tile_subtitle =>
      'Desactívalo para bloquear el internet de la aplicación.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'El internet de $appName está bloqueado.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'El internet de $appName está desbloqueado.';
  }

  @override
  String get launch_app_tile_title => 'Abrir aplicación';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Abrir $appName.';
  }

  @override
  String get go_to_app_settings_tile_title => 'Ir a la configuración de la app';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Gestiona la configuración de la aplicación como notificaciones, permisos, almacenamiento y más.';

  @override
  String get include_in_stats_tile_title => 'Incluir en el uso de pantalla.';

  @override
  String get include_in_stats_tile_subtitle =>
      'Desactívalo para excluir esta aplicación del uso total de pantalla.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName está excluido del uso total de la pantalla.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName está incluido en el uso total de la pantalla.';
  }

  @override
  String get general_tab_title => 'General';

  @override
  String get appearance_heading => 'Apariencia';

  @override
  String get theme_mode_tile_title => 'Tema';

  @override
  String get theme_mode_system_label => 'Sistema';

  @override
  String get theme_mode_light_label => 'Claro';

  @override
  String get theme_mode_dark_label => 'Oscuro';

  @override
  String get material_color_tile_title => 'Colores de Material Design';

  @override
  String get amoled_dark_tile_title => 'AMOLED Oscuro';

  @override
  String get amoled_dark_tile_subtitle =>
      'Usa el negro puro para el tema oscuro.';

  @override
  String get dynamic_colors_tile_title => 'Colores dinámicos';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Usar colores del dispositivo si es compatible.';

  @override
  String get defaults_heading => 'Ajustes predeterminados';

  @override
  String get app_language_tile_title => 'Idioma de la aplicación';

  @override
  String get default_home_tab_tile_title => 'Pestaña de inicio';

  @override
  String get usage_history_tile_title => 'Historial de uso';

  @override
  String get usage_history_15_days => '15 días';

  @override
  String get usage_history_1_month => '1 mes';

  @override
  String get usage_history_3_month => '3 meses';

  @override
  String get usage_history_6_month => '6 meses';

  @override
  String get usage_history_1_year => '1 año';

  @override
  String get service_heading => 'Servicio';

  @override
  String get service_stopping_warning =>
      'Si Mindful deja de funcionar inesperadamente, por favor, concede el permiso \"Ignorar Optimización de Batería\" para mantenerlo funcionando en segundo plano. Si el problema persiste, intenta añadir Mindful a la lista blanca para un rendimiento ininterrumpido.';

  @override
  String get whitelist_app_tile_title => 'Añadir Mindful a la lista blanca';

  @override
  String get whitelist_app_tile_subtitle =>
      'Permitir que Mindful inicie automáticamente.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Este dispositivo no es compatible con la gestión automática de inicio.';

  @override
  String get database_tab_title => 'Base de datos';

  @override
  String get import_db_tile_title => 'Importar base de datos';

  @override
  String get import_db_tile_subtitle =>
      'Importar la base de datos desde un archivo.';

  @override
  String get export_db_tile_title => 'Exportar base de datos';

  @override
  String get export_db_tile_subtitle =>
      'Exportar la base de datos a un archivo.';

  @override
  String get crash_logs_heading => 'Registro de errores';

  @override
  String get crash_logs_info =>
      'Si encuentras algún problema, puedes reportarlo en GitHub junto con el archivo de registro. El archivo incluirá detalles como el fabricante de tu dispositivo, el modelo, la versión de Android, la versión del SDK y los registros de fallos. Esta información nos ayudará a identificar y resolver el problema de forma más eficaz.';

  @override
  String get crash_logs_export_tile_title => 'Exportar registro de errores';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Exportar registros de errores a un archivo json.';

  @override
  String get crash_logs_view_tile_title => 'Ver registros';

  @override
  String get crash_logs_view_tile_subtitle =>
      'Explora los registros de fallos almacenados.';

  @override
  String get crash_logs_empty_list_hint =>
      'No se ha registrado ningún fallo hasta ahora.';

  @override
  String get crash_logs_clear_tile_title => 'Borrar registros';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Eliminar todos los registros de fallos de la base de datos.';

  @override
  String get crash_logs_clear_dialog_info =>
      '¿Estás seguro de que deseas eliminar todos los registros de fallos de la base de datos?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway =>
      'Borrar de todos modos';

  @override
  String get about_tab_title => 'Acerca de';

  @override
  String get changelog_tile_title => 'Historial de cambios';

  @override
  String get changelog_tile_subtitle => 'Descubre las últimas novedades.';

  @override
  String get full_changelog_tile_title => 'Registro de cambios completo';

  @override
  String get redirected_to_github_subtitle => 'Serás redirigido a GitHub.';

  @override
  String get contribute_heading => 'Aportar';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Ver el código fuente.';

  @override
  String get report_issue_tile_title => 'Informar de un problema';

  @override
  String get suggest_idea_tile_title => 'Sugerir una idea';

  @override
  String get write_email_tile_title => 'Escríbenos por email';

  @override
  String get write_email_tile_subtitle =>
      'Serás redirigido a la aplicación del correo.';

  @override
  String get privacy_policy_heading => 'Política de Privacidad';

  @override
  String get privacy_policy_info =>
      'Mindful se compromete a proteger tu privacidad. No recopilamos, almacenamos ni transferimos ningún tipo de datos de usuario. La aplicación funciona completamente sin conexión y no requiere conexión a internet, lo que garantiza que tu información personal permanezca privada y segura en tu dispositivo. Como aplicación de Software Libre y de Código Abierto (FOSS), Mindful garantiza total transparencia y control del usuario sobre sus datos.';

  @override
  String get more_details_button => 'Más información';
}
