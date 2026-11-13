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
import 'package:mindful/config/app_constants.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/models/app_group.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/focus_target_icon.dart';
import 'package:mindful/ui/common/sliver_distracting_apps_list.dart';
import 'package:mindful/ui/common/styled_text.dart';

/// Opens a modal sheet which lets the user pick apps and save the selection.
///
/// Besides installed apps the sheet can also offer app groups ([allowGroups])
/// and virtual apps like Instagram Reels ([allowVirtualApps]). See
/// [FocusTargets] for how these are encoded in the returned list.
///
/// Returns the selected targets or `null` if the sheet was dismissed without
/// saving.
Future<List<String>?> showAppSelectionSheet({
  required BuildContext context,
  required String title,
  required String info,
  required List<String> selectedApps,
  List<String> hiddenApps = const [],
  bool allowGroups = true,
  bool allowVirtualApps = true,
}) async =>
    showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      sheetAnimationStyle: AnimationStyle(
        duration: AppConstants.defaultAnimDuration,
        curve: Curves.easeOutBack,
        reverseDuration: AppConstants.defaultAnimDuration,
        reverseCurve: Curves.easeOutBack.flipped,
      ),
      builder: (sheetContext) => _AppSelectionSheet(
        title: title,
        info: info,
        selectedApps: selectedApps,
        hiddenApps: hiddenApps,
        allowGroups: allowGroups,
        allowVirtualApps: allowVirtualApps,
      ),
    );

class _AppSelectionSheet extends ConsumerStatefulWidget {
  const _AppSelectionSheet({
    required this.title,
    required this.info,
    required this.selectedApps,
    required this.hiddenApps,
    required this.allowGroups,
    required this.allowVirtualApps,
  });

  final String title;
  final String info;
  final List<String> selectedApps;
  final List<String> hiddenApps;
  final bool allowGroups;
  final bool allowVirtualApps;

  @override
  ConsumerState<_AppSelectionSheet> createState() => _AppSelectionSheetState();
}

class _AppSelectionSheetState extends ConsumerState<_AppSelectionSheet> {
  late List<String> _selected = List.of(widget.selectedApps);

  void _toggle(String target, bool isSelected) => setState(
        () => _selected = isSelected
            ? [..._selected, target]
            : [..._selected.where((e) => e != target)],
      );

  @override
  Widget build(BuildContext context) {
    final groups = widget.allowGroups
        ? ref
            .watch(appGroupsProvider)
            .where(
              (g) =>
                  !widget.hiddenApps.contains(FocusTargets.groupTarget(g.id)),
            )
            .toList()
        : const <AppGroup>[];

    final virtualApps = widget.allowVirtualApps
        ? FocusTargets.virtualApps
            .where((e) => !widget.hiddenApps.contains(e))
            .toList()
        : const <String>[];

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            /// Heading and information
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText(
                    widget.title,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  4.vBox,
                  StyledText(
                    widget.info,
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),

            /// Apps
            Expanded(
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  /// App groups
                  if (groups.isNotEmpty) ...[
                    ContentSectionHeader(
                      title: context.locale.app_groups_heading,
                    ).sliver,
                    SliverList.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        final target = FocusTargets.groupTarget(group.id);
                        final isSelected = _selected.contains(target);

                        return DefaultListTile(
                          position: getItemPositionInList(index, groups.length),
                          color:
                              Theme.of(context).colorScheme.surfaceContainerLow,
                          isSelected: isSelected,
                          leading: const AppGroupIcon(size: 16),
                          titleText: group.name,
                          subtitleText: context.locale
                              .app_group_apps_count(group.apps.length),
                          onPressed: () => _toggle(target, !isSelected),
                        );
                      },
                    ),
                  ],

                  /// Reels, shorts, ...
                  if (virtualApps.isNotEmpty) ...[
                    ContentSectionHeader(
                      title: context.locale.virtual_apps_heading,
                    ).sliver,
                    SliverList.builder(
                      itemCount: virtualApps.length,
                      itemBuilder: (context, index) {
                        final target = virtualApps[index];
                        final isSelected = _selected.contains(target);

                        return DefaultListTile(
                          position:
                              getItemPositionInList(index, virtualApps.length),
                          color:
                              Theme.of(context).colorScheme.surfaceContainerLow,
                          isSelected: isSelected,
                          leading: VirtualAppIcon(target: target, size: 16),
                          titleText: virtualAppName(context, target),
                          subtitleText:
                              context.locale.virtual_apps_tile_subtitle,
                          onPressed: () => _toggle(target, !isSelected),
                        );
                      },
                    ),
                  ],

                  /// Installed apps
                  SliverDistractingAppsList(
                    distractingApps:
                        _selected.where(FocusTargets.isApp).toList(),
                    hiddenApps: widget.hiddenApps,
                    selectedHeading: widget.title,
                    emptyHeading: widget.title,
                    onSelectionChanged: _toggle,
                  ),
                  24.vSliverBox,
                ],
              ),
            ),

            /// Save selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(
                width: double.maxFinite,
                child: FilledButton.icon(
                  icon: const Icon(FluentIcons.checkmark_20_filled),
                  label: Text(
                    context.locale.focus_unlock_save_selection_button,
                  ),
                  onPressed: () => Navigator.of(context).pop(_selected),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
