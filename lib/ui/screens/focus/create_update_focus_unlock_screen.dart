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
import 'package:mindful/config/app_constants.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/core/database/adapters/time_of_day_adapter.dart';
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/core/extensions/ext_num.dart';
import 'package:mindful/core/extensions/ext_widget.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/models/focus_unlock_rule.dart';
import 'package:mindful/providers/focus/focus_unlock_rule_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_fab_button.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/scaffold_shell.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/common/time_period_start_end_cards.dart';
import 'package:mindful/ui/dialogs/app_selection_sheet.dart';
import 'package:mindful/ui/dialogs/input_field_dialog.dart';
import 'package:mindful/ui/dialogs/timer_picker_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';

/// Creates a new earn-unlock session or edits an existing one.
///
/// Nothing is persisted until the save FAB is pressed.
class CreateUpdateFocusUnlockScreen extends ConsumerStatefulWidget {
  const CreateUpdateFocusUnlockScreen({super.key, this.rule});

  final FocusUnlockRule? rule;

  @override
  ConsumerState<CreateUpdateFocusUnlockScreen> createState() =>
      _CreateUpdateFocusUnlockScreenState();
}

class _CreateUpdateFocusUnlockScreenState
    extends ConsumerState<CreateUpdateFocusUnlockScreen> {
  FocusUnlockRule _rule = const FocusUnlockRule(name: "Earn unlock");

  bool get _isEditing => widget.rule != null;

  @override
  void initState() {
    super.initState();
    _rule = widget.rule ?? _rule;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
      items: [
        NavbarItem(
          icon: FluentIcons.lock_open_20_regular,
          filledIcon: FluentIcons.lock_open_20_filled,
          titleText: _rule.name.isEmpty
              ? context.locale.focus_unlock_screen_title
              : _rule.name,

          /// Save session
          fab: DefaultFabButton(
            heroTag: _isEditing ? HeroTags.focusUnlockSaveTag(_rule.id) : null,
            icon: _isEditing
                ? FluentIcons.arrow_upload_20_filled
                : FluentIcons.save_20_filled,
            label: context.locale.focus_unlock_save_session_button,
            onPressed: _saveSession,
          ),
          sliverBody: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              StyledText(
                context.locale.focus_unlock_info,
                color: Theme.of(context).hintColor,
              ).sliver,
              12.vSliverBox,

              /// Session name
              DefaultHero(
                tag: HeroTags.focusUnlockNameTag(_rule.id),
                child: DefaultListTile(
                  position: ItemPosition.top,
                  leadingIcon: FluentIcons.text_field_20_regular,
                  titleText: context.locale.focus_unlock_name_tile_title,
                  subtitleText: _rule.name,
                  onPressed: () => showFocusUnlockNameInputDialog(
                    context: context,
                    heroTag: HeroTags.focusUnlockNameTag(_rule.id),
                    initialText: _rule.name,
                  ).then((name) {
                    if (name == null || name.isEmpty) return;
                    setState(() => _rule = _rule.copyWith(name: name));
                  }),
                ),
              ).sliver,

              /// Required time
              DefaultHero(
                tag: HeroTags.focusUnlockRequiredTimeTag(_rule.id),
                child: DefaultListTile(
                  position: ItemPosition.bottom,
                  leadingIcon: FluentIcons.timer_20_regular,
                  titleText: context.locale.focus_unlock_required_time_title,
                  subtitleText: _rule.requiredTimeSec > 0
                      ? _rule.requiredTimeSec.seconds
                          .toTimeFull(context, replaceCommaWithAnd: true)
                      : context.locale.app_limit_status_not_set,
                  onPressed: () => showFocusUnlockTimerPicker(
                    context: context,
                    heroTag: HeroTags.focusUnlockRequiredTimeTag(_rule.id),
                    initialTime: _rule.requiredTimeSec,
                  ).then((timer) {
                    if (timer == null) return;
                    setState(
                      () => _rule = _rule.copyWith(requiredTimeSec: timer),
                    );
                  }),
                ),
              ).sliver,

              /// Apps
              ContentSectionHeader(
                title: context.locale.focus_unlock_apps_heading,
              ).sliver,

              /// Apps which count towards the unlock
              DefaultListTile(
                position: ItemPosition.top,
                leadingIcon: FluentIcons.target_arrow_20_regular,
                titleText: context.locale.focus_unlock_source_apps_heading,
                subtitleText: _rule.sourceApps.isEmpty
                    ? context.locale.focus_unlock_no_apps_selected
                    : context.locale
                        .focus_unlock_apps_selected(_rule.sourceApps.length),
                trailing: const Icon(FluentIcons.chevron_right_20_regular),
                onPressed: () => _pickApps(isSourceApps: true),
              ).sliver,

              /// Apps unlocked once the time is earned
              DefaultListTile(
                position: ItemPosition.bottom,
                leadingIcon: FluentIcons.lock_closed_20_regular,
                titleText: context.locale.focus_unlock_reward_apps_heading,
                subtitleText: _rule.unlockApps.isEmpty
                    ? context.locale.focus_unlock_no_apps_selected
                    : context.locale
                        .focus_unlock_apps_selected(_rule.unlockApps.length),
                trailing: const Icon(FluentIcons.chevron_right_20_regular),
                onPressed: () => _pickApps(isSourceApps: false),
              ).sliver,

              /// Schedule
              ContentSectionHeader(
                title: context.locale.focus_unlock_schedule_heading,
              ).sliver,
              RoundedContainer(
                borderRadius: getBorderRadiusFromPosition(ItemPosition.none),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TimePeriodStartEndCards(
                      use24HourFormat: true,
                      startHeroTag: HeroTags.focusUnlockStartTimeTag(_rule.id),
                      endHeroTag: HeroTags.focusUnlockEndTimeTag(_rule.id),
                      startTime: _rule.scheduleStartTime,
                      endTime: _rule.scheduleEndTime,
                      onStartTimeChanged: (start) => _changeSchedule(
                        start: start,
                        end: _rule.scheduleEndTime,
                      ),
                      onEndTimeChanged: (end) => _changeSchedule(
                        start: _rule.scheduleStartTime,
                        end: end,
                      ),
                    ),
                    16.vBox,

                    /// Schedule duration
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Theme.of(context).focusColor),
                        ),
                        12.hBox,
                        StyledText(
                          _rule.scheduleDurationInMins > 0
                              ? _rule.scheduleDurationInMins.minutes
                                  .toTimeFull(context)
                              : context.locale.focus_unlock_schedule_all_day,
                        ),
                        12.hBox,
                        Expanded(
                          child: Divider(color: Theme.of(context).focusColor),
                        ),
                      ],
                    ),
                    24.vBox,

                    /// Active days
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        7,
                        (index) => Expanded(
                          child: RoundedContainer(
                            circularRadius: 200,
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: _rule.scheduleDays[index]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            onPressed: () => _toggleDay(index),
                            child: StyledText(
                              AppConstants.daysShort(context)[index],
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              color: _rule.scheduleDays[index]
                                  ? Theme.of(context).colorScheme.surface
                                  : null,
                            ).centered,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).sliver,

              const SliverTabsBottomPadding(),
            ],
          ),
        ),
      ],
    );
  }

  void _changeSchedule({
    required TimeOfDayAdapter start,
    required TimeOfDayAdapter end,
  }) =>
      setState(
        () => _rule = _rule.copyWith(
          scheduleStartTime: start,
          scheduleEndTime: end,
          scheduleDurationInMins: end.difference(start).inMinutes,
        ),
      );

  void _toggleDay(int index) {
    final days = List.of(_rule.scheduleDays);
    days[index] = !days[index];
    setState(() => _rule = _rule.copyWith(scheduleDays: days));
  }

  void _pickApps({required bool isSourceApps}) async {
    final selected = await showAppSelectionSheet(
      context: context,
      title: isSourceApps
          ? context.locale.focus_unlock_source_apps_heading
          : context.locale.focus_unlock_reward_apps_heading,
      info: isSourceApps
          ? context.locale.focus_unlock_source_apps_info
          : context.locale.focus_unlock_reward_apps_info,
      selectedApps: isSourceApps ? _rule.sourceApps : _rule.unlockApps,

      /// An app cannot be on both sides of the same rule
      hiddenApps: isSourceApps ? _rule.unlockApps : _rule.sourceApps,

      /// Reels/shorts have no screen time of their own, so they can only be
      /// locked, not used to earn time
      allowVirtualApps: !isSourceApps,
    );

    if (selected == null || !mounted) return;

    setState(
      () => _rule = isSourceApps
          ? _rule.copyWith(sourceApps: selected)
          : _rule.copyWith(unlockApps: selected),
    );
  }

  void _saveSession() async {
    if (_rule.sourceApps.isEmpty || _rule.unlockApps.isEmpty) {
      context.showSnackAlert(context.locale.focus_unlock_no_apps_snack);
      return;
    }

    if (_rule.requiredTimeSec <= 0) {
      context.showSnackAlert(context.locale.focus_unlock_no_timer_snack);
      return;
    }

    if (!_rule.scheduleDays.contains(true)) {
      context.showSnackAlert(context.locale.focus_unlock_no_days_snack);
      return;
    }

    final notifier = ref.read(focusUnlockRulesProvider.notifier);
    _isEditing
        ? await notifier.updateRule(_rule)
        : await notifier.createRule(_rule);

    if (mounted) Navigator.of(context).pop();
  }
}
