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
import 'package:mindful/core/enums/usage_type.dart';
import 'package:mindful/core/utils/focus_targets.dart';
import 'package:mindful/models/app_info.dart';
import 'package:mindful/models/usage_filter_model.dart';
import 'package:mindful/providers/apps/apps_info_provider.dart';
import 'package:mindful/providers/usage/dated_apps_usage_provider.dart';

/// A provider that filters and sorts app packages based on [UsageFilterModel]
final filteredPackagesProvider =
    Provider.family<AsyncValue<List<String>>, UsageFilterModel>((ref, filter) {
  /// Watch app's usage for selected day
  final appsUsage =
      ref.watch(appsUsageProvider(filter.selectedDay)).value ?? {};

  // Watch the app infos provider
  return ref.watch(appsInfoProvider).when(
        loading: () => const AsyncLoading(),
        error: (e, st) => AsyncError(e, st),
        data: (appsMap) {
          /// Create list of apps from the map with searching.
          /// Reels / Shorts are listed as their own apps (screen time only).
          var apps = [
            ...appsMap.values,
            if (filter.usageType != UsageType.networkUsage)
              for (final target in FocusTargets.virtualApps)
                AppInfo.placeHolder(target).copyWithName(
                  _virtualAppNames[target] ?? target,
                ),
          ];

          /// Filter by query
          if (filter.query.isNotEmpty) {
            apps.removeWhere(
              (e) => !e.name.toLowerCase().contains(filter.query.toLowerCase()),
            );
          }

          /// Filter out apps with no usage for the selected day
          /// (searching always looks through every app)
          final isSearching = filter.query.isNotEmpty;
          if (!filter.includeAll && !isSearching) {
            switch (filter.usageType) {
              case UsageType.screenUsage:
                apps.removeWhere(
                  (e) => ((appsUsage[e.packageName]?.screenTime ?? 0) == 0),
                );
                break;
              case UsageType.networkUsage:
                apps.removeWhere(
                  (e) => ((appsUsage[e.packageName]?.totalData ?? 0) == 0),
                );
                break;
              default:
            }
          }

          /// Repopulate list if empty after filtering (avoid empty result)
          if (apps.isEmpty && !isSearching) apps = appsMap.values.toList();

          /// Never show Reels / Shorts without any watch time
          apps.removeWhere(
            (e) =>
                FocusTargets.isVirtualApp(e.packageName) &&
                (appsUsage[e.packageName]?.screenTime ?? 0) == 0,
          );

          /// If alphabetically is true the sort alphabetically,
          /// otherwise Sort apps based on usage  (descending)
          switch (filter.usageType) {
            case UsageType.alphabetic:
              apps.sort((a, b) => a.name.compareTo(b.name));
              break;
            case UsageType.screenUsage:
              apps.sort(
                (a, b) => (appsUsage[b.packageName]?.screenTime ?? 0)
                    .compareTo(appsUsage[a.packageName]?.screenTime ?? 0),
              );
              break;
            case UsageType.networkUsage:
              apps.sort(
                (a, b) => (appsUsage[b.packageName]?.totalData ?? 0)
                    .compareTo(appsUsage[a.packageName]?.totalData ?? 0),
              );
              break;
          }

          /// Reverse if needed
          if (filter.reverse) {
            apps = apps.reversed.toList();
          }

          /// Map the sorted apps to a list of package names
          return AsyncData(apps.map((e) => e.packageName).toList());
        },
      );
});

/// Names used for searching and sorting Reels / Shorts in the list
/// (the tiles show the localized names).
const _virtualAppNames = {
  FocusTargets.instagramReels: "Instagram Reels",
  FocusTargets.youtubeShorts: "YouTube Shorts",
};
