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
import 'package:mindful/models/scheduled_focus_session.dart';

/// Manages the list of saved scheduled focus sessions.
final scheduledFocusSessionsProvider = StateNotifierProvider<
    ScheduledFocusSessionsNotifier, List<ScheduledFocusSession>>(
  (ref) => ScheduledFocusSessionsNotifier(),
);

class ScheduledFocusSessionsNotifier
    extends StateNotifier<List<ScheduledFocusSession>> {
  ScheduledFocusSessionsNotifier() : super(const []) {
    _init();
  }

  void _init() async {
    state = await ScheduledFocusSessionStore.load();
    await _sync();

    addListener(
      fireImmediately: false,
      (state) => ScheduledFocusSessionStore.save(state),
    );
  }

  Future<void> _sync() => MethodChannelService.instance
      .updateScheduledFocusSessions(state.where((e) => e.isValid).toList());

  Future<ScheduledFocusSession> createSession(ScheduledFocusSession session) async {
    final newSession = session.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );

    state = [...state, newSession];
    await _sync();
    return newSession;
  }

  Future<bool> updateSession(ScheduledFocusSession session) async {
    final existing = state.where((e) => e.id == session.id).firstOrNull;
    if (existing?.isStrict == true) return false;

    state = [...state.map((e) => e.id == session.id ? session : e)];
    await _sync();
    return true;
  }

  Future<bool> removeSession(ScheduledFocusSession session) async {
    if (session.isStrict) return false;

    state = [...state.where((e) => e.id != session.id)];
    await _sync();
    return true;
  }
}
