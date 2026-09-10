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
import 'package:mindful/providers/system/permissions_provider.dart';
import 'package:mindful/ui/common/sliver_primary_action_container.dart';
import 'package:mindful/ui/permissions/permission_sheet.dart';

/// Dashboard banner for missing home-required permissions
/// (essentials + accessibility). Grant flow starts from the card button.
class MissingEssentialPermissionsAlert extends ConsumerWidget {
  const MissingEssentialPermissionsAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final haveAll = ref.watch(
      permissionProvider.select((v) => v.haveAllHomeRequiredPermissions),
    );

    return SliverPrimaryActionContainer(
      isVisible: !haveAll,
      margin: const EdgeInsets.symmetric(vertical: 4),
      icon: FluentIcons.shield_error_20_regular,
      title: context.locale.missing_permissions_card_title,
      information: context.locale.missing_permissions_card_info,
      positiveBtn: FilledButton(
        child: Text(context.locale.permission_button_grant_permission),
        onPressed: () => grantNextMissingHomePermission(context, ref),
      ),
    );
  }
}

/// Opens the grant UI for the first missing home-required permission.
Future<void> grantNextMissingHomePermission(
  BuildContext context,
  WidgetRef ref,
) async {
  final perms = ref.read(permissionProvider);
  final notifier = ref.read(permissionProvider.notifier);

  if (!perms.haveNotificationPermission) {
    notifier.askNotificationPermission();
    return;
  }

  if (!perms.haveUsageAccessPermission) {
    await _showPermissionSheet(
      context: context,
      icon: FluentIcons.data_pie_20_filled,
      title: context.locale.permission_usage_title,
      description: context.locale.permission_usage_info,
      deviceSwitchTileLabel: context.locale.permission_usage_device_tile_label,
      onGrant: notifier.askUsageAccessPermission,
    );
    return;
  }

  if (!perms.haveDisplayOverlayPermission) {
    await _showPermissionSheet(
      context: context,
      icon: FluentIcons.app_recent_20_filled,
      title: context.locale.permission_overlay_title,
      description: context.locale.permission_overlay_info,
      deviceSwitchTileLabel:
          context.locale.permission_overlay_device_tile_label,
      onGrant: notifier.askDisplayOverlayPermission,
    );
    return;
  }

  if (!perms.haveAlarmsPermission) {
    await _showPermissionSheet(
      context: context,
      icon: FluentIcons.clock_alarm_20_filled,
      title: context.locale.permission_alarms_title,
      description: context.locale.permission_alarms_info,
      deviceSwitchTileLabel: context.locale.permission_alarms_device_tile_label,
      onGrant: notifier.askExactAlarmPermission,
    );
    return;
  }

  if (!perms.haveAccessibilityPermission) {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => PermissionSheet(
        icon: FluentIcons.accessibility_20_filled,
        isAccessibilityPerm: true,
        title: context.locale.permission_accessibility_title,
        description: context.locale.permission_accessibility_info,
        deviceSwitchTileLabel:
            context.locale.permission_accessibility_device_tile_label,
        onTapGrantPermission: () {
          Navigator.of(sheetContext).maybePop();
          notifier.askAccessibilityPermission();
        },
      ),
    );
  }
}

Future<void> _showPermissionSheet({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String description,
  required String deviceSwitchTileLabel,
  required VoidCallback onGrant,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => PermissionSheet(
      icon: icon,
      title: title,
      description: description,
      deviceSwitchTileLabel: deviceSwitchTileLabel,
      onTapGrantPermission: () {
        Navigator.of(sheetContext).maybePop();
        onGrant();
      },
    ),
  );
}
