/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindful/core/extensions/ext_build_context.dart';
import 'package:mindful/core/utils/widget_utils.dart';
import 'package:mindful/providers/focus/focus_unlock_rule_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/screens/focus/focus_unlock_rule_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Lists the saved earn-unlock sessions on the dashboard.
class SliverFocusUnlockRules extends ConsumerWidget {
  const SliverFocusUnlockRules({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rules = ref.watch(focusUnlockRulesProvider);

    if (rules.isEmpty) return const SliverToBoxAdapter();

    return MultiSliver(
      children: [
        ContentSectionHeader(
          title: context.locale.focus_unlock_sessions_heading,
        ),
        SliverList.builder(
          itemCount: rules.length,
          itemBuilder: (context, index) => FocusUnlockRuleCard(
            rule: rules[index],
            position: getItemPositionInList(index, rules.length),
          ),
        ),
      ],
    );
  }
}
