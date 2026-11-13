// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get mindful_tagline =>
      'Επικεντρωθείτε σε ό,τι έχει πραγματικά σημασία';

  @override
  String get permission_status_off => 'Απενεργοποιημένο';

  @override
  String get permission_status_allowed => 'Επιτρέπεται';

  @override
  String get permission_status_not_allowed => 'Δεν επιτρέπεται';

  @override
  String get permission_button_grant_permission => 'Εκχώρηση Άδειας';

  @override
  String get permission_button_agree_and_continue => 'Αποδοχή & Συνέχεια';

  @override
  String get permission_button_not_now => 'Αργότερα';

  @override
  String get permission_button_help => 'Βοήθεια;';

  @override
  String get permission_sheet_privacy_info =>
      'Το Mindful είναι 100% ασφαλές και λειτουργεί εκτός σύνδεσης. Δεν συλλέγουμε ή αποθηκεύουμε προσωπικά δεδομένα.';

  @override
  String get missing_permissions_card_title => 'Permissions needed';

  @override
  String get missing_permissions_card_info =>
      'Some required permissions are missing. Grant them so Mindful can track and block apps.';

  @override
  String permission_grant_step_one(String button_label) {
    return '1. Πατήστε το κουμπί $button_label.';
  }

  @override
  String get permission_grant_step_two =>
      '2. Επιλέξτε το Mindful στην επόμενη οθόνη.';

  @override
  String get permission_grant_step_three =>
      '3. Πατήστε και ενεργοποιήστε το διακόπτη όπως παρακάτω.';

  @override
  String get permission_notification_title => 'Αποστολή Ειδοποιήσεων';

  @override
  String get permission_alarms_title => 'Ειδοποιήσεις & Υπενθυμίσεις';

  @override
  String get permission_alarms_info =>
      'Παρακαλώ δώσε την άδεια για τον ορισμό ξυπνητηριών και υπενθυμίσεων. Αυτό θα επιτρέψει στο Mindful να ξεκινήσει το πρόγραμμά ύπνου σου στην ώρα του και να επαναφέρει χρονόμετρα εφαρμογών καθημερινά τα μεσάνυχτα και για να σε βοηθήσει να μείνεις στο σωστό δρόμο.';

  @override
  String get permission_alarms_device_tile_label =>
      'Να επιτρέπεται η ρύθμιση ξυπνητηριών και υπενθυμίσεων';

  @override
  String get permission_usage_title => 'Πρόσβαση Χρήσης';

  @override
  String get permission_usage_info =>
      'Παρακαλούμε εκχώρησε άδεια πρόσβασης χρήσης. Αυτό θα επιτρέψει στο Mindful να παρακολουθεί τη χρήση εφαρμογών και να διαχειρίζεται την πρόσβαση σε ορισμένες εφαρμογές, εξασφαλίζοντας ένα πιο συγκεντρωμένο και ελεγχόμενο ψηφιακό περιβάλλον.';

  @override
  String get permission_usage_device_tile_label =>
      'Να επιτρέπεται η πρόσβαση χρήσης';

  @override
  String get permission_overlay_title => 'Επικάλυψη Οθόνης';

  @override
  String get permission_overlay_info =>
      'Παρακαλώ παραχώρησε δικαιώματα επικάλυψης οθόνης. Αυτό θα επιτρέψει στο Mindful να δείχνει μια επικάλυψη όταν μια εφαρμογή σε παύση είναι ανοιχτή, βοηθώντας σε να παραμείνεις σε συγκέντρωση και να διατηρήσεις το πρόγραμμά σου.';

  @override
  String get permission_overlay_device_tile_label =>
      'Επιτρέπεται η εμφάνιση πάνω σ\' άλλες εφαρμογές';

  @override
  String get permission_accessibility_title => 'Προσβασιμότητα';

  @override
  String get permission_accessibility_info =>
      'Παρακαλούμε εκχώρησε την άδεια προσβασιμότητας. Αυτό θα επιτρέψει στο Mindful να περιορίσει την πρόσβαση σε περιεχόμενο βίντεο μικρής μορφής (πχ. Reels, Shorts) μέσα από εφαρμογές κοινωνικής δικτύωσης και προγράμματα περιήγησης και να φιλτράρει ακατάλληλες ιστοσελίδες.';

  @override
  String get permission_accessibility_required =>
      'Το Mindful απαιτεί δικαιώματα προσβασιμότητας για να μπλοκάρει αποτελεσματικά το σύντομο περιεχόμενο και τις ιστοσελίδες.';

  @override
  String get permission_accessibility_device_tile_label => 'Χρήση Mindful';

  @override
  String get permission_battery_optimization_tile_title =>
      'Αγνόηση Βελτιστοποίησης Μπαταρίας';

  @override
  String get permission_battery_optimization_status_enabled =>
      'Ήδη χωρίς περιορισμούς';

  @override
  String get permission_battery_optimization_status_disabled =>
      'Απενεργοποίηση περιορισμού παρασκηνίου';

  @override
  String get permission_battery_optimization_allow_info =>
      'Η επιλογή \'Αγνόηση βελτιστοποίησης μπαταρίας\' θα παραχωρήσει αυτόματα δικαιώματα \'Ξυπνητήρια & Υπενθυμίσεις\' σε ορισμένες συσκευές.';

  @override
  String get permission_vpn_title => 'Δημιουργία VPN';

  @override
  String get permission_vpn_info =>
      'Παρακαλώ παραχώρησε άδεια για τη δημιουργία σύνδεσης εικονικού ιδιωτικού δικτύου (VPN). Αυτό θα επιτρέψει στο Mindful να περιορίσει την πρόσβαση στο διαδίκτυο για καθορισμένες εφαρμογές με τη δημιουργία τοπικών στη συσκευή VPN.';

  @override
  String get permission_notification_access_title => 'Πρόσβαση Ειδοποιήσεων';

  @override
  String get permission_notification_access_info =>
      'Παρακαλούμε χορήγησε άδεια πρόσβασης στις ειδοποιήσεις. Αυτό θα επιτρέψει στο Mindful να οργανώσει τις ειδοποιήσεις σου και να τις παραδίδει βάσει του προγράμματός σου.';

  @override
  String get permission_notification_access_required =>
      'Το Mindful απαιτεί πρόσβαση στις ειδοποιήσεις για να τις οργανώνει και να τις χρονοπρογραμματίζει.';

  @override
  String get permission_notification_access_device_tile_label =>
      'Να επιτρέπεται η πρόσβαση στις ειδοποιήσεις';

  @override
  String nHours(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ώρες',
      one: '1 ώρα',
      zero: '0 ώρα',
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
      other: '$countString λεπτά',
      one: '1 λεπτό',
      zero: '0 λεπτό',
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
      other: '$countString δευτερόλεπτα',
      one: '1 δευτερόλεπτο',
      zero: '0 δευτερόλεπτο',
    );
    return '$_temp0';
  }

  @override
  String get time_separator_and => 'και';

  @override
  String get timer_status_paused => 'Σε Παύση';

  @override
  String get create_button => 'Δημιουργία';

  @override
  String get update_button => 'Ενημέρωση';

  @override
  String get dialog_button_cancel => 'Ακύρωση';

  @override
  String get dialog_button_remove => 'Αφαίρεση';

  @override
  String get dialog_button_set => 'Ορισμός';

  @override
  String get dialog_button_reset => 'Επαναφορά';

  @override
  String get dialog_button_infinite => 'Άπειρο';

  @override
  String get schedule_start_label => 'Έναρξη';

  @override
  String get schedule_end_label => 'Λήξη';

  @override
  String get quick_actions_heading => 'Γρήγορες ενέργειες';

  @override
  String get select_distracting_apps_heading => 'Επιλογή ενοχλητικών εφαρμογών';

  @override
  String get your_distracting_apps_heading => 'Οι εφαρμογές που σε ενοχλούν';

  @override
  String get select_more_apps_heading => 'Επιλογή περισσότερων εφαρμογών';

  @override
  String get imp_distracting_apps_snack_alert =>
      'Δεν επιτρέπεται η προσθήκη σημαντικών εφαρμογών συστήματος στη λίστα των ενοχλητικών εφαρμογών.';

  @override
  String get custom_apps_quick_actions_unavailable_warning =>
      'Η χρήση και οι περιορισμοί οθόνης δεν είναι διαθέσιμοι για αυτήν την εφαρμογή. Προς το παρόν, μόνο η χρήση δικτύου είναι προσβάσιμη';

  @override
  String get active_period_info =>
      'Όρισε μια χρονική περίοδο κατά την οποία θα επιτρέπεται η πρόσβαση. Εκτός αυτού του χρονικού πλαισίου, η πρόσβαση θα περιοριστεί.';

  @override
  String get donation_card_title => 'Υποστήριξέ μας';

  @override
  String get donation_card_info =>
      'Το Mindful είναι ελεύθερο και ανοικτού κώδικα, που αναπτύχθηκε με μήνες αφοσίωσης. Αν σ\' έχει βοηθήσει, η δωρεά σου θα σήμαινε τα πάντα σε εμάς. Κάθε συνεισφορά μάς βοηθά να συνεχίσουμε να την βελτιώνουμε και να την συντηρούμε για όλους.';

  @override
  String get operation_failed_snack_alert =>
      'Η λειτουργία απέτυχε, κάτι πήγε στραβά!';

  @override
  String get donation_card_button_donate => 'Δωρεά';

  @override
  String get app_restart_dialog_title => 'Απαιτείται επανεκκίνηση';

  @override
  String get app_restart_dialog_info =>
      'Το Mindful θα επανεκκινήσει αυτόματα μόλις ολοκληρωθεί η αντίστροφη μέτρηση. Παρακαλώ να κάνεις υπομονή καθώς εφαρμόζονται αλλαγές.';

  @override
  String get onboarding_skip_btn_label => 'Παράλειψη';

  @override
  String get onboarding_finish_setup_btn_label => 'Ολοκλήρωση Ρύθμισης';

  @override
  String get onboarding_page_one_title => 'Κατέκτησε τη Συγκέντρωση.';

  @override
  String get onboarding_page_one_info =>
      'Παύση ενοχλητικών εφαρμογών, φραγή σύντομου περιεχομένου και παραμονή στο σωστό δρόμο με προσαρμόσιμες συνεδρίες εστίασης. Είτε εργάζεσαι, διαβάζεις είτε χαλαρώνεις το Mindful σε βοηθά να έχεις τον έλεγχο.';

  @override
  String get onboarding_page_two_title => 'Αποκλεισμός Περισπασμών.';

  @override
  String get onboarding_page_two_info =>
      'Ορισμός ορίων χρήσης, αυτόματη παύση εφαρμογών και δημιουργία πιο υγιεινών ψηφιακών συνηθειών. Χρησιμοποίησε τη λειτουργία ύπνου για να χαλαρώσεις και να απολαύσεις μια νύχτα χωρίς ενοχλήσεις.';

  @override
  String get onboarding_page_three_title => 'Πρώτα το Απόρρητο.';

  @override
  String get onboarding_page_three_info =>
      'Το Mindful είναι 100% ανοικτού κώδικα και λειτουργεί εξ\' ολοκλήρου εκτός σύνδεσης. Δεν συλλέγουμε ή κοινοποιούμε τα προσωπικά σου δεδομένα - το απόρρητό σου είναι εγγυημένο με κάθε τρόπο.';

  @override
  String get onboarding_page_permissions_title => 'Βασικές Άδειες.';

  @override
  String get onboarding_page_permissions_info =>
      'Το Mindful απαιτεί τα ακόλουθα απαραίτητα δικαιώματα για να παρακολουθεί και να διαχειρίζεται το χρόνο επί οθόνης σου, βοηθώντας στη μείωση των περισπασμών και στη βελτίωση της συγκέντρωσης.';

  @override
  String get dashboard_tab_title => 'Επισκόπηση';

  @override
  String get focus_now_fab_button => 'Εστίαση τώρα';

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
  String get welcome_greetings => 'Καλώς ήρθες και πάλι,';

  @override
  String get username_snack_alert =>
      'Πάτα παρατεταμένα για επεξεργασία ονόματος χρήστη.';

  @override
  String get username_dialog_title => 'Όνομα χρήστη';

  @override
  String get username_dialog_info =>
      'Εισήγαγε το όνομα χρήστη σου το οποίο θα εμφανίζεται στην επισκόπηση.';

  @override
  String get username_dialog_button_apply => 'Εφαρμογή';

  @override
  String get restrictions_heading => 'Περιορισμοί';

  @override
  String get apps_blocking_tile_title => 'Αποκλεισμός εφαρμογών';

  @override
  String get apps_blocking_tile_subtitle =>
      'Περιόρισε τις εφαρμογές με πολλούς τρόπους.';

  @override
  String get websites_blocking_tile_subtitle =>
      'Περιορισμός ενηλίκων και προσαρμοσμένων ιστοσελίδων.';

  @override
  String get screen_time_label => 'Χρόνος οθόνης';

  @override
  String get statistics_tab_title => 'Στατιστικά';

  @override
  String get screen_segment_label => 'Οθόνη';

  @override
  String get data_segment_label => 'Δεδομένα';

  @override
  String get mobile_label => 'Κινητή';

  @override
  String get wifi_label => 'Wifi';

  @override
  String get most_used_apps_heading => 'Πιο χρησιμοποιούμενες εφαρμογές';

  @override
  String get show_all_apps_tile_title => 'Εμφάνιση όλων των εφαρμογών';

  @override
  String get search_apps_hint => 'Search apps...';

  @override
  String get notifications_tab_title => 'Ειδοποιήσεις';

  @override
  String get notifications_tab_info =>
      'Μαζική ειδοποίηση από εφαρμογές και ορίστε προγράμματα όπως πρωί, μεσημέρι, βράδυ και νύχτα. Μείνετε ενημερωμένοι χωρίς συνεχείς διακοπές.';

  @override
  String get batched_apps_tile_title => 'Εφαρμογές σε παρτίδα';

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
  String get schedules_heading => 'Προγράμματα';

  @override
  String get new_schedule_fab_button => 'Νέο Πρόγραμμα';

  @override
  String get new_schedule_dialog_info =>
      'Εισήγαγε ένα όνομα για το πρόγραμα ειδοποιήσεων για να το αναγνωρίζεις εύκολα.';

  @override
  String get new_schedule_dialog_field_label => 'Όνομα προγράμματος';

  @override
  String get shorts_blocking_tab_title => 'Φραγή shorts';

  @override
  String get shorts_blocking_tab_info =>
      'Έλεγξε πόσο χρόνο ξοδεύεις σε σύντομο περιεχόμενο σε πλατφόρμες όπως το Instagram, το YouTube, το Snapchat, και το Facebook, συμπεριλαμβανομένων των ιστοσελίδων τους.';

  @override
  String get short_content_heading => 'Σύντομο περιεχόμενο';

  @override
  String shorts_time_left_from(String timeShortString) {
    return 'Απομένουν από $timeShortString';
  }

  @override
  String get short_content_timer_picker_dialog_info =>
      'Όρισε ένα ημερήσιο χρονικό όριο για το σύντομο περιεχόμενο. Μόλις συμπληρωθεί το όριό σου, το σύντομο περιεχόμενο θα τεθεί σε παύση μέχρι τα μεσάνυχτα.';

  @override
  String get instagram_features_tile_title => 'Instagram';

  @override
  String get instagram_features_tile_subtitle =>
      'Περιορισμός χαρακτηριστικών στο instagram.';

  @override
  String get instagram_features_block_reels => 'Περιορισμός ενότητας reels.';

  @override
  String get instagram_features_block_explore =>
      'Περιορισμός ενότητας εξερεύνησης.';

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
      'Περιορισμός χαρακτηριστικών στο snapchat.';

  @override
  String get snapchat_features_block_spotlight =>
      'Περιορισμός ενότητας spotlight.';

  @override
  String get snapchat_features_block_discover =>
      'Περιορισμός ενότητας ανακάλυψης.';

  @override
  String get youtube_features_tile_title => 'Youtube';

  @override
  String get youtube_features_tile_subtitle =>
      'Περιορισμός των shorts στο youtube.';

  @override
  String get facebook_features_tile_title => 'Facebook';

  @override
  String get facebook_features_tile_subtitle =>
      'Περιορισμός των reels στο facebook.';

  @override
  String get reddit_features_tile_title => 'Reddit';

  @override
  String get reddit_features_tile_subtitle => 'Περιορισμός shorts στο reddit.';

  @override
  String get websites_blocking_tab_title => 'Αποκλεισμός ιστοσελίδων';

  @override
  String get websites_blocking_tab_info =>
      'Αποκλεισμός ιστοτόπων ενηλίκων και τυχόν προσαρμοσμένων ιστοτόπων που επιλέγεις για να δημιουργήσεις μια ασφαλέστερη και πιο εστιασμένη online εμπειρία. Πάρε τον έλεγχο της περιήγησής σου και ξέχνα τους περισπασμούς.';

  @override
  String get adult_content_heading => 'Περιεχόμενο ενηλίκων';

  @override
  String get block_nsfw_title => 'Αποκλεισμός Nsfw';

  @override
  String get block_nsfw_subtitle =>
      'Περιόρισε τους περιηγητές από το άνοιγμα ιστοσελίδων ενηλίκων και πορνό.';

  @override
  String get block_nsfw_dialog_info =>
      'Σίγουρα; Αυτή η ενέργεια είναι μη αναστρέψιμη. Μόλις ο αποκλεισμός ιστότοπων ενηλίκων είναι ενεργοποιημένος, δεν μπορείς να τον απενεργοποιήσεις για όσο διάστημα αυτή η εφαρμογή είναι εγκατεστημένη στη συσκευή σου.';

  @override
  String get block_nsfw_dialog_button_block_anyway =>
      'Αποκλεισμός ούτως ή άλλως';

  @override
  String get blocked_websites_heading => 'Αποκλεισμένες ιστοσελίδες';

  @override
  String get blocked_websites_empty_list_hint =>
      'Κάνε κλικ στο κουμπί «+ Προσθήκη Ιστοτόπου» για να προσθέσεις ενοχλητικές ιστοσελίδες που θες να μπλοκάρεις.';

  @override
  String get add_website_fab_button => 'Προσθήκη Ιστοτόπου';

  @override
  String get add_website_dialog_title => 'Ενοχλητική ιστοσελίδα';

  @override
  String get add_website_dialog_info =>
      'Εισήγαγε το url μιας ιστοσελίδας που θες να αποκλείσεις.';

  @override
  String get add_website_dialog_is_nsfw => 'Είναι nsfw ιστοσελίδα;';

  @override
  String get add_website_dialog_nsfw_warning =>
      'Προειδοποίηση: Οι ιστότοποι Nsfw δεν μπορούν να αφαιρεθούν μόλις προστεθούν.';

  @override
  String get add_website_dialog_button_block => 'Φραγή';

  @override
  String get add_website_already_exist_snack_alert =>
      'Το URL έχει ήδη προστεθεί στη λίστα αποκλεισμένων ιστοσελίδων.';

  @override
  String get add_website_invalid_url_snack_alert =>
      'Μη έγκυρο URL! Αδυναμία ανάλυσης του ονόματος του κεντρικού υπολογιστή.';

  @override
  String get focus_session_duration_tile_title => 'Διάρκεια συνεδρίας';

  @override
  String get focus_session_duration_dialog_info =>
      'Παρακαλώ επέλεξε την επιθυμητή διάρκεια για αυτή τη συνεδρία συγκέντρωσης, προσδιορίζοντας το χρονικό διάστημα που επιθυμείς να παραμείνεις σε συγκέντρωση και χωρίς περισπασμούς.';

  @override
  String get timeline_tab_title => 'Χρονολόγιο';

  @override
  String get calender_heading => 'Ημερολόγιο';

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
  String get last_24_hours_heading => 'Τελευταίες 24 ώρες';

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
      'Δεν ήταν δυνατή η εύρεση της εφαρμογής για το συγκεκριμένο πακέτο. Επιστροφή στην αρχική οθόνη.';

  @override
  String get emergency_fab_button => 'Επείγον';

  @override
  String emergency_dialog_info(num leftPassesCount) {
    return 'Αυτή η ενέργεια θα διακόψει τον αποκλεισμό εφαρμογών για τα επόμενα 5 λεπτά. Έχεις ακόμη $leftPassesCount ευκαιρίες. Αφού τις χρησιμοποιήσεις όλες, η εφαρμογή θα παραμείνει αποκλεισμένη μέχρι τα μεσάνυχτα ή η ενεργή συνεδρία εστίασης θα τελειώσει.\n\nΘες ακόμα να συνεχίσεις;';
  }

  @override
  String get emergency_dialog_button_use_anyway => 'Χρήση ούτως ή άλλως';

  @override
  String get emergency_started_snack_alert =>
      'Ο αποκλεισμός εφαρμογών είναι σε παύση και θα συνεχίσει τον αποκλεισμό σε 5 λεπτά.';

  @override
  String get emergency_already_active_snack_alert =>
      'Ο αποκλεισμός εφαρμογών είναι προς το παρόν είτε σε παύση είτε ανενεργός. Αν οι ειδοποιήσεις είναι ενεργοποιημένες, θα λαμβάνεις ενημερώσεις σχετικά με το χρόνο που απομένει.';

  @override
  String get emergency_no_pass_left_snack_alert =>
      'Έχεις χρησιμοποιήσει όλες τις επείγουσες ευκαιρίες. Οι αποκλεισμένες εφαρμογές θα παραμείνουν αποκλεισμένες μέχρι τα μεσάνυχτα ή η ενεργή συνεδρία εστίασης θα τελειώσει.';

  @override
  String get app_limit_status_not_set => 'Δεν ορίστηκε';

  @override
  String get app_timer_tile_title => 'Χρονόμετρο εφαρμογής';

  @override
  String get app_timer_picker_dialog_info =>
      'Όρισε ένα ημερήσιο χρονικό όριο για αυτήν την εφαρμογή. Μόλις συμπληρωθεί το όριό σου, η εφαρμογή θα τεθεί σε παύση μέχρι τα μεσάνυχτα.';

  @override
  String get usage_reminders_tile_title => 'Usage reminders';

  @override
  String get usage_reminders_tile_subtitle =>
      'Gentle nudges when using timed apps.';

  @override
  String get app_launch_limit_tile_title => 'Όριο εκκίνησης';

  @override
  String app_launch_limit_tile_subtitle(num count) {
    return 'Άνοιξε $count φορές σήμερα.';
  }

  @override
  String get app_launch_limit_picker_dialog_info =>
      'Όρισε πόσες φορές μπορείς να ανοίξεις αυτήν την εφαρμογή κάθε μέρα. Μόλις συμπληρωθεί το όριο, θα τεθεί σε παύση μέχρι τα μεσάνυχτα.';

  @override
  String get app_active_period_tile_title => 'Ενεργός περίοδος';

  @override
  String app_active_period_tile_subtitle(String startTime, String endTime) {
    return 'Από $startTime έως $endTime';
  }

  @override
  String get internet_access_tile_title => 'Πρόσβαση στο διαδίκτυο';

  @override
  String get internet_access_tile_subtitle =>
      'Απενεργοποίησέ το για να αποκλείσεις το διαδίκτυο για την εφαρμογή.';

  @override
  String internet_access_blocked_snack_alert(String appName) {
    return 'Το διαδίκτυο για $appName είναι αποκλεισμένο.';
  }

  @override
  String internet_access_unblocked_snack_alert(String appName) {
    return 'Το διαδίκτυο για $appName δεν είναι αποκλεισμένο.';
  }

  @override
  String get launch_app_tile_title => 'Εκκίνηση εφαρμογής';

  @override
  String launch_app_tile_subtitle(String appName) {
    return 'Άνοιγμα $appName.';
  }

  @override
  String get go_to_app_settings_tile_title =>
      'Μετάβαση στις ρυθμίσεις εφαρμογής';

  @override
  String get go_to_app_settings_tile_subtitle =>
      'Διαχειρίσου τις ρυθμίσεις της εφαρμογής όπως ειδοποιήσεις, δικαιώματα, αποθήκευση και άλλα.';

  @override
  String get include_in_stats_tile_title => 'Συμπερίληψη στη χρήση οθόνης';

  @override
  String get include_in_stats_tile_subtitle =>
      'Απενεργοποίησέ το για να εξαιρέσεις αυτή την εφαρμογή από τη συνολική χρήση της οθόνης.';

  @override
  String app_excluded_from_stats_snack_alert(String appName) {
    return 'Η εφαρμογή $appName εξαιρείται από τη συνολική χρήση οθόνης.';
  }

  @override
  String app_include_to_stats_snack_alert(String appName) {
    return 'Η εφαρμογή $appName περιλαμβάνεται στη συνολική χρήση οθόνης.';
  }

  @override
  String get general_tab_title => 'Γενικά';

  @override
  String get appearance_heading => 'Εμφάνιση';

  @override
  String get theme_mode_tile_title => 'Θέμα';

  @override
  String get theme_mode_system_label => 'Σύστημα';

  @override
  String get theme_mode_light_label => 'Ανοιχτό';

  @override
  String get theme_mode_dark_label => 'Σκούρο';

  @override
  String get material_color_tile_title => 'Material χρώμα';

  @override
  String get amoled_dark_tile_title => 'AMOLED σκούρο';

  @override
  String get amoled_dark_tile_subtitle =>
      'Χρήση καθαρού μαύρου χρώματος για το σκούρο θέμα.';

  @override
  String get dynamic_colors_tile_title => 'Δυναμικά χρώματα';

  @override
  String get dynamic_colors_tile_subtitle =>
      'Χρήση χρωμάτων συσκευής εάν υποστηρίζεται.';

  @override
  String get defaults_heading => 'Προεπιλογές';

  @override
  String get app_language_tile_title => 'Γλώσσα εφαρμογής';

  @override
  String get default_home_tab_tile_title => 'Αρχική καρτέλα';

  @override
  String get usage_history_tile_title => 'Ιστορικό χρήσης';

  @override
  String get usage_history_15_days => '15 ημέρες';

  @override
  String get usage_history_1_month => '1 μήνας';

  @override
  String get usage_history_3_month => '3 μήνες';

  @override
  String get usage_history_6_month => '6 μήνες';

  @override
  String get usage_history_1_year => '1 έτος';

  @override
  String get service_heading => 'Υπηρεσία';

  @override
  String get service_stopping_warning =>
      'Αν το Mindful σταματήσει να λειτουργεί απροσδόκητα, παρακαλώ παραχώρησε την άδεια «Αγνόηση βελτιστοποίησης μπαταρίας» για να το διατηρήσεις σε λειτουργία στο παρασκήνιο. Εάν το θέμα συνεχιστεί, δοκίμασε να βάλεις το Mindful σε λίστα εξαιρέσεων για αδιάλειπτη απόδοση.';

  @override
  String get whitelist_app_tile_title => 'Προσθήκη Mindful σε λίστα εξαιρέσεων';

  @override
  String get whitelist_app_tile_subtitle =>
      'Επέτρεψε στο Mindful να ξεκινάει αυτόματα.';

  @override
  String get whitelist_app_unsupported_snack_alert =>
      'Αυτή η συσκευή δεν υποστηρίζει την αυτόματη διαχείριση εκκίνησης.';

  @override
  String get database_tab_title => 'Βάση δεδομένων';

  @override
  String get import_db_tile_title => 'Εισαγωγή βάσης δεδομένων';

  @override
  String get import_db_tile_subtitle =>
      'Εισαγωγή βάσης δεδομένων από ένα αρχείο.';

  @override
  String get export_db_tile_title => 'Εξαγωγή βάσης δεδομένων';

  @override
  String get export_db_tile_subtitle =>
      'Εξαγωγή βάσης δεδομένων σε ένα αρχείο.';

  @override
  String get crash_logs_heading => 'Καταγραφές σφαλμάτων';

  @override
  String get crash_logs_info =>
      'Αν αντιμετωπίσεις οποιοδήποτε πρόβλημα, μπορείς να το αναφέρεις στο GitHub μαζί με το αρχείο καταγραφής. Το αρχείο θα περιλαμβάνει λεπτομέρειες όπως τον κατασκευαστή της συσκευής σου, το μοντέλο, την έκδοση Android, την έκδοση SDK και τα αρχεία καταγραφής σφαλμάτων. Αυτές οι πληροφορίες θα μας βοηθήσουν να εντοπίσουμε και να επιλύσουμε το πρόβλημα πιο αποτελεσματικά.';

  @override
  String get crash_logs_export_tile_title => 'Εξαγωγή καταγραφών σφαλμάτων';

  @override
  String get crash_logs_export_tile_subtitle =>
      'Εξαγωγή αρχείων καταγραφής σφαλμάτων σε αρχείο json.';

  @override
  String get crash_logs_view_tile_title => 'Προβολή καταγραφών';

  @override
  String get crash_logs_view_tile_subtitle =>
      'Εξερεύνηση αποθηκευμένων καταγραφών σφαλμάτων.';

  @override
  String get crash_logs_empty_list_hint =>
      'Καμία κατάρρευση δεν καταγράφηκε μέχρι τώρα.';

  @override
  String get crash_logs_clear_tile_title => 'Εκκαθάριση καταγραφών';

  @override
  String get crash_logs_clear_tile_subtitle =>
      'Διαγραφή όλων των αρχείων καταγραφής κατάρρευσης από τη βάση δεδομένων.';

  @override
  String get crash_logs_clear_dialog_info =>
      'Σίγουρα θες να καθαρίσεις όλα τα αρχεία καταγραφής κατάρρευσης από τη βάση δεδομένων;';

  @override
  String get crash_logs_clear_dialog_button_clear_anyway =>
      'Εκκαθάριση ούτως ή άλλως';

  @override
  String get about_tab_title => 'Σχετικά';

  @override
  String get changelog_tile_title => 'Αρχείο αλλαγών';

  @override
  String get changelog_tile_subtitle => 'Δες τι άλλαξε.';

  @override
  String get full_changelog_tile_title => 'Πλήρες αρχείο αλλαγών';

  @override
  String get redirected_to_github_subtitle => 'Θα μεταφερθείς στο GitHub.';

  @override
  String get contribute_heading => 'Συνεισφορά';

  @override
  String get github_tile_title => 'GitHub';

  @override
  String get github_tile_subtitle => 'Δες τον πηγαίο κώδικα.';

  @override
  String get report_issue_tile_title => 'Αναφορά ζητήματος';

  @override
  String get suggest_idea_tile_title => 'Πρότεινε μια ιδέα';

  @override
  String get write_email_tile_title => 'Γράψε μας μέσω email';

  @override
  String get write_email_tile_subtitle => 'Θα μεταφερθείς στην εφαρμογή email.';

  @override
  String get privacy_policy_heading => 'Πολιτική απορρήτου';

  @override
  String get privacy_policy_info =>
      'Το Mindful έχει δεσμευτεί για την προστασία του απορρήτου σου. Δεν συλλέγουμε, αποθηκεύουμε ή μεταβιβάζουμε οποιοδήποτε είδος δεδομένων χρήστη. Η εφαρμογή λειτουργεί εξ\' ολοκλήρου εκτός σύνδεσης και δεν απαιτεί σύνδεση στο διαδίκτυο, εξασφαλίζοντας ότι τα προσωπικά σου στοιχεία παραμένουν ιδιωτικά και ασφαλή στη συσκευή σου. Ως εφαρμογή Ελεύθερου και Ανοιχτού Κώδικα (FOSS) το Mindful εγγυάται πλήρη διαφάνεια και έλεγχο των δεδομένων των χρηστών.';

  @override
  String get more_details_button => 'Περισσότερες λεπτομέρειες';
}
