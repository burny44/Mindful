import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mindful/core/services/drift_db_service.dart';
import 'package:mindful/core/utils/date_time_utils.dart';
import 'package:mindful/models/usage_model.dart';
import 'package:mindful/providers/usage/short_form_usage_provider.dart';
import 'package:mindful/providers/usage/todays_apps_usage_provider.dart';

/// A future provider that manages a map of Package and its usage for the selected day.
///
/// Also contains Instagram Reels / YouTube Shorts as separate (virtual) apps.
/// Their time is already part of Instagram / YouTube, so never sum this map
/// for device totals.
final appsUsageProvider =
    FutureProvider.family<Map<String, UsageModel>, DateTime>(
  (ref, selectedDay) async {
    final apps = selectedDay == dateToday
        ? ref.watch(todaysAppsUsageProvider).value ?? {}
        : await DriftDbService.instance.driftDb.dynamicRecordsDao
            .fetchDatedAppsUsage(selectedDay: selectedDay);

    final shortForm =
        await ref.watch(shortFormUsageProvider(selectedDay).future);

    return {...apps, ...shortForm};
  },
);
