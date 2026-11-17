/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar/Mindful)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/services/method_channel_service.dart';
import 'package:mindful/core/services/strict_app_timer_store.dart';
import 'package:mindful/core/utils/date_time_utils.dart';
import 'package:mindful/providers/restrictions/apps_restrictions_provider.dart';

/// Packages whose app timer is strict: once today's usage reaches the timer,
/// the timer (and the strict flag) can't be changed until the timer resets
/// at midnight.
final strictAppTimersProvider =
    StateNotifierProvider<StrictAppTimersNotifier, Set<String>>(
  (ref) => StrictAppTimersNotifier(ref),
);

class StrictAppTimersNotifier extends StateNotifier<Set<String>> {
  StrictAppTimersNotifier(this._ref) : super(const {}) {
    _init();
  }

  final Ref _ref;

  Future<void> _init() async {
    final loaded = await StrictAppTimerStore.load();
    if (mounted) state = loaded;
  }

  /// Returns `true` if the app's timer is strict and today's limit is already
  /// used up, so it must not be changed. Always uses fresh usage data (also
  /// for apps excluded from statistics) so the lock can't be skipped.
  Future<bool> isLockedNow(String package) async {
    if (!state.contains(package)) return false;

    final timerSec =
        _ref.read(appsRestrictionsProvider)[package]?.timerSec ?? 0;
    if (timerSec <= 0) return false;

    try {
      final usage = await MethodChannelService.instance
          .fetchAppsUsageForInterval(start: dateToday, end: DateTime.now());
      return (usage[package]?.screenTime ?? 0) >= timerSec;
    } catch (_) {
      /// Fail closed: if usage can't be read, keep the strict limit locked
      return true;
    }
  }

  /// Turns strict mode on/off. Turning it off is refused while locked.
  /// Returns `false` if the change was refused.
  Future<bool> setStrict(String package, bool strict) async {
    if (!strict && await isLockedNow(package)) return false;

    state = strict ? {...state, package} : ({...state}..remove(package));
    await StrictAppTimerStore.save(state);
    return true;
  }
}
