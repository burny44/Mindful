/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/models/focus_unlock_rule.dart';
import 'package:mindful/providers/apps/apps_info_provider.dart';
import 'package:mindful/providers/focus/focus_unlock_rule_provider.dart';
import 'package:mindful/providers/usage/todays_apps_usage_provider.dart';
import 'package:mindful/ui/common/application_icon.dart';
import 'package:mindful/ui/common/default_slide_to_remove.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/common/time_text_short.dart';
import 'package:mindful/ui/dialogs/confirmation_dialog.dart';
import 'package:mindful/ui/screens/focus/create_update_focus_unlock_screen.dart';
import 'package:mindful/ui/transitions/default_hero.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Dashboard card for a saved earn-unlock session.
///
/// Shows how much of the required time is already earned today and opens the
/// editor when tapped.
class FocusUnlockRuleCard extends ConsumerWidget {
  const FocusUnlockRuleCard({
    super.key,
    required this.rule,
    this.position,
  });

  final FocusUnlockRule rule;
  final ItemPosition? position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Watched directly rather than through `select`: a selector returning a
    /// freshly built collection is never `==` to the previous one, so it would
    /// rebuild this card on every notification instead of only on real changes.
    final appsInfo = ref.watch(appsInfoProvider).value;
    final unlockAppsInfo = appsInfo == null
        ? null
        : rule.unlockApps.map((e) => appsInfo[e]).nonNulls.toList();

    final timeSpent = ref.watch(
          todaysAppsUsageProvider.select(
            (v) => v.value?.entries
                .where((e) => rule.sourceApps.contains(e.key))
                .fold<int>(0, (t, e) => t + e.value.screenTime),
          ),
        ) ??
        0;

    final progress = rule.requiredTimeSec <= 0
        ? 0.0
        : min(1.0, max(0.0, timeSpent / rule.requiredTimeSec));
    final isUnlocked = progress >= 1;

    return DefaultHero(
      tag: HeroTags.focusUnlockRemoveTag(rule.id),
      child: DefaultSlideToRemove(
        enabled: true,
        key: Key("focusUnlockRule.${rule.id}"),
        position: position ?? ItemPosition.none,
        onDismiss: () => _removeRule(context, ref),
        child: RoundedContainer(
          borderRadius: BorderRadius.circular(0),
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainer,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateUpdateFocusUnlockScreen(rule: rule),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  /// Earned time indicator
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 1,
                            strokeWidth: 6,
                            strokeCap: StrokeCap.round,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          CircularProgressIndicator(
                            strokeWidth: 6,
                            strokeCap: StrokeCap.round,
                            value: progress > 0 ? progress : 1,
                            color: isUnlocked
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.hBox,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Session name
                        StyledText(
                          rule.name.isEmpty
                              ? context.locale.focus_unlock_screen_title
                              : rule.name,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        /// Schedule
                        StyledText(
                          rule.scheduleDurationInMins > 0
                              ? context.locale.app_active_period_tile_subtitle(
                                  rule.scheduleStartTime.format(context),
                                  rule.scheduleEndTime.format(context),
                                )
                              : context.locale.focus_unlock_schedule_all_day,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                  12.hBox,

                  /// Earned time / required time
                  TimeTextShort(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    timeDuration: timeSpent.seconds,
                    secondaryFontWeight: FontWeight.w600,
                  ),
                  const StyledText(" / ", fontSize: 14),
                  TimeTextShort(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    timeDuration: rule.requiredTimeSec.seconds,
                    secondaryFontWeight: FontWeight.w600,
                  ),
                ],
              ),
              12.vBox,

              /// Apps which are waiting to be unlocked
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 4),
                        child: Icon(
                          isUnlocked
                              ? FluentIcons.lock_open_20_filled
                              : FluentIcons.lock_closed_20_filled,
                          size: 16,
                          color: isUnlocked
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).hintColor,
                        ),
                      ),
                      Expanded(
                        child: Skeletonizer.zone(
                          enableSwitchAnimation: true,
                          enabled: unlockAppsInfo == null,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: unlockAppsInfo?.length ??
                                rule.unlockApps.length,
                            itemBuilder: (context, index) {
                              final appInfo =
                                  unlockAppsInfo?.elementAtOrNull(index);

                              return Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: appInfo == null
                                    ? const Bone.icon(size: 28)
                                    : ApplicationIcon(
                                        appInfo: appInfo,
                                        size: 14,
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _removeRule(BuildContext context, WidgetRef ref) async {
    final confirm = await showConfirmationDialog(
      context: context,
      heroTag: HeroTags.focusUnlockRemoveTag(rule.id),
      title: context.locale.focus_unlock_remove_dialog_title,
      info: context.locale.focus_unlock_remove_dialog_info,
      icon: FluentIcons.delete_20_filled,
      positiveLabel: context.locale.dialog_button_remove,
    );

    if (!confirm) return;

    ref.read(focusUnlockRulesProvider.notifier).removeRule(rule);
  }
}
