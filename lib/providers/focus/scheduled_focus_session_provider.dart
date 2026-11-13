/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/services/method_channel_service.dart';
import 'package:mindful/core/services/scheduled_focus_session_store.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/models/scheduled_focus_session.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';

/// Manages the list of saved scheduled focus sessions.
final scheduledFocusSessionsProvider = StateNotifierProvider<
    ScheduledFocusSessionsNotifier, List<ScheduledFocusSession>>(
  (ref) {
    final notifier = ScheduledFocusSessionsNotifier(ref);

    /// Group members changed, so the expanded app lists changed too
    ref.listen(appGroupsProvider, (_, __) => notifier.resync());
    return notifier;
  },
);

class ScheduledFocusSessionsNotifier
    extends StateNotifier<List<ScheduledFocusSession>> {
  ScheduledFocusSessionsNotifier(this._ref) : super(const []) {
    _init();
  }

  final Ref _ref;
  bool _isLoaded = false;

  void _init() async {
    state = await ScheduledFocusSessionStore.load();

    /// Groups must be known before the first sync, otherwise sessions using
    /// only groups would be pushed as empty.
    await _ref.read(appGroupsProvider.notifier).ready;
    _isLoaded = true;
    await _sync();

    addListener(
      fireImmediately: false,
      (state) => ScheduledFocusSessionStore.save(state),
    );
  }

  /// Pushes the sessions to the native service with groups expanded into
  /// their member apps.
  Future<void> _sync() async {
    if (!_isLoaded) return;
    final groups = _ref.read(appGroupsProvider);

    await MethodChannelService.instance.updateScheduledFocusSessions(
      state
          .map(
            (e) => e.copyWith(
              distractingApps: FocusTargets.expand(e.distractingApps, groups),
            ),
          )
          .where((e) => e.isValid)
          .toList(),
    );
  }

  Future<void> resync() => _sync();

  /// Removes [target] (e.g. a deleted group) from every session.
  Future<void> removeTarget(String target) async {
    state = [
      ...state.map(
        (e) => e.distractingApps.contains(target)
            ? e.copyWith(
                distractingApps: [
                  ...e.distractingApps.where((t) => t != target),
                ],
              )
            : e,
      ),
    ];
    await _sync();
  }

  Future<ScheduledFocusSession> createSession(
      ScheduledFocusSession session) async {
    final newSession = session.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );

    state = [...state, newSession];
    await _sync();
    return newSession;
  }

  Future<bool> updateSession(ScheduledFocusSession session) async {
    final existing = state.where((e) => e.id == session.id).firstOrNull;
    if (existing?.isStrictLocked == true) return false;

    state = [...state.map((e) => e.id == session.id ? session : e)];
    await _sync();
    return true;
  }

  Future<bool> removeSession(ScheduledFocusSession session) async {
    if (session.isStrictLocked) return false;

    state = [...state.where((e) => e.id != session.id)];
    await _sync();
    return true;
  }
}
