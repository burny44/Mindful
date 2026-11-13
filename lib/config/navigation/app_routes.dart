/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter/material.dart';
import 'package:mindful/core/enums/usage_type.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/ui/onboarding/onboarding_screen.dart';
import 'package:mindful/ui/screens/app_dashboard/app_dashboard_screen.dart';
import 'package:mindful/ui/screens/change_logs/change_logs_screen.dart';
import 'package:mindful/ui/screens/focus/create_update_focus_unlock_screen.dart';
import 'package:mindful/ui/screens/focus/create_update_scheduled_focus_screen.dart';
import 'package:mindful/ui/screens/home/home_screen.dart';
import 'package:mindful/ui/screens/settings/settings_screen.dart';
import 'package:mindful/ui/screens/shorts_blocking/shorts_blocking_screen.dart';
import 'package:mindful/ui/screens/notifications/notifications_screen.dart';
import 'package:mindful/ui/screens/websites_blocking/websites_blocking_screen.dart';
import 'package:mindful/ui/splash_screen.dart';

class AppRoutes {
  static const String rootSplashPath = '/';
  static const String onboardingPath = '/onboarding';
  static const String changeLogsPath = '/changeLogs';
  static const String settingsPath = '/settings';

  static const String homePath = '/home';
  static const String focusUnlockRulePath = '/focusUnlock';
  static const String scheduledFocusPath = '/scheduledFocus';

  static const String shortsBlockingPath = '/shortsBlocking';
  static const String websitesBlockingPath = '/websitesBlocking';

  static const String appDashboardPath = '/appDashboard';
  static const String notificationsPath = '/notifications';

  static final Map<String, Widget Function(BuildContext)> routes = {
    /// Root
    rootSplashPath: (context) => const SplashScreen(),

    /// Onboarding screen
    onboardingPath: (context) => OnboardingScreen(
          isOnboardingDone:
              context.resolveParam<bool>("isOnboardingDone") ?? false,
        ),

    /// Change logs screen
    changeLogsPath: (context) => const ChangeLogsScreen(),

    /// Settings screen
    settingsPath: (context) => SettingsScreen(
          initialTabIndex: context.resolveParam<int>("tab"),
        ),

    /// Home screen
    homePath: (context) => HomeScreen(
          initialTabIndex: context.resolveParam<int>("tab"),
        ),

    /// Parental controls screen

    /// Restriction groups screen

    /// Shorts blocking screen
    shortsBlockingPath: (context) => const ShortsBlockingScreen(),

    /// Websites blocking screen
    websitesBlockingPath: (context) => const WebsitesBlockingScreen(),

    /// Notifications list screen
    notificationsPath: (context) => NotificationsScreen(
          initialTabIndex: context.resolveParam<int>("tab"),
        ),

    /// New earn-unlock session screen
    focusUnlockRulePath: (context) => const CreateUpdateFocusUnlockScreen(),

    /// New scheduled focus session screen
    scheduledFocusPath: (context) => const CreateUpdateScheduledFocusScreen(),

    /// App dashboard screen
    appDashboardPath: (context) => AppDashboardScreen(
          packageName: context.resolveParam<String>("package") ?? "",
          initialUsageType:
              UsageType.values[(context.resolveParam<int>("usageType") ?? 0) % 2],
          selectedDay: context.resolveParam<DateTime>("day"),
        ),
  };
}
