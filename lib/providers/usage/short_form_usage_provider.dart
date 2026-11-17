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
import 'package:mindful/core/extensions/ext_date_time.dart';
import 'package:mindful/core/services/method_channel_service.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/core/utils/date_time_utils.dart';
import 'package:mindful/models/usage_model.dart';
import 'package:mindful/providers/usage/todays_apps_usage_provider.dart';

/// Instagram Reels / YouTube Shorts watch time for the given day, keyed by the
/// virtual app id (see [FocusTargets]). Only screen time is set.
///
/// Today's value refreshes together with [todaysAppsUsageProvider].
final shortFormUsageProvider =
    FutureProvider.family<Map<String, UsageModel>, DateTime>(
  (ref, day) async {
    final date = day.dateOnly;
    if (date == dateToday) ref.watch(todaysAppsUsageProvider);

    final usage = await MethodChannelService.instance.getShortFormUsage(
      start: date,
      end: date,
    );

    /// Only Reels / Shorts, the native side also keeps other short content
    /// time for the shared allowance
    return {
      for (final e in (usage[date] ?? const <String, int>{}).entries)
        if (FocusTargets.isVirtualApp(e.key))
          e.key: UsageModel(screenTime: e.value),
    };
  },
);
