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
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/models/app_group.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';
import 'package:mindful/ui/common/default_slide_to_remove.dart';
import 'package:mindful/ui/common/focus_target_icon.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/dialogs/confirmation_dialog.dart';
import 'package:mindful/ui/screens/app_groups/create_update_app_group_screen.dart';
import 'package:mindful/ui/transitions/default_hero.dart';

/// Card for an app group, styled like the focus session cards.
class AppGroupCard extends ConsumerWidget {
  const AppGroupCard({
    super.key,
    required this.group,
    this.position,
  });

  final AppGroup group;
  final ItemPosition? position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watch sessions indirectly so the lock state stays fresh
    ref.watch(appGroupsProvider);
    final isLocked = ref.read(appGroupsProvider.notifier).isLocked(group.id);

    return DefaultHero(
      tag: HeroTags.appGroupRemoveTag(group.id),
      child: DefaultSlideToRemove(
        enabled: !isLocked,
        removable: !isLocked,
        key: Key("appGroup.${group.id}"),
        position: position ?? ItemPosition.none,
        onDismiss: () => _removeGroup(context, ref),
        child: RoundedContainer(
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainer,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateUpdateAppGroupScreen(group: group),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    FluentIcons.app_folder_20_filled,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  12.hBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          group.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        StyledText(
                          context.locale
                              .app_group_apps_count(group.apps.length),
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  if (isLocked)
                    Icon(
                      FluentIcons.lock_closed_20_filled,
                      size: 18,
                      color: Theme.of(context).colorScheme.error,
                    ),
                ],
              ),
              12.vBox,
              FocusTargetsStrip(targets: group.apps),
            ],
          ),
        ),
      ),
    );
  }

  void _removeGroup(BuildContext context, WidgetRef ref) async {
    final confirm = await showConfirmationDialog(
      context: context,
      heroTag: HeroTags.appGroupRemoveTag(group.id),
      title: context.locale.app_group_remove_dialog_title,
      info: context.locale.app_group_remove_dialog_info,
      icon: FluentIcons.delete_20_filled,
      positiveLabel: context.locale.dialog_button_remove,
    );

    if (!confirm) return;

    final ok = await ref.read(appGroupsProvider.notifier).removeGroup(group);
    if (!ok && context.mounted) {
      context.showSnackAlert(context.locale.app_group_locked_snack);
    }
  }
}
