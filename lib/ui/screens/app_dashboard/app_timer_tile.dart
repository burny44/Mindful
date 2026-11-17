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
import 'package:mindful/core/enums/item_position.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/extensions/ext_duration.dart';
import 'package:mindful/config/hero_tags.dart';
import 'package:mindful/models/app_info.dart';
import 'package:mindful/providers/restrictions/apps_restrictions_provider.dart';
import 'package:mindful/providers/restrictions/strict_app_timers_provider.dart';
import 'package:mindful/providers/usage/todays_apps_usage_provider.dart';
import 'package:mindful/ui/common/default_list_tile.dart';
import 'package:mindful/ui/common/time_text_short.dart';
import 'package:mindful/ui/dialogs/timer_picker_dialog.dart';
import 'package:mindful/ui/transitions/default_hero.dart';

class AppTimerTile extends ConsumerWidget {
  const AppTimerTile({
    required this.appInfo,
    required this.appTimer,
    required this.isPurged,
    this.isIconButton = false,
    super.key,
  });

  final AppInfo appInfo;
  final int appTimer;
  final bool isPurged;
  final bool isIconButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLocked = ref.watch(isAppTimerLockedProvider(
      (package: appInfo.packageName, timerSec: appTimer),
    ));

    return isIconButton
        ? IconButton(
            icon: appTimer > 0
                ? TimeTextShort(timeDuration: appTimer.seconds)
                : const Icon(FluentIcons.timer_20_regular),
            onPressed: () => _pickAppTimer(context, ref),
          )
        : DefaultHero(
            tag: HeroTags.appTimerTileTag(appInfo.packageName),
            child: DefaultListTile(
              position: ItemPosition.top,
              titleText: context.locale.app_timer_tile_title,
              enabled: !appInfo.isImpSysApp,
              subtitleText: appTimer > 0
                  ? appTimer.seconds.toTimeFull(context)
                  : context.locale.app_limit_status_not_set,
              leadingIcon: FluentIcons.timer_20_regular,
              accent: isPurged ? Theme.of(context).colorScheme.error : null,
              trailing: isLocked
                  ? Icon(
                      FluentIcons.lock_closed_20_regular,
                      color: Theme.of(context).hintColor,
                    )
                  : isPurged
                      ? Text(context.locale.timer_status_paused)
                      : null,
              onPressed: () => _pickAppTimer(context, ref),
            ),
          );
  }

  void _pickAppTimer(
    BuildContext context,
    WidgetRef ref,
  ) async {
    /// Strict limit already used up today: no changes until midnight
    final locked = await ref
        .read(strictAppTimersProvider.notifier)
        .isLockedNow(appInfo.packageName);
    if (!context.mounted) return;
    if (locked) {
      context.showSnackAlert(context.locale.app_timer_strict_locked_snack);
      return;
    }

    final newTimer = await showAppTimerPicker(
      appInfo: appInfo,
      heroTag: isIconButton
          ? HeroTags.applicationTileTag(appInfo.packageName)
          : HeroTags.appTimerTileTag(appInfo.packageName),
      context: context,
      initialTime: appTimer,
    );

    if (newTimer == null || newTimer == appTimer) return;
    ref
        .read(appsRestrictionsProvider.notifier)
        .updateAppTimer(appInfo.packageName, newTimer);
  }
}

/// Whether the app's strict timer looks used up based on the loaded usage.
/// Only for display, edits are checked with fresh data by
/// [StrictAppTimersNotifier.isLockedNow].
final isAppTimerLockedProvider =
    Provider.autoDispose.family<bool, ({String package, int timerSec})>(
  (ref, arg) {
    if (arg.timerSec <= 0) return false;
    final isStrict = ref.watch(
      strictAppTimersProvider.select((v) => v.contains(arg.package)),
    );
    if (!isStrict) return false;

    final usedSec = ref.watch(todaysAppsUsageProvider
            .select((v) => v.value?[arg.package]?.screenTime)) ??
        0;
    return usedSec >= arg.timerSec;
  },
);
