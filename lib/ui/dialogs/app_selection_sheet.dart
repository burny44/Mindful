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
import 'package:mindful/config/app_constants.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/ui/common/sliver_distracting_apps_list.dart';
import 'package:mindful/ui/common/styled_text.dart';

/// Opens a modal sheet which lets the user pick apps and save the selection.
///
/// Returns the selected packages or `null` if the sheet was dismissed without
/// saving.
Future<List<String>?> showAppSelectionSheet({
  required BuildContext context,
  required String title,
  required String info,
  required List<String> selectedApps,
  List<String> hiddenApps = const [],
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
      ),
    );

class _AppSelectionSheet extends StatefulWidget {
  const _AppSelectionSheet({
    required this.title,
    required this.info,
    required this.selectedApps,
    required this.hiddenApps,
  });

  final String title;
  final String info;
  final List<String> selectedApps;
  final List<String> hiddenApps;

  @override
  State<_AppSelectionSheet> createState() => _AppSelectionSheetState();
}

class _AppSelectionSheetState extends State<_AppSelectionSheet> {
  late List<String> _selected = List.of(widget.selectedApps);

  @override
  Widget build(BuildContext context) {
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
                  SliverDistractingAppsList(
                    distractingApps: _selected,
                    hiddenApps: widget.hiddenApps,
                    selectedHeading: widget.title,
                    emptyHeading: widget.title,
                    onSelectionChanged: (package, isSelected) => setState(
                      () => _selected = isSelected
                          ? [..._selected, package]
                          : [..._selected.where((e) => e != package)],
                    ),
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
