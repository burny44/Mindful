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
import 'package:mindful/config/navigation/app_routes.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_list.dart';
import 'package:mindful/providers/usage/todays_apps_usage_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/default_refresh_indicator.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/permissions/missing_essential_permissions_alert.dart';
import 'package:mindful/ui/screens/home/dashboard/sliver_focus_unlock_rules.dart';
import 'package:mindful/ui/screens/home/dashboard/sliver_in_app_blocking.dart';
import 'package:mindful/ui/screens/home/dashboard/sliver_scheduled_focus_sessions.dart';
import 'package:mindful/ui/transitions/default_effects.dart';
import 'package:sliver_tools/sliver_tools.dart';

class TabDashboard extends ConsumerWidget {
  const TabDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultRefreshIndicator(
      onRefresh: () async => ref
          .read(todaysAppsUsageProvider.notifier)
          .refreshTodaysUsage(resetState: true),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// Missing essential permissions
          const MissingEssentialPermissionsAlert(),

          /// Scheduled focus sessions
          const SliverScheduledFocusSessions(),

          /// Saved earn-unlock sessions
          const SliverFocusUnlockRules(),

          /// Active in-app blocking (reels, shorts, ...)
          const SliverInAppBlocking(),

          MultiSliver(
            children: [
              /// Restrictions
              ..._restrictions(context),
            ].animateListOnce(
              ref: ref,
              uniqueKey: "home.dashboard",
              delay: 100.ms,
              effects: DefaultEffects.transitionIn,
              interval: 100.ms,
            ),
          ),

          const SliverTabsBottomPadding(),
        ],
      ),
    );
  }

  static List<Widget> _restrictions(BuildContext context) => [
        /// Restrictions
        ContentSectionHeader(
          title: context.locale.restrictions_heading,
        ),

        /// Website restrictions
        DefaultListTile(
          position: ItemPosition.none,
          leadingIcon: FluentIcons.earth_20_regular,
          titleText: context.locale.websites_blocking_tab_title,
          subtitleText: context.locale.websites_blocking_tile_subtitle,
          trailing: const Icon(FluentIcons.chevron_right_20_regular),
          onPressed: () =>
              Navigator.of(context).pushNamed(AppRoutes.websitesBlockingPath),
        ),
      ];
}
