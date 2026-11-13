/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/enums/reminder_type.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/core/utils/default_models_utils.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/models/app_info.dart';
import 'package:mindful/providers/restrictions/apps_restrictions_provider.dart';
import 'package:mindful/providers/usage/apps_launch_count_provider.dart';
import 'package:mindful/ui/common/active_period_tile_content.dart';
import 'package:mindful/ui/common/default_dropdown_tile.dart';
import 'package:mindful/ui/common/default_expandable_list_tile.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/dialogs/app_launch_limit_dialog.dart';
import 'package:mindful/ui/screens/app_dashboard/app_internet_tile.dart';
import 'package:mindful/ui/screens/app_dashboard/app_timer_tile.dart';
import 'package:mindful/ui/transitions/default_hero.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Displays available restriction actions for the app in [AppDashboard]
class AppDashboardRestrictions extends ConsumerWidget {
  const AppDashboardRestrictions({
    super.key,
    required this.appInfo,
    required this.appTimer,
    required this.isPurged,
  });

  final AppInfo appInfo;
  final int appTimer;
  final bool isPurged;

  void _onLaunchCountPressed({
    required BuildContext context,
    required WidgetRef ref,
    required int launchLimit,
  }) async {
    final newLimit = await showAppLaunchLimitDialog(
      context: context,
      heroTag: HeroTags.appLaunchLimitTileTag(appInfo.packageName),
      initialCount: launchLimit,
    );

    ref.read(appsRestrictionsProvider.notifier).updateAppLaunchLimit(
          appInfo.packageName,
          newLimit ?? launchLimit,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysLaunchCount = ref.watch(appsLaunchCountProvider
        .select((v) => v.value?[appInfo.packageName] ?? 0));

    final restriction = ref.watch(
          appsRestrictionsProvider.select(
            (v) => v[appInfo.packageName],
          ),
        ) ??
        defaultAppRestrictionModel;

    return MultiSliver(
      children: [
        /// App Timer tile
        AppTimerTile(
          appInfo: appInfo,
          appTimer: appTimer,
          isPurged: isPurged,
        ).sliver,

        /// Usage reminders
        SliverAnimatedPaintExtent(
          duration: 500.ms,
          child: SliverVisibility(
            visible: restriction.timerSec > 0,
            sliver: DefaultDropdownTile<ReminderType>(
              value: restriction.reminderType,
              position: ItemPosition.mid,
              leadingIcon: FluentIcons.dual_screen_closed_alert_20_regular,
              titleText: context.locale.usage_reminders_tile_title,
              dialogIcon: FluentIcons.dual_screen_closed_alert_20_filled,
              infoText: context.locale.usage_reminders_tile_subtitle,
              onSelected: (type) =>
                  ref.read(appsRestrictionsProvider.notifier).setReminderType(
                        appInfo.packageName,
                        type,
                      ),
              items: {
                "None": ReminderType.none,
                "Toast": ReminderType.toast,
                "Notification": ReminderType.notification,
                "Overlay": ReminderType.modalSheet,
              }
                  .entries
                  .map((e) => DefaultDropdownItem(label: e.key, value: e.value))
                  .toList(),
            ).sliver,
          ),
        ),

        /// App launch limit
        DefaultHero(
          tag: HeroTags.appLaunchLimitTileTag(appInfo.packageName),
          child: DefaultListTile(
            enabled: !appInfo.isImpSysApp,
            position: ItemPosition.mid,
            titleText: context.locale.app_launch_limit_tile_title,
            subtitleText: context.locale
                .app_launch_limit_tile_subtitle(todaysLaunchCount),
            leadingIcon: FluentIcons.rocket_20_regular,
            trailing: restriction.launchLimit > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: StyledText(
                      restriction.launchLimit.toString(),
                      fontSize: 16,
                    ),
                  )
                : StyledText(
                    context.locale.app_limit_status_not_set,
                    isSubtitle: true,
                  ),
            onPressed: () => _onLaunchCountPressed(
              context: context,
              ref: ref,
              launchLimit: restriction.launchLimit,
            ),
          ),
        ).sliver,

        /// Active period
        DefaultExpandableListTile(
          enabled: !appInfo.isImpSysApp,
          position: ItemPosition.mid,
          leadingIcon: FluentIcons.drink_coffee_20_regular,
          titleText: context.locale.app_active_period_tile_title,
          subtitleText: restriction.periodDurationInMins > 0
              ? context.locale.app_active_period_tile_subtitle(
                  restriction.activePeriodStart.format(context),
                  restriction.activePeriodEnd.format(context),
                )
              : context.locale.app_limit_status_not_set,
          content: ActivePeriodTileContent(
            totalDuration: restriction.periodDurationInMins.minutes,
            startTime: restriction.activePeriodStart,
            endTime: restriction.activePeriodEnd,
            onTimeChanged: (start, end) =>
                ref.read(appsRestrictionsProvider.notifier).updateActivePeriod(
                      appInfo.packageName,
                      start,
                      end,
                    ),
          ),
        ).sliver,

        /// Internet access
        AppInternetTile(appInfo: appInfo).sliver,
      ],
    );
  }
}
