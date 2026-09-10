/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

class HeroTags {
  /// Tag used to identify the beta warning container
  static const betaWarningTag = "mindful.appbar.betaWarning";

  /// Tag used to identify the beta warning container
  static const donationDialogTag = "mindful.appbar.donation";

  /// Tag used to identify the FAB for adding a distracting website.
  static const editUsernameTag = "dashboard.editUsername";

  /// Tag used to identify the invincible mode tile.
  static const invincibleModeTileTag = "parentalControls.invincibleModeTile";

  /// Tag used to identify the tile for selecting invincible window start time.
  static const invincibleWindowTileTag = "parentalControls.invincibleWindow";

  /// Tag used to identify the tile for toggling tamper protection.
  static const tamperProtectionTileTag = "parentalControls.tamperProtection";

  /// Tag used to identify the tile for selecting uninstall window start time.
  static const uninstallWindowTileTag = "parentalControls.uninstallWindow";

  /// Tag used to identify the short content timer picker.
  static const shortContentTimerPickerTag = "shortsBlocking.shortsTimerPicker";

  /// Tag used to identify the block NSFW sites tile in wellbeing tab.
  static const blockNsfwTileTag = "websitesBlocking.blockNsfwTile";

  /// Tag used to identify the FAB for adding a website.
  static const addDistractingSiteFABTag =
      "websitesBlocking.addDistractingWebsite";

  /// Generates a tag for a website tile based on the provided host name.
  static String websiteTileTag(String host) =>
      "websitesBlocking.websiteTile.$host";

  /// Generates a tag for an application tile based on the provided package name.
  static String applicationTileTag(String package) =>
      "statistics.applicationTile.$package";

  /// Tag used to identify the schedule start time picker.
  static const scheduleStartTimePickerTag = "schedule.startTimePicker";

  /// Tag used to identify the schedule end time picker.
  static const scheduleEndTimePickerTag = "schedule.endTimePicker";

  /// Tag used to identify the emergency tile in app dashboard screen.
  static const emergencyTileTag = "appDashboard.useEmergencyTile";

  /// Generates a tag for an app timer tile based on the provided package name.
  static String appTimerTileTag(String package) =>
      "appDashboard.timerTile.$package";

  /// Generates a tag for an app launch limit tile based on the provided package name.
  static String appLaunchLimitTileTag(String package) =>
      "appDashboard.launchLimitTile.$package";

  /// Tag used to identify in focus mode.
  static const focusModeFABTag = "focus.focusModeFab";

  /// Tags used to identify the tiles of an earn-unlock session based on its ID.
  static String focusUnlockNameTag(int ruleId) => "focus.unlock.name.$ruleId";
  static String focusUnlockRequiredTimeTag(int ruleId) =>
      "focus.unlock.requiredTime.$ruleId";
  static String focusUnlockStartTimeTag(int ruleId) =>
      "focus.unlock.startTime.$ruleId";
  static String focusUnlockEndTimeTag(int ruleId) =>
      "focus.unlock.endTime.$ruleId";
  static String focusUnlockSaveTag(int ruleId) => "focus.unlock.save.$ruleId";
  static String focusUnlockRemoveTag(int ruleId) =>
      "focus.unlock.remove.$ruleId";

  /// Tags used to identify the tiles of a scheduled focus session based on its ID.
  static String scheduledFocusNameTag(int sessionId) =>
      "focus.scheduled.name.$sessionId";
  static String scheduledFocusStartTimeTag(int sessionId) =>
      "focus.scheduled.startTime.$sessionId";
  static String scheduledFocusEndTimeTag(int sessionId) =>
      "focus.scheduled.endTime.$sessionId";
  static String scheduledFocusBreakDurationTag(int sessionId) =>
      "focus.scheduled.breakDuration.$sessionId";
  static String scheduledFocusPauseTag(int sessionId) =>
      "focus.scheduled.pause.$sessionId";
  static String scheduledFocusBreakCountTag(int sessionId) =>
      "focus.scheduled.breakCount.$sessionId";
  static String scheduledFocusSaveTag(int sessionId) =>
      "focus.scheduled.save.$sessionId";
  static String scheduledFocusRemoveTag(int sessionId) =>
      "focus.scheduled.remove.$sessionId";

  /// Tag used to identify the tile for timer picker in focus mode.
  static const focusModeTimerTileTag = "focus.focusSessionTimerTile";

  /// Tag used to identify the button for give up or finish session in active session screen.
  static const giveUpOrFinishFocusSessionTag = "activeSession.giveUpOrFinish";

  /// Tag used to identify the button for session reflection in active session screen.
  static String sessionReflectionTag(int sessionId) =>
      "activeSession.sessionReflection.$sessionId";

  /// Tag used to identify the tile for data reset time in settings.
  static const dataResetTimeTileTag = "settings.general.dataResetTime";

  /// Tag used to identify the tile for importing database in settings.
  static const importDatabaseTileTag = "settings.database.importDatabase";

  /// Tag used to identify the tile for clearing crash log in settings.
  static const clearCrashLogsTileTag = "settings.database.clearCrashLogs";

  /// Tag used to identify the remove button in a restriction group card based on the group ID.
  static String removeRestrictionGroupTag(int groupId) =>
      "restrictionGroupScreen.removerestrictionGroup.$groupId";

  /// Tag used to identify the update button in a restriction group card based on the group ID.
  static String updateRestrictionGroupTag(int groupId) =>
      "restrictionGroupScreen.updaterestrictionGroup.$groupId";

  /// Tag used to identify the restriction group name tile based on the group ID.
  static String restrictionGroupNameTileTag(int groupId) =>
      "restrictionGroupScreen.restrictionGroupName.$groupId";

  /// Tag used to identify the restriction group timer tile based on the group ID.
  static String restrictionGroupTimerTileTag(int groupId) =>
      "restrictionGroupScreen.restrictionGroupTimer.$groupId";

  /// Tag used to identify the create notification schedule FAB .
  static const newNotificationScheduleFABTag =
      "notifications.newNotificationScheduleFAB";

  /// Tag used to identify the notification schedule timer tile based on the schedule ID.
  static String notificationScheduleTimerTileTag(int scheduleId) =>
      "notifications.notificationScheduleTimer.$scheduleId";
}
