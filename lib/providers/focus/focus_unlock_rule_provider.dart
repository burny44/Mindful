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
import 'package:mindful/models/focus_unlock_rule.dart';

/// Manages the list of saved earn-unlock sessions.
final focusUnlockRulesProvider =
    StateNotifierProvider<FocusUnlockRulesNotifier, List<FocusUnlockRule>>(
  (ref) => FocusUnlockRulesNotifier(),
);

class FocusUnlockRulesNotifier extends StateNotifier<List<FocusUnlockRule>> {
  FocusUnlockRulesNotifier() : super(const []) {
    _init();
  }

  void _init() async {
    state = await FocusUnlockRuleStore.load();
    await _sync();

    addListener(
      fireImmediately: false,
      (state) => FocusUnlockRuleStore.save(state),
    );
  }

  /// Only rules which can actually block something are pushed to the service.
  Future<void> _sync() => MethodChannelService.instance
      .updateFocusUnlockRules(state.where((e) => e.isValid).toList());

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
