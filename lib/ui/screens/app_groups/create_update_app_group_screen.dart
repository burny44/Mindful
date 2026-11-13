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
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/models/app_group.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_fab_button.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/focus_target_icon.dart';
import 'package:mindful/ui/common/scaffold_shell.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/dialogs/app_selection_sheet.dart';
import 'package:mindful/ui/dialogs/input_field_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';

/// Creates or edits an app group.
class CreateUpdateAppGroupScreen extends ConsumerStatefulWidget {
  const CreateUpdateAppGroupScreen({super.key, this.group});

  final AppGroup? group;

  @override
  ConsumerState<CreateUpdateAppGroupScreen> createState() =>
      _CreateUpdateAppGroupScreenState();
}

class _CreateUpdateAppGroupScreenState
    extends ConsumerState<CreateUpdateAppGroupScreen> {
  late AppGroup _group = widget.group ?? const AppGroup();

  bool get _isEditing => widget.group != null;

  @override
  Widget build(BuildContext context) {
    final isLocked =
        _isEditing && ref.read(appGroupsProvider.notifier).isLocked(_group.id);

    return ScaffoldShell(
      items: [
        NavbarItem(
          icon: FluentIcons.app_folder_20_regular,
          filledIcon: FluentIcons.app_folder_20_filled,
          titleText: _group.name.isEmpty
              ? context.locale.app_group_new_button
              : _group.name,
          fab: isLocked
              ? null
              : DefaultFabButton(
                  heroTag:
                      _isEditing ? HeroTags.appGroupSaveTag(_group.id) : null,
                  icon: _isEditing
                      ? FluentIcons.arrow_upload_20_filled
                      : FluentIcons.save_20_filled,
                  label: context.locale.new_session_save_button,
                  onPressed: _saveGroup,
                ),
          sliverBody: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              StyledText(
                context.locale.app_groups_info,
                color: Theme.of(context).hintColor,
              ).sliver,
              12.vSliverBox,

              if (isLocked) ...[
                DefaultListTile(
                  position: ItemPosition.none,
                  leadingIcon: FluentIcons.lock_closed_20_regular,
                  titleText: context.locale.new_session_strict_badge,
                  subtitleText: context.locale.app_group_locked_snack,
                  accent: Theme.of(context).colorScheme.error,
                ).sliver,
                8.vSliverBox,
              ],

              /// Name
              DefaultHero(
                tag: HeroTags.appGroupNameTag(_group.id),
                child: DefaultListTile(
                  position: ItemPosition.top,
                  enabled: !isLocked,
                  leadingIcon: FluentIcons.text_field_20_regular,
                  titleText: context.locale.app_group_name_tile_title,
                  subtitleText: _group.name.isEmpty
                      ? context.locale.app_group_name_dialog_info
                      : _group.name,
                  onPressed: () => showAppGroupNameInputDialog(
                    context: context,
                    heroTag: HeroTags.appGroupNameTag(_group.id),
                    initialText: _group.name,
                  ).then((name) {
                    if (name == null || name.trim().isEmpty) return;
                    setState(() => _group = _group.copyWith(name: name.trim()));
                  }),
                ),
              ).sliver,

              /// Apps
              DefaultListTile(
                position: ItemPosition.bottom,
                enabled: !isLocked,
                leadingIcon: FluentIcons.apps_20_regular,
                titleText: context.locale.app_group_apps_tile_title,
                subtitleText: _group.apps.isEmpty
                    ? context.locale.new_session_no_apps_selected
                    : context.locale.app_group_apps_count(_group.apps.length),
                trailing: const Icon(FluentIcons.chevron_right_20_regular),
                onPressed: _pickApps,
              ).sliver,

              if (_group.apps.isNotEmpty) ...[
                ContentSectionHeader(
                  title: context.locale.app_group_apps_tile_title,
                ).sliver,
                FocusTargetsStrip(targets: _group.apps).sliver,
              ],

              const SliverTabsBottomPadding(),
            ],
          ),
        ),
      ],
    );
  }

  void _pickApps() async {
    final selected = await showAppSelectionSheet(
      context: context,
      title: context.locale.app_group_apps_tile_title,
      info: context.locale.app_group_apps_info,
      selectedApps: _group.apps,

      /// Groups cannot contain other groups
      allowGroups: false,
    );
    if (selected == null || !mounted) return;
    setState(() => _group = _group.copyWith(apps: selected));
  }

  void _saveGroup() async {
    if (_group.name.trim().isEmpty) {
      context.showSnackAlert(context.locale.app_group_no_name_snack);
      return;
    }

    if (_group.apps.isEmpty) {
      context.showSnackAlert(context.locale.new_session_no_apps_snack);
      return;
    }

    final notifier = ref.read(appGroupsProvider.notifier);
    if (_isEditing) {
      final ok = await notifier.updateGroup(_group);
      if (!ok && mounted) {
        context.showSnackAlert(context.locale.app_group_locked_snack);
        return;
      }
    } else {
      await notifier.createGroup(_group);
    }

    if (mounted) Navigator.of(context).pop();
  }
}
