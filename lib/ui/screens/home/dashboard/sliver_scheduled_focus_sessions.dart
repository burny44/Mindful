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
import 'package:mindful/providers/focus/scheduled_focus_session_provider.dart';
import 'package:mindful/ui/common/content_section_header.dart';
import 'package:mindful/ui/screens/focus/scheduled_focus_session_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverScheduledFocusSessions extends ConsumerWidget {
  const SliverScheduledFocusSessions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(scheduledFocusSessionsProvider);
    if (sessions.isEmpty) return const SliverToBoxAdapter();

    return MultiSliver(
      children: [
        ContentSectionHeader(
          title: context.locale.new_session_sessions_heading,
        ),
        SliverList.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) => ScheduledFocusSessionCard(
            session: sessions[index],
            position: getItemPositionInList(index, sessions.length),
          ),
        ),
      ],
    );
  }
}
