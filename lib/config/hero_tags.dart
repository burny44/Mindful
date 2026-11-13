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

  /// Tag used to identify the daily Instagram usage limit (for reels) tile.
  static const instagramUsageLimitTileTag = "shortsBlocking.instagramUsageLimit";

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

  /// Tags used to identify the tiles of an app group based on its ID.
  static String appGroupNameTag(int groupId) => "appGroup.name.$groupId";
  static String appGroupSaveTag(int groupId) => "appGroup.save.$groupId";
  static String appGroupRemoveTag(int groupId) => "appGroup.remove.$groupId";

  /// Tag used to identify the tile for data reset time in settings.
  static const dataResetTimeTileTag = "settings.general.dataResetTime";

  /// Tag used to identify the tile for importing database in settings.
  static const importDatabaseTileTag = "settings.database.importDatabase";

  /// Tag used to identify the tile for clearing crash log in settings.
  static const clearCrashLogsTileTag = "settings.database.clearCrashLogs";

  /// Tag used to identify the create notification schedule FAB .
  static const newNotificationScheduleFABTag =
      "notifications.newNotificationScheduleFAB";

  /// Tag used to identify the notification schedule timer tile based on the schedule ID.
  static String notificationScheduleTimerTileTag(int scheduleId) =>
      "notifications.notificationScheduleTimer.$scheduleId";
}
