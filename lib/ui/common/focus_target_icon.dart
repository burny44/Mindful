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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';
import 'package:mindful/providers/apps/apps_info_provider.dart';
import 'package:mindful/ui/common/application_icon.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Localized name of a virtual app like Instagram Reels.
String virtualAppName(BuildContext context, String target) => switch (target) {
      FocusTargets.instagramReels => context.locale.virtual_app_instagram_reels,
      _ => context.locale.virtual_app_youtube_shorts,
    };

/// Round icon for a virtual app (Instagram Reels, YouTube Shorts).
class VirtualAppIcon extends StatelessWidget {
  const VirtualAppIcon({super.key, required this.target, this.size = 18});

  final String target;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: SvgPicture.asset(
        FocusTargets.virtualAppIcon(target),
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSecondaryContainer,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

/// Round icon used for an app group.
class AppGroupIcon extends StatelessWidget {
  const AppGroupIcon({super.key, this.size = 18});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      child: Icon(
        FluentIcons.folder_20_filled,
        size: size,
        color: Theme.of(context).colorScheme.onTertiaryContainer,
      ),
    );
  }
}

/// Horizontal pill listing the targets of a session, rule or group.
///
/// Apps are shown as icons, virtual apps as their platform icon and groups as
/// a chip with the group name.
class FocusTargetsStrip extends ConsumerWidget {
  const FocusTargetsStrip({
    super.key,
    required this.targets,
    this.leading,
  });

  final List<String> targets;
  final Widget? leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appsInfo = ref.watch(appsInfoProvider).value;
    final groups = {for (final g in ref.watch(appGroupsProvider)) g.id: g};

    /// Hide apps which are no longer installed and groups which were deleted
    final visible = targets.where((t) {
      if (FocusTargets.isVirtualApp(t)) return true;
      final groupId = FocusTargets.groupIdOf(t);
      if (groupId != null) return groups.containsKey(groupId);
      return appsInfo == null || appsInfo.containsKey(t);
    }).toList();

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 40,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 4),
                child: leading,
              ),
            Expanded(
              child: Skeletonizer.zone(
                enableSwitchAnimation: true,
                enabled: appsInfo == null,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: visible.length,
                  itemBuilder: (context, index) {
                    final target = visible[index];
                    final groupId = FocusTargets.groupIdOf(target);

                    final Widget child;
                    if (groupId != null) {
                      child = _GroupChip(name: groups[groupId]?.name ?? "");
                    } else if (FocusTargets.isVirtualApp(target)) {
                      child = VirtualAppIcon(target: target, size: 14);
                    } else {
                      final appInfo = appsInfo?[target];
                      child = appInfo == null
                          ? const Bone.icon(size: 28)
                          : ApplicationIcon(appInfo: appInfo, size: 14);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Center(child: child),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupChip extends StatelessWidget {
  const _GroupChip({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.only(left: 4, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FluentIcons.folder_20_filled,
            size: 16,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          4.hBox,
          StyledText(
            name,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
        ],
      ),
    );
  }
}
