// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get mindful_tagline => 'Concentre-se no que realmente importa';

  @override
  String get permission_status_off => 'Desligado';

  @override
  String get permission_status_allowed => 'Permitido';

  @override
  String get permission_status_not_allowed => 'Não permitido';

  @override
  String get permission_button_grant_permission => 'Conceder Permissão';

  @override
  String get permission_button_agree_and_continue => 'Concordar e continuar';

  @override
  String get permission_button_not_now => 'Agora não';

  @override
  String get permission_button_help => 'Ajuda?';

  @override
  String get permission_sheet_privacy_info =>
      'O Mindful é 100% seguro e funciona offline. Não recolhemos nem armazenamos quaisquer dados pessoais.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. Clique no botão $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Selecione Mindful na próxima tela.';

  @override
  String get permission_grant_step_three => '3. Clique e ative a opção abaixo.';

  @override
  String get permission_notification_title => 'Enviar notificações';

  @override
  String get permission_alarms_title => 'Alarmes e Lembretes';

  @override
  String get permission_alarms_info =>
      'Por favor, conceda permissão para definir alarmes e lembretes. Isso permitirá que o Mindful inicie sua programação de hora de dormir a tempo e redefina os cronômetros do aplicativo diariamente à meia-noite e ajude você a ficar no caminho certo.';

  @override
  String get permission_alarms_device_tile_label =>
      'Autorizar a definição de alarmes e lembretes';

  @override
  String get permission_usage_title => 'Acesso ao uso';

  @override
  String get permission_usage_info =>
      'Por favor, conceda permissão de acesso ao uso. Isso permitirá que a Mindful monitore o uso de aplicativos e gerencie o acesso a determinados aplicativos, garantindo um ambiente digital mais focado e controlado.';

  @override
  String get permission_usage_device_tile_label => 'Permitir acesso ao uso';

  @override
  String get permission_overlay_title => 'Sobreposição de tela';

  @override
  String get permission_overlay_info =>
      'Por favor, conceda permissão de sobreposição de tela. Isso permitirá que o Mindful mostre uma sobreposição quando um aplicativo pausado é aberto, ajudando você a manter o foco e manter sua agenda.';

  @override
  String get permission_overlay_device_tile_label =>
      'Permitir a exibição em outros aplicativos';

  @override
  String get permission_accessibility_title => 'Acessibilidade';

  @override
  String get permission_accessibility_info =>
      'Por favor, conceda permissão de acessibilidade. Isso permitirá que o Mindful restrinja o acesso ao conteúdo de vídeo curto (por exemplo, Reels, Shorts) dentro dos aplicativos e navegadores de mídia social e filtre sites inadequados.';

  @override
  String get permission_accessibility_required =>
      'Mindful requer permissão de acessibilidade para bloquear conteúdo curto e websites de forma eficaz.';

  @override
  String get permission_accessibility_device_tile_label => 'Usar Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Ignorar a otimização de bateria';

  @override
  String get permission_battery_optimization_status_enabled => 'Já irrestrito';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Desativar restrição em segundo plano';

  @override
  String get permission_battery_optimization_allow_info =>
      'Permitir \'Ignorar otimização da bateria\' automaticamente concede a permissão de \'Alarmes & Lembretes\' em alguns dispositivos.';

  @override
  String get permission_vpn_title => 'Criar uma VPN';

  @override
  String get permission_vpn_info =>
      'Por favor, conceda permissão para criar uma conexão de rede privada virtual (VPN). Isso permitirá que o Mindful restrinja o acesso à internet para aplicativos designados, criando uma VPN local no dispositivo.';

  @override
  String get permission_notification_access_title => 'Acesso às Notificações';

  @override
  String get permission_notification_access_info =>
      'Conceda permissão de acesso à notificação. Isso permitirá que Mindful  organize suas notificações e leva-las em sua agenda.';

  @override
  String get permission_notification_access_required =>
      'Mindful requer acesso a notificações para agrupar e agendar notificações.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Permite acesso à notificação';

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
  String get time_separator_and => 'e';

  @override
  String get timer_status_paused => 'Pausado';

  @override
  String get create_button => 'Criar';

  @override
  String get update_button => 'Atualizar';

  @override
  String get dialog_button_cancel => 'Cancelar';

  @override
  String get dialog_button_remove => 'Remover';

  @override
  String get dialog_button_set => 'Definir';

  @override
  String get dialog_button_reset => 'Redefinir';

  @override
  String get dialog_button_infinite => 'Infinito';

  @override
  String get schedule_start_label => 'Começar';

  @override
  String get schedule_end_label => 'Término';

  @override
  String get quick_actions_heading => 'Ações rápidas';

  @override
  String get select_distracting_apps_heading =>
      'Selecione os aplicativos que te distraem';

  @override
  String get your_distracting_apps_heading => 'Seus aplicativos de distração';

  @override
  String get select_more_apps_heading => 'Selecionar mais apps';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Adicionar aplicativos do sistema importantes à lista de aplicativos que distraem não é permitido.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'O uso e restrições da tela estão indisponíveis para este aplicativo. Atualmente, apenas o uso da rede está acessível';

  @override
  String get active_period_info =>
      'Defina um período durante o qual o acesso será permitido. Fora deste intervalo, o acesso será restrito.';

  @override
  String get donation_card_title => 'Nos apoie';

  @override
  String get donation_card_info =>
      'Mindful é de graça e de código aberto, desenvolvido com meses de dedicação. Se isso ajudou você, sua doação significaria o mundo para nós. Toda contribuição nos ajudam continuar melhorando e revisando isso para todos.';

  @override
  String get operation_failed_snack_alert =>
      'Falha na operação, algo deu errado!';

  @override
  String get donation_card_button_donate => 'Doar';

  @override
  String get app_restart_dialog_title => 'Precisa reiniciar';

  @override
  String get app_restart_dialog_info =>
      'Mindful será reiniciado automaticamente quando a contagem regressiva terminar. Por favor, seja paciente como as mudanças são aplicadas.';

  @override
  String get onboarding_skip_btn_label => 'Pular';

  @override
  String get onboarding_finish_setup_btn_label => 'Finalizar Configuração';

  @override
  String get onboarding_page_one_title => 'Domine o foco.';

  @override
  String get onboarding_page_one_info =>
      'Pause apps que distraem, bloqueie conteúdo curto e mantenha-se no caminho certo com sessões de foco personalizáveis. Se você está trabalhando, estudando ou relaxando, Mindful ajuda você a ficar no controle.';

  @override
  String get onboarding_page_two_title => 'Bloquear Distrações.';

  @override
  String get onboarding_page_two_info =>
      'Defina limites de uso, pause automaticamente os aplicativos e crie hábitos digitais mais saudáveis. Use o modo Hora de dormir para relaxar e desfrutar de uma noite livre de distrações.';

  @override
  String get onboarding_page_three_title => 'Privacidade em primeiro lugar.';

  @override
  String get onboarding_page_three_info =>
      'A Mindful é 100% open-source e opera totalmente offline. Não recolhemos nem partilhamos os seus dados pessoais — a sua privacidade está garantida de todas as formas.';

  @override
  String get onboarding_page_permissions_title => 'Permissões Essenciais.';

  @override
  String get onboarding_page_permissions_info =>
      'O Mindful requer as seguintes permissões essenciais para rastrear e gerenciar seu tempo de tela, ajudando a reduzir distrações e melhorar o foco.';

  @override
  String get dashboard_tab_title => 'Painel de controle';

  @override
  String get focus_now_fab_button => 'Focar agora';

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
  String get welcome_greetings => 'Bem-vindo(a) de volta,';

  @override
  String get username_snack_alert => 'Pressione para editar o nome de usuário.';

  @override
  String get username_dialog_title => 'Nome de usuário';

  @override
  String get username_dialog_info =>
      'Digite seu nome de usuário que será exibido no painel.';

  @override
  String get username_dialog_button_apply => 'Aplicar';

  @override
  String get restrictions_heading => 'Restrições';

  @override
  String get apps_blocking_tile_title => 'Bloqueio de aplicativos';

  @override
  String get apps_blocking_tile_subtitle =>
      'Limite os aplicativos de múltiplas maneiras.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Limite sites adultos e personalizados.';

  @override
  String get screen_time_label => 'Tempo de tela';

  @override
  String get statistics_tab_title => 'Estatísticas';

  @override
  String get screen_segment_label => 'Tela';

  @override
  String get data_segment_label => 'Dados';

  @override
  String get mobile_label => 'Móvel';

  @override
  String get wifi_label => 'Wi-Fi';

  @override
  String get most_used_apps_heading => 'Aplicativos mais usados';

  @override
  String get show_all_apps_tile_title => 'Mostrar todos os aplicativos';

  @override
  String get search_apps_hint => 'Procurar aplicativos...';

  @override
  String get notifications_tab_title => 'Notificações';

  @override
  String get notifications_tab_info =>
      'Agrupe notificações de aplicativos e defina horários como manhã, meio-dia e noite. Fique atualizado sem interrupções constantes.';

  @override
  String get batched_apps_tile_title => 'Aplicativos em grupo';

  @override
  String get batch_recap_dropdown_title => 'Tipo de resumo agrupado';

  @override
  String get batch_recap_dropdown_info =>
      'Escolha o que enviar quando um agendamento disparar — todas as notificações ou apenas um resumo.';

  @override
  String get batch_recap_option_summery_only => 'Apenas resumo';

  @override
  String get batch_recap_option_all_notifications => 'Todas as notificações';

  @override
  String get notification_history_tile_title => 'Histórico de notificações';

  @override
  String get store_all_tile_title => 'Armazenar todas as notificações';

  @override
  String get store_all_tile_subtitle =>
      'Salvar também notificações não agrupadas.';

  @override
  String get schedules_heading => 'Agendamentos';

  @override
  String get new_schedule_fab_button => 'Novo agendamento';

  @override
  String get new_schedule_dialog_info =>
      'Digite um nome para o agendamento de notificações para ajudá-lo a identificá-lo facilmente.';

  @override
  String get new_schedule_dialog_field_label => 'Nome do agendamento';

  @override
  String get shorts_blocking_tab_title => 'Bloqueio de vídeos curtos';

  @override
  String get shorts_blocking_tab_info =>
      'Controle quanto tempo você gasta em conteúdo curto em plataformas como Instagram, YouTube, Snapchat e Facebook, incluindo seus sites.';

  @override
  String get short_content_heading => 'Conteúdo curto';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Restantes de $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Defina um tempo diário para conteúdo curto. Quando seu limite for atingido, o conteúdo curto será pausado até a meia-noite.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Restringir recursos no Instagram.';

  @override
  String get instagram_features_block_reels => 'Restringir a seção de reels.';

  @override
  String get instagram_features_block_explore => 'Restringir a seção explorar.';

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
      'Restringir recursos no Snapchat.';

  @override
  String get snapchat_features_block_spotlight =>
      'Restringir a seção spotlight.';

  @override
  String get snapchat_features_block_discover =>
      'Restringir a seção de descobrir.';

  @override
  String get youtube_features_tile_title => 'YouTube';

  @override
  String get youtube_features_tile_subtitle => 'Restringir shorts no YouTube.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle => 'Restringir reels no Facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => 'Restringir shorts no Reddit.';

  @override
  String get websites_blocking_tab_title => 'Bloqueio de websites';

  @override
  String get websites_blocking_tab_info =>
      'Bloqueie websites adultos e qualquer site personalizado que escolher para criar uma experiência on-line mais segura e mais focada. Assuma o controle da sua navegação e mantenha-se livre de distrações.';

  @override
  String get adult_content_heading => 'Conteúdo adulto';

  @override
  String get block_nsfw_title => 'Bloquear Nsfw';

  @override
  String get block_nsfw_subtitle =>
      'Restringir que navegadores abram sites adultos e pornográficos.';

  @override
  String get block_nsfw_dialog_info =>
      'Tem certeza? Esta ação é irreversível. Uma vez que o bloqueador de sites para adultos está ligado, você não pode desligá-lo enquanto este aplicativo estiver instalado no seu dispositivo.';

  @override
  String get block_nsfw_dialog_button_block_anyway => 'Bloquear mesmo assim';

  @override
  String get blocked_websites_heading => 'Sites bloqueados';

  @override
  String get blocked_websites_empty_list_hint =>
      'Clique no botão \'+ Adicionar Site\' para adicionar sites que você deseja bloquear.';

  @override
  String get add_website_fab_button => 'Adicionar site';

  @override
  String get add_website_dialog_title => 'Site distrativo';

  @override
  String get add_website_dialog_info =>
      'Digite o URL de um site que você deseja bloquear.';

  @override
  String get add_website_dialog_is_nsfw => 'É um website com conteúdo adulto?';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Aviso: Websites com conteúdo adulto não podem ser removidos uma vez adicionados.';

  @override
  String get add_website_dialog_button_block => 'Bloquear';

  @override
  String get add_website_already_exist_snack_alert =>
      'O URL já foi adicionado à lista de sites bloqueados.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'URL inválido! Não foi possível analisar o nome do host.';

  @override
  String get focus_session_duration_tile_title => 'Duração de sessão';

  @override
  String get focus_session_duration_dialog_info =>
      'Por favor, selecione a duração desejada para esta sessão de foco, determinando quanto tempo você deseja permanecer focado e livre de distrações.';

  @override
  String get timeline_tab_title => 'Linha do Tempo';

  @override
  String get calender_heading => 'Calendário';

  @override
  String get active_session_reflection_dialog_title => 'Reflexo de sessão';

  @override
  String get active_session_reflection_dialog_info =>
      'Dedique um momento para refletir sobre seu progresso. Qual é o seu objetivo para esta sessão? O que você cumpriu durante esta sessão?';

  @override
  String get active_session_reflection_dialog_tip =>
      'Dica: Você sempre pode editar isso mais tarde na linha do tempo da sessão.';

  @override
  String get notifications_empty_list_hint =>
      'Nenhuma notificação foi agrupada no dia.';

  @override
  String get conversations_label => 'Conversas';

  @override
  String get last_24_hours_heading => 'Últimas 24 horas';

  @override
  String get notification_timeline_tab_info =>
      'Navegue pelo seu histórico de notificações selecionando uma data do calendário. Veja quais aplicativos pegaram sua atenção e reflita sobre seus hábitos digitais.';

  @override
  String get monthly_label => 'Mensalmente';

  @override
  String get daily_label => 'Diariamente';

  @override
  String get search_notifications_sheet_info =>
      'Encontre notificações anteriores facilmente procurando pelo título ou conteúdo delas. Isso ajuda você a localizar rapidamente alertas importantes.';

  @override
  String get search_notifications_hint => 'Pesquisar notificações...';

  @override
  String get search_notifications_empty_list_hint =>
      'Nenhuma notificação encontrada que corresponde à sua pesquisa.';

  @override
  String get app_info_none_warning =>
      'Não foi possível encontrar o aplicativo para o pacote informado. Retornando à tela inicial.';

  @override
  String get emergency_fab_button => 'Emergência';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Esta ação irá pausar o bloqueador de aplicativos pelos próximos 5 minutos. Você tem $leftPassesCount passes restantes. Após usar todos os passes, o aplicativo permanecerá bloqueado até a meia-noite ou a sessão de foco ativo terminará.\n\nVocê ainda deseja prosseguir?';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Usar mesmo assim';

  @override
  String get emergency_started_snack_alert =>
      'O bloqueador de apps está em pausa e continuará bloqueando por 5 minutos.';

  @override
  String get emergency_already_active_snack_alert =>
      'O bloqueador de aplicativos está pausado ou inativo. Se as notificações estiverem ativadas, você receberá atualizações sobre o tempo restante.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Você usou todos os seus passes de emergência. Os aplicativos bloqueados permanecerão bloqueados até a meia-noite ou até a sessão de foco ativo terminar.';

  @override
  String get app_limit_status_not_set => 'Não definido';

  @override
  String get app_timer_tile_title => 'Cronômetro do app';

  @override
  String get app_timer_picker_dialog_info =>
      'Defina um limite diário de tempo para este aplicativo. Quando seu limite for atingido, o aplicativo será pausado até a meia-noite.';

  @override
  String get usage_reminders_tile_title => 'Lembretes de uso';

  @override
  String get usage_reminders_tile_subtitle =>
      'Alertas suaves ao usar aplicativos com tempo limitado.';

  @override
  String get app_launch_limit_tile_title => 'Limite de inicialização';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Lançou $count vezes hoje.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Defina quantas vezes você pode abrir este aplicativo por dia. Quando o limite for atingido, ele será pausado até a meia-noite.';

  @override
  String get app_active_period_tile_title => 'Período ativo';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'De $startTime para $endTime';
  }

  @override
  String get internet_access_tile_title => 'Acesso à internet';

  @override
  String get internet_access_tile_subtitle =>
      'Desative para bloquear a internet do app.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'A rede do $appName está bloqueada.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'A rede do $appName está desbloqueada.';
  }

  @override
  String get launch_app_tile_title => 'Iniciar aplicativo';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Abrir $appName.';
  }

  @override
  String get go_to_app_settings_tile_title =>
      'Vá para Configurações de aplicativo';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Gerencie as configurações do aplicativo como notificações, permissões, armazenamento e mais.';

  @override
  String get include_in_stats_tile_title => 'Incluir no uso de tela';

  @override
  String get include_in_stats_tile_subtitle =>
      'Desative para excluir este aplicativo do uso total de tela.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return '$appName foi excluído do total de uso da tela.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return '$appName está incluído no total de uso de tela.';
  }

  @override
  String get general_tab_title => 'Geral';

  @override
  String get appearance_heading => 'Aparência';

  @override
  String get theme_mode_tile_title => 'Modo do tema';

  @override
  String get theme_mode_system_label => 'Sistemas';

  @override
  String get theme_mode_light_label => 'Claro';

  @override
  String get theme_mode_dark_label => 'Escuro';

  @override
  String get material_color_tile_title => 'Cores materiais';

  @override
  String get amoled_dark_tile_title => 'Escuro (AMOLED)';

  @override
  String get amoled_dark_tile_subtitle =>
      'Use cor preta pura para o tema escuro.';

  @override
  String get dynamic_colors_tile_title => 'Cores dinâmicas';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Use as cores do dispositivo, se suportado.';

  @override
  String get defaults_heading => 'Padrões';

  @override
  String get app_language_tile_title => 'Idioma do aplicativo';

  @override
  String get default_home_tab_tile_title => 'Aba inicial';

  @override
  String get usage_history_tile_title => 'Histórico de uso';

  @override
  String get usage_history_15_days => '15 dias';

  @override
  String get usage_history_1_month => '1 mês';

  @override
  String get usage_history_3_month => '3 meses';

  @override
  String get usage_history_6_month => '6 Meses';

  @override
  String get usage_history_1_year => '1 ano';

  @override
  String get service_heading => 'Serviço';

  @override
  String get service_stopping_warning =>
      'Se o Mindful parar de funcionar inesperadamente, por favor, conceda a permissão \'Ignorar Otimização de bateria\' para mantê-lo em execução em segundo plano. Se o problema continuar, tente incluir o Mindful na lista de permissões para um desempenho ininterrupto.';

  @override
  String get whitelist_app_tile_title =>
      'Colocar Mindful na lista de permissões';

  @override
  String get whitelist_app_tile_subtitle =>
      'Permitir que o Mindful inicie automaticamente.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Este dispositivo não suporta gerenciamento automático de inicialização.';

  @override
  String get database_tab_title => 'Banco de dados';

  @override
  String get import_db_tile_title => 'Importar o banco de dados';

  @override
  String get import_db_tile_subtitle =>
      'Importar o banco de dados de um arquivo.';

  @override
  String get export_db_tile_title => 'Exportar banco de dados';

  @override
  String get export_db_tile_subtitle =>
      'Exportar o banco de dados de um arquivo.';

  @override
  String get crash_logs_heading => 'Relatório de erros';

  @override
  String get crash_logs_info =>
      'Se você encontrar algum problema, pode reportá-lo no GitHub com o arquivo de log. O arquivo incluirá detalhes como o fabricante, modelo, versão do Android, versão do SDK e registros de falha. Estas informações nos ajuda a identificar e a resolver o problema de forma eficaz.';

  @override
  String get crash_logs_export_tile_title => 'Exportar registros de erro';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Exportar registro de falhas para um arquivo json.';

  @override
  String get crash_logs_view_tile_title => 'Ver registros';

  @override
  String get crash_logs_view_tile_subtitle =>
      'Explore os registros de falhas armazenados.';

  @override
  String get crash_logs_empty_list_hint =>
      'Nenhuma falha registrada até agora.';

  @override
  String get crash_logs_clear_tile_title => 'Limpar registros';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Apagar todos os registros de erro do banco de dados.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Tem certeza de que deseja limpar todos os registros de erro do banco de dados?';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway =>
      'Limpar mesmo assim';

  @override
  String get about_tab_title => 'Sobre';

  @override
  String get changelog_tile_title => 'Histórico de mudanças';

  @override
  String get changelog_tile_subtitle => 'Descubra o que há de novo.';

  @override
  String get full_changelog_tile_title => 'Histórico completo de alterações';

  @override
  String get redirected_to_github_subtitle =>
      'Você vai ser redirecionado para o GitHub.';

  @override
  String get contribute_heading => 'Contribuir';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Veja o código-fonte.';

  @override
  String get report_issue_tile_title => 'Reportar um problema';

  @override
  String get suggest_idea_tile_title => 'Sugerir uma ideia';

  @override
  String get write_email_tile_title => 'Escreva-nos via e-mail';

  @override
  String get write_email_tile_subtitle =>
      'Você será redirecionado para o aplicativo de E-mail.';

  @override
  String get privacy_policy_heading => 'Política de privacidade';

  @override
  String get privacy_policy_info =>
      'A Mindful está empenhado em proteger a sua privacidade. Não recolhemos, armazenamos ou transferimos qualquer tipo de dados do usuário. O aplicativo funciona totalmente offline e não requer uma conexão com a Internet, garantindo que suas informações pessoais permaneçam privadas e seguras em seu dispositivo. Como um aplicativo de software livre e de código aberto (FOSS), o Mindful garante total transparência e controle do usuário sobre seus dados.';

  @override
  String get more_details_button => 'Mais detalhes';
}
