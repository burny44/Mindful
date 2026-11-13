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
import 'package:mindful/core/services/focus_unlock_rule_store.dart';
import 'package:mindful/core/services/method_channel_service.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/models/focus_unlock_rule.dart';
import 'package:mindful/providers/apps/app_groups_provider.dart';

/// Manages the list of saved earn-unlock sessions.
final focusUnlockRulesProvider =
    StateNotifierProvider<FocusUnlockRulesNotifier, List<FocusUnlockRule>>(
  (ref) {
    final notifier = FocusUnlockRulesNotifier(ref);

    /// Group members changed, so the expanded app lists changed too
    ref.listen(appGroupsProvider, (_, __) => notifier.resync());
    return notifier;
  },
);

class FocusUnlockRulesNotifier extends StateNotifier<List<FocusUnlockRule>> {
  FocusUnlockRulesNotifier(this._ref) : super(const []) {
    _init();
  }

  final Ref _ref;
  bool _isLoaded = false;

  void _init() async {
    state = await FocusUnlockRuleStore.load();

    /// Groups must be known before the first sync
    await _ref.read(appGroupsProvider.notifier).ready;
    _isLoaded = true;
    await _sync();

    addListener(
      fireImmediately: false,
      (state) => FocusUnlockRuleStore.save(state),
    );
  }

  /// Only rules which can actually block something are pushed to the service.
  /// Groups are expanded into their member apps first.
  Future<void> _sync() async {
    if (!_isLoaded) return;
    final groups = _ref.read(appGroupsProvider);

    await MethodChannelService.instance.updateFocusUnlockRules(
      state
          .map(
            (e) => e.copyWith(
              /// Virtual apps have no screen time of their own
              sourceApps: FocusTargets.expand(e.sourceApps, groups)
                  .where(FocusTargets.isApp)
                  .toList(),
              unlockApps: FocusTargets.expand(e.unlockApps, groups),
            ),
          )
          .where((e) => e.isValid)
          .toList(),
    );
  }

  Future<void> resync() => _sync();

  /// Removes [target] (e.g. a deleted group) from every rule.
  Future<void> removeTarget(String target) async {
    state = [
      ...state.map(
        (e) => e.copyWith(
          sourceApps: [...e.sourceApps.where((t) => t != target)],
          unlockApps: [...e.unlockApps.where((t) => t != target)],
        ),
      ),
    ];
    await _sync();
  }

  /// Saves a new session and returns it with its assigned id.
  Future<FocusUnlockRule> createRule(FocusUnlockRule rule) async {
    final newRule = rule.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );

    state = [...state, newRule];
    await _sync();
    return newRule;
  }

  Future<void> updateRule(FocusUnlockRule rule) async {
    state = [
      ...state.map((e) => e.id == rule.id ? rule : e),
    ];
    await _sync();
  }

  Future<void> removeRule(FocusUnlockRule rule) async {
    state = [...state.where((e) => e.id != rule.id)];
    await _sync();
  }
}
