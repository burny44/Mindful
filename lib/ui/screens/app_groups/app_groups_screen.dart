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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_fab_button.dart';
import 'package:mindful/ui/common/scaffold_shell.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/screens/app_groups/app_group_card.dart';
import 'package:mindful/ui/screens/app_groups/create_update_app_group_screen.dart';

/// Lists the user's app groups and lets them create new ones.
class AppGroupsScreen extends ConsumerWidget {
  const AppGroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(appGroupsProvider);

    return ScaffoldShell(
      items: [
        NavbarItem(
          icon: FluentIcons.app_folder_20_regular,
          filledIcon: FluentIcons.app_folder_20_filled,
          titleText: context.locale.app_groups_heading,
          fab: DefaultFabButton(
            icon: FluentIcons.add_20_filled,
            label: context.locale.app_group_new_button,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateUpdateAppGroupScreen(),
              ),
            ),
          ),
          sliverBody: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              StyledText(
                context.locale.app_groups_info,
                color: Theme.of(context).hintColor,
              ).sliver,
              12.vSliverBox,
              if (groups.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      children: [
                        Icon(
                          FluentIcons.app_folder_20_regular,
                          size: 48,
                          color: Theme.of(context).hintColor,
                        ),
                        12.vBox,
                        StyledText(
                          context.locale.app_groups_empty,
                          color: Theme.of(context).hintColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else ...[
                ContentSectionHeader(
                  title: context.locale.app_groups_your_groups_heading,
                ).sliver,
                SliverList.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) => AppGroupCard(
                    group: groups[index],
                    position: getItemPositionInList(index, groups.length),
                  ),
                ),
              ],
              const SliverTabsBottomPadding(),
            ],
          ),
        ),
      ],
    );
  }
}
