/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/services/app_group_store.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/models/app_group.dart';
import 'package:mindful/providers/focus/focus_unlock_rule_provider.dart';
import 'package:mindful/providers/focus/scheduled_focus_session_provider.dart';

/// Manages the user's app groups.
///
/// Sessions and earn-unlock rules listen to this provider and re-sync with the
/// native service whenever a group changes, so editing a group updates every
/// session which uses it.
final appGroupsProvider =
    StateNotifierProvider<AppGroupsNotifier, List<AppGroup>>(
  (ref) => AppGroupsNotifier(ref),
);

class AppGroupsNotifier extends StateNotifier<List<AppGroup>> {
  AppGroupsNotifier(this._ref) : super(const []) {
    _init();
  }

  final Ref _ref;
  final Completer<void> _loaded = Completer<void>();

  /// Completes once the saved groups are loaded from storage.
  Future<void> get ready => _loaded.future;

  void _init() async {
    state = await AppGroupStore.load();
    _loaded.complete();

    addListener(
      fireImmediately: false,
      (state) => AppGroupStore.save(state),
    );
  }

  /// A group cannot change while a strict session which uses it is active,
  /// otherwise strict mode could be bypassed by editing the group.
  bool isLocked(int groupId) {
    final target = FocusTargets.groupTarget(groupId);
    return _ref
        .read(scheduledFocusSessionsProvider)
        .any((s) => s.isStrictLocked && s.distractingApps.contains(target));
  }

  Future<AppGroup> createGroup(AppGroup group) async {
    await ready;
    final newGroup = group.copyWith(id: DateTime.now().millisecondsSinceEpoch);
    state = [...state, newGroup];
    return newGroup;
  }

  Future<bool> updateGroup(AppGroup group) async {
    if (isLocked(group.id)) return false;
    state = [...state.map((e) => e.id == group.id ? group : e)];
    return true;
  }

  Future<bool> removeGroup(AppGroup group) async {
    if (isLocked(group.id)) return false;

    final target = FocusTargets.groupTarget(group.id);
    state = [...state.where((e) => e.id != group.id)];

    /// Drop the dangling references
    await _ref
        .read(scheduledFocusSessionsProvider.notifier)
        .removeTarget(target);
    await _ref.read(focusUnlockRulesProvider.notifier).removeTarget(target);
    return true;
  }
}
