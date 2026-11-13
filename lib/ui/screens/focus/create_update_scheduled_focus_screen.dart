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
import 'package:mindful/models/scheduled_focus_session.dart';
import 'package:mindful/providers/focus/scheduled_focus_session_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/common/default_fab_button.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/rounded_container.dart';
import 'package:mindful/ui/common/scaffold_shell.dart';
import 'package:mindful/ui/common/sliver_tabs_bottom_padding.dart';
import 'package:mindful/ui/common/styled_text.dart';
import 'package:mindful/ui/common/time_period_start_end_cards.dart';
import 'package:mindful/ui/dialogs/app_launch_limit_dialog.dart';
import 'package:mindful/ui/dialogs/app_selection_sheet.dart';
import 'package:mindful/ui/dialogs/input_field_dialog.dart';
import 'package:mindful/ui/dialogs/timer_picker_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';

/// Creates or edits a scheduled focus session.
class CreateUpdateScheduledFocusScreen extends ConsumerStatefulWidget {
  const CreateUpdateScheduledFocusScreen({super.key, this.session});

  final ScheduledFocusSession? session;

  @override
  ConsumerState<CreateUpdateScheduledFocusScreen> createState() =>
      _CreateUpdateScheduledFocusScreenState();
}

class _CreateUpdateScheduledFocusScreenState
    extends ConsumerState<CreateUpdateScheduledFocusScreen> {
  ScheduledFocusSession _session = const ScheduledFocusSession(name: "Focus");

  bool get _isEditing => widget.session != null;
  bool get _isLocked => widget.session?.isStrictLocked == true;

  @override
  void initState() {
    super.initState();
    _session = widget.session ?? _session;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldShell(
      items: [
        NavbarItem(
          icon: FluentIcons.target_arrow_20_regular,
          filledIcon: FluentIcons.target_arrow_20_filled,
          titleText: _session.name.isEmpty
              ? context.locale.new_session_screen_title
              : _session.name,
          fab: _isLocked
              ? null
              : DefaultFabButton(
                  heroTag: _isEditing
                      ? HeroTags.scheduledFocusSaveTag(_session.id)
                      : null,
                  icon: _isEditing
                      ? FluentIcons.arrow_upload_20_filled
                      : FluentIcons.save_20_filled,
                  label: context.locale.new_session_save_button,
                  onPressed: _saveSession,
                ),
          sliverBody: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              StyledText(
                context.locale.new_session_info,
                color: Theme.of(context).hintColor,
              ).sliver,
              12.vSliverBox,

              if (_isLocked) ...[
                DefaultListTile(
                  position: ItemPosition.none,
                  leadingIcon: FluentIcons.lock_closed_20_regular,
                  titleText: context.locale.new_session_strict_badge,
                  subtitleText: context.locale.new_session_strict_locked_snack,
                  accent: Theme.of(context).colorScheme.error,
                ).sliver,
                8.vSliverBox,
              ],

              /// Name
              DefaultHero(
                tag: HeroTags.scheduledFocusNameTag(_session.id),
                child: DefaultListTile(
                  position: ItemPosition.top,
                  enabled: !_isLocked,
                  leadingIcon: FluentIcons.text_field_20_regular,
                  titleText: context.locale.new_session_name_tile_title,
                  subtitleText: _session.name,
                  onPressed: () => showScheduledFocusNameInputDialog(
                    context: context,
                    heroTag: HeroTags.scheduledFocusNameTag(_session.id),
                    initialText: _session.name,
                  ).then((name) {
                    if (name == null || name.isEmpty) return;
                    setState(() => _session = _session.copyWith(name: name));
                  }),
                ),
              ).sliver,

              /// Apps
              DefaultListTile(
                position: ItemPosition.bottom,
                enabled: !_isLocked,
                leadingIcon: FluentIcons.apps_20_regular,
                titleText: context.locale.new_session_apps_heading,
                subtitleText: _session.distractingApps.isEmpty
                    ? context.locale.new_session_no_apps_selected
                    : context.locale.new_session_apps_selected(
                        _session.distractingApps.length,
                      ),
                trailing: const Icon(FluentIcons.chevron_right_20_regular),
                onPressed: _pickApps,
              ).sliver,

              /// Schedule
              ContentSectionHeader(
                title: context.locale.new_session_schedule_heading,
              ).sliver,
              RoundedContainer(
                borderRadius: getBorderRadiusFromPosition(ItemPosition.none),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TimePeriodStartEndCards(
                      enabled: !_isLocked,
                      use24HourFormat: true,
                      startHeroTag:
                          HeroTags.scheduledFocusStartTimeTag(_session.id),
                      endHeroTag:
                          HeroTags.scheduledFocusEndTimeTag(_session.id),
                      startTime: _session.scheduleStartTime,
                      endTime: _session.scheduleEndTime,
                      onStartTimeChanged: (start) => _changeSchedule(
                        start: start,
                        end: _session.scheduleEndTime,
                      ),
                      onEndTimeChanged: (end) => _changeSchedule(
                        start: _session.scheduleStartTime,
                        end: end,
                      ),
                    ),
                    16.vBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: Theme.of(context).focusColor),
                        ),
                        12.hBox,
                        StyledText(
                          _session.scheduleDurationInMins > 0
                              ? _session.scheduleDurationInMins.minutes
                                  .toTimeFull(context)
                              : context.locale.new_session_schedule_all_day,
                        ),
                        12.hBox,
                        Expanded(
                          child: Divider(color: Theme.of(context).focusColor),
                        ),
                      ],
                    ),
                    24.vBox,
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
                            color: _session.scheduleDays[index]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            onPressed:
                                _isLocked ? null : () => _toggleDay(index),
                            child: StyledText(
                              AppConstants.daysShort(context)[index],
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              color: _session.scheduleDays[index]
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

              /// Breaks
              ContentSectionHeader(
                title: context.locale.new_session_breaks_heading,
              ).sliver,
              DefaultListTile(
                position: ItemPosition.top,
                enabled: !_isLocked,
                leadingIcon: FluentIcons.drink_coffee_20_regular,
                titleText: context.locale.new_session_breaks_tile_title,
                subtitleText: context.locale.new_session_breaks_tile_subtitle,
                switchValue: _session.breaksEnabled,
                onPressed: () => setState(
                  () => _session = _session.copyWith(
                    breaksEnabled: !_session.breaksEnabled,
                  ),
                ),
              ).sliver,

              if (_session.breaksEnabled) ...[
                DefaultHero(
                  tag: HeroTags.scheduledFocusBreakCountTag(_session.id),
                  child: DefaultListTile(
                    position: ItemPosition.mid,
                    enabled: !_isLocked,
                    leadingIcon: FluentIcons.number_symbol_20_regular,
                    titleText: context.locale.new_session_breaks_count_title,
                    subtitleText: "${_session.numberOfBreaks}",
                    onPressed: () => showCountPickerDialog(
                      context: context,
                      heroTag:
                          HeroTags.scheduledFocusBreakCountTag(_session.id),
                      title: context.locale.new_session_breaks_count_title,
                      initialCount: _session.numberOfBreaks,
                    ).then((count) {
                      if (count == null) return;
                      setState(
                        () =>
                            _session = _session.copyWith(numberOfBreaks: count),
                      );
                    }),
                  ),
                ).sliver,
                DefaultHero(
                  tag: HeroTags.scheduledFocusBreakDurationTag(_session.id),
                  child: DefaultListTile(
                    position: ItemPosition.mid,
                    enabled: !_isLocked,
                    leadingIcon: FluentIcons.timer_20_regular,
                    titleText: context.locale.new_session_break_duration_title,
                    subtitleText: _session.breakDurationSec.seconds
                        .toTimeFull(context, replaceCommaWithAnd: true),
                    onPressed: () => showScheduledFocusDurationPicker(
                      context: context,
                      heroTag:
                          HeroTags.scheduledFocusBreakDurationTag(_session.id),
                      title: context.locale.new_session_break_duration_title,
                      info: context.locale.new_session_break_duration_info,
                      initialTime: _session.breakDurationSec,
                    ).then((time) {
                      if (time == null || time <= 0) return;
                      setState(
                        () => _session =
                            _session.copyWith(breakDurationSec: time),
                      );
                    }),
                  ),
                ).sliver,
                DefaultHero(
                  tag: HeroTags.scheduledFocusPauseTag(_session.id),
                  child: DefaultListTile(
                    position: ItemPosition.bottom,
                    enabled: !_isLocked,
                    leadingIcon: FluentIcons.clock_20_regular,
                    titleText: context.locale.new_session_pause_between_title,
                    subtitleText: _session.pauseBetweenBreaksSec.seconds
                        .toTimeFull(context, replaceCommaWithAnd: true),
                    onPressed: () => showScheduledFocusDurationPicker(
                      context: context,
                      heroTag: HeroTags.scheduledFocusPauseTag(_session.id),
                      title: context.locale.new_session_pause_between_title,
                      info: context.locale.new_session_pause_between_info,
                      initialTime: _session.pauseBetweenBreaksSec,
                    ).then((time) {
                      if (time == null || time < 0) return;
                      setState(
                        () => _session =
                            _session.copyWith(pauseBetweenBreaksSec: time),
                      );
                    }),
                  ),
                ).sliver,
              ],

              /// Strict — editable anytime the session is not currently active
              ContentSectionHeader(
                title: context.locale.new_session_strict_tile_title,
              ).sliver,
              DefaultListTile(
                position: ItemPosition.none,
                enabled: !_isLocked,
                leadingIcon: FluentIcons.shield_lock_20_regular,
                titleText: context.locale.new_session_strict_tile_title,
                subtitleText: context.locale.new_session_strict_tile_subtitle,
                switchValue: _session.isStrict,
                accent: _session.isStrict
                    ? Theme.of(context).colorScheme.error
                    : null,
                onPressed: () => setState(
                  () =>
                      _session = _session.copyWith(isStrict: !_session.isStrict),
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
        () => _session = _session.copyWith(
          scheduleStartTime: start,
          scheduleEndTime: end,
          scheduleDurationInMins: end.difference(start).inMinutes,
        ),
      );

  void _toggleDay(int index) {
    final days = List.of(_session.scheduleDays);
    days[index] = !days[index];
    setState(() => _session = _session.copyWith(scheduleDays: days));
  }

  void _pickApps() async {
    final selected = await showAppSelectionSheet(
      context: context,
      title: context.locale.new_session_apps_heading,
      info: context.locale.new_session_apps_info,
      selectedApps: _session.distractingApps,
    );
    if (selected == null || !mounted) return;
    setState(
      () => _session = _session.copyWith(distractingApps: selected),
    );
  }

  void _saveSession() async {
    if (_isLocked) {
      context.showSnackAlert(context.locale.new_session_strict_locked_snack);
      return;
    }

    if (_session.distractingApps.isEmpty) {
      context.showSnackAlert(context.locale.new_session_no_apps_snack);
      return;
    }

    if (!_session.scheduleDays.contains(true)) {
      context.showSnackAlert(context.locale.new_session_no_days_snack);
      return;
    }

    if (_session.breaksEnabled &&
        (_session.numberOfBreaks <= 0 ||
            _session.breakDurationSec <= 0 ||
            _session.pauseBetweenBreaksSec < 0)) {
      context.showSnackAlert(context.locale.new_session_breaks_invalid_snack);
      return;
    }

    final notifier = ref.read(scheduledFocusSessionsProvider.notifier);
    if (_isEditing) {
      final ok = await notifier.updateSession(_session);
      if (!ok && mounted) {
        context.showSnackAlert(context.locale.new_session_strict_locked_snack);
        return;
      }
    } else {
      await notifier.createSession(_session);
    }

    if (mounted) Navigator.of(context).pop();
  }
}
