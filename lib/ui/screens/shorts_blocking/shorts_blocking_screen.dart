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
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/providers/restrictions/wellbeing_provider.dart';
import 'package:mindful/providers/system/permissions_provider.dart';
import 'package:mindful/providers/usage/shorts_screen_time_provider.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/dialogs/timer_picker_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';
import 'package:mindful/ui/common/scaffold_shell.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/permissions/accessibility_permission_card.dart';
import 'package:mindful/ui/screens/shorts_blocking/sliver_shorts_quick_actions.dart';

class ShortsBlockingScreen extends ConsumerWidget {
  const ShortsBlockingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final haveAccessibilityPermission = ref.watch(
      permissionProvider.select((v) => v.haveAccessibilityPermission),
    );

    return ScaffoldShell(
      items: [
        NavbarItem(
          icon: FluentIcons.arrow_flow_diagonal_up_right_12_filled,
          filledIcon: FluentIcons.arrow_flow_diagonal_up_right_12_filled,
          titleText: context.locale.shorts_blocking_tab_title,
          sliverBody: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              /// Information about shorts blocking
              StyledText(context.locale.shorts_blocking_tab_info).sliver,

              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              /// Shared daily allowance for blocked short content
              _ShortAllowanceCard(enabled: haveAccessibilityPermission).sliver,

              const AccessibilityPermissionCard(),

              /// One collapsible card per platform
              SliverShortsQuickActions(
                haveNecessaryPerms: haveAccessibilityPermission,
              ),

              const SliverTabsBottomPadding(),
            ],
          ),
        )
      ],
    );
  }
}

/// Minimal card for the shared daily short content allowance: a switch, the
/// used/total time and a thin progress bar. Tapping it edits the time.
class _ShortAllowanceCard extends ConsumerWidget {
  const _ShortAllowanceCard({required this.enabled});

  final bool enabled;

  static const _defaultAllowanceSec = 30 * 60;

  void _editAllowance(BuildContext context, WidgetRef ref, int current) async {
    final newTime = await showShortsTimerPicker(
      context: context,
      heroTag: HeroTags.shortAllowanceTileTag,
      initialTime: current,
    );
    if (newTime == null || newTime <= 0 || newTime == current) return;
    ref.read(wellBeingProvider.notifier).setAllowedShortContentTime(newTime);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final allowanceSec =
        ref.watch(wellBeingProvider.select((v) => v.allowedShortsTimeSec));
    final isOn = allowanceSec > 0;
    final usedSec = ref.watch(shortsScreenTimeProvider).value ?? 0;
    final progress = isOn ? (usedSec / allowanceSec).clamp(0.0, 1.0) : 0.0;
    final isUsedUp = isOn && usedSec >= allowanceSec;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DefaultHero(
        tag: HeroTags.shortAllowanceTileTag,
        child: RoundedContainer(
          padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
          color: scheme.surfaceContainer,
          alignment: Alignment.topLeft,
          onPressed: enabled && isOn
              ? () => _editAllowance(context, ref, allowanceSec)
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    FluentIcons.timer_20_regular,
                    color: scheme.onSurfaceVariant,
                  ),
                  14.hBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledText(
                          context.locale.short_allowance_title,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        2.vBox,
                        StyledText(
                          isOn
                              ? context.locale.short_allowance_used(
                                  Duration(seconds: usedSec)
                                      .toTimeShort(context),
                                  Duration(seconds: allowanceSec)
                                      .toTimeShort(context),
                                )
                              : context.locale.short_allowance_off,
                          fontSize: 13,
                          color: isUsedUp
                              ? scheme.error
                              : Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: isOn,
                    onChanged: enabled
                        ? (on) => ref
                            .read(wellBeingProvider.notifier)
                            .setAllowedShortContentTime(
                              on ? _defaultAllowanceSec : 0,
                            )
                        : null,
                  ),
                ],
              ),

              /// Thin progress bar while on
              if (isOn)
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 34, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 4,
                      backgroundColor: scheme.surfaceContainerHighest,
                      color: isUsedUp ? scheme.error : scheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
