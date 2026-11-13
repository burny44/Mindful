/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:drift/drift.dart';
import 'package:flutter/material.dart' as m;

import 'package:mindful/core/database/app_database.dart';
import 'package:mindful/core/database/tables/app_restriction_table.dart';
import 'package:mindful/core/database/tables/app_usage_table.dart';
import 'package:mindful/core/database/tables/crash_logs_table.dart';
import 'package:mindful/core/database/tables/notifications_table.dart';
import 'package:mindful/core/extensions/ext_date_time.dart';
import 'package:mindful/core/utils/provider_utils.dart';
import 'package:mindful/models/usage_model.dart';

part 'dynamic_records_dao.g.dart';

@DriftAccessor(
  tables: [
    AppRestrictionTable,
    CrashLogsTable,
    AppUsageTable,
    NotificationsTable,
  ],
)
class DynamicRecordsDao extends DatabaseAccessor<AppDatabase>
    with _$DynamicRecordsDaoMixin {
  DynamicRecordsDao(super.db);

  // ==================================================================================================================
  // ===================================== APP USAGE =======================================================
  // ==================================================================================================================

  /// Loads Map of [DateTime] and [UsageModel]  aggregated for the given interval
  /// Used to load and aggregated 7 days usage of all apps.
  ///
  /// returns (bool, Map<DateTime, UsageModel>) where the [bool] indicates if the
  /// database contains any usage records or not and [Map<DateTime, UsageModel>]
  /// contains one [UsageModel] for each day of week.
  Future<(bool, Map<DateTime, UsageModel>)> fetchWeeklyDeviceUsage({
    required m.DateTimeRange weekRange,
  }) async {
    // Initialize the Map with 7 days of the week
    final usageMap = generateEmptyWeekUsage(weekRange.start);

    // Query the database
    final results = await (select(appUsageTable)
          ..where(
              (e) => e.date.isBetweenValues(weekRange.start, weekRange.end)))
        .get();

    // Map the results
    for (var appUsage in results) {
      usageMap.update(
        appUsage.date,
        (v) => v + UsageModel.fromAppUsage(appUsage),
        ifAbsent: () => const UsageModel(),
      );
    }

    return (results.isNotEmpty, usageMap);
  }

  /// Loads Map of [String] package name and the respective [UsageModel] for the given date
  /// Used to load 1 day usage of all apps
  ///
  /// The result map contains one [UsageModel] per app for the selected day
  Future<Map<String, UsageModel>> fetchDatedAppsUsage({
    required DateTime selectedDay,
  }) async {
    // Query the database for selected day
    final result = await (select(appUsageTable)
          ..where((e) => e.date.isValue(selectedDay)))
        .get();

    /// Map results
    return Map.fromEntries(
        result.map((e) => MapEntry(e.packageName, UsageModel.fromAppUsage(e))));
  }

  /// Loads Map of [DateTime] and [UsageModel]  aggregated for the given interval
  /// Used to load and aggregated 7 days usage of [packageName]
  ///
  /// The result map contains one [UsageModel] for each day of week for the given app
  Future<Map<DateTime, UsageModel>> fetchWeeklyAppUsage({
    required String packageName,
    required m.DateTimeRange weekRange,
  }) async {
    // Initialize the Map with 7 days of the week
    final usageMap = generateEmptyWeekUsage(weekRange.start);

    // Query the database
    final results = await (select(appUsageTable)
          ..where(
            (e) =>
                e.date.isBetweenValues(weekRange.start, weekRange.end) &
                e.packageName.equals(packageName),
          ))
        .get();

    // Map the results
    for (var appUsage in results) {
      usageMap.update(
        appUsage.date,
        (v) => v + UsageModel.fromAppUsage(appUsage),
        ifAbsent: () => const UsageModel(),
      );
    }

    return usageMap;
  }

  /// Insert or Update list of multiple [AppUsageTableCompanion] objects to/in the database.
  Future<void> insertBatchAppUsages(
    List<AppUsageTableCompanion> usages,
  ) async =>
      batch(
        (batch) => batch.insertAll(
          appUsageTable,
          usages,
          mode: InsertMode.insertOrReplace,
        ),
      );

  /// Removes app usages from the database which have date before the provided date.
  Future<void> removeBatchAppUsagesBefore(DateTime date) async => batch(
        (batch) => batch.deleteWhere(
          appUsageTable,
          (tbl) => tbl.date.isSmallerThanValue(date),
        ),
      );

  // ==================================================================================================================
  // ===================================== APP RESTRICTIONS =======================================================
  // ==================================================================================================================

  /// Loads List of all [AppRestriction] objects from the database,
  Future<List<AppRestriction>> fetchAppsRestrictions() async =>
      select(appRestrictionTable).get();

  /// Insert or Update a [AppRestriction] object to/in the database.
  Future<void> insertAppRestrictionByPackage(
    AppRestriction restriction,
  ) async =>
      into(appRestrictionTable).insert(
        restriction,
        mode: InsertMode.insertOrReplace,
      );

  /// Insert or Update list of multiple [AppRestriction] objects to/in the database.
  Future<void> insertAppRestrictionsByPackage(
    List<AppRestriction> restrictions,
  ) async =>
      batch(
        (batch) => batch.insertAll(
          appRestrictionTable,
          restrictions,
          mode: InsertMode.insertOrReplace,
        ),
      );

  // ==================================================================================================================
  // ===================================== CRASH LOGS =================================================================
  // ==================================================================================================================

  /// Insert a [CrashLogs] object to the database.
  Future<void> insertCrashLog(CrashLogsTableCompanion log) async =>
      into(crashLogsTable).insert(
        log,
        mode: InsertMode.insertOrReplace,
      );

  /// Insert  multiple [CrashLogs] objects to the database.
  Future<void> insertCrashLogs(List<CrashLogsTableCompanion> logs) async =>
      batch(
        (batch) => batch.insertAll(
          crashLogsTable,
          logs,
          mode: InsertMode.insertOrReplace,
        ),
      );

  /// Insert a [CrashLog] object to the database.
  Future<void> removeCrashLogOlderThanDate(DateTime date) async =>
      await (delete(crashLogsTable)
            ..where((e) => e.timeStamp.isSmallerThanValue(date)))
          .go();

  /// Loads list of all [CrashLog] objects from the database,
  Future<List<CrashLog>> fetchCrashLogs() async => ((select(crashLogsTable))
        ..orderBy([(e) => OrderingTerm.desc(e.timeStamp)]))
      .get();

  /// Clear all [CrashLogs] objects from the database,
  Future<int> clearCrashLogs() async => delete(crashLogsTable).go();

  // ==================================================================================================================
  // ===================================== NOTIFICATIONS =============================================================
  // ==================================================================================================================

  /// Loads all [Notification] objects from the database within the interval.
  Future<List<Notification>> fetchAllNotificationsForInterval({
    required m.DateTimeRange range,
  }) async {
    final query = select(notificationsTable)
      ..where((tbl) => tbl.timeStamp.isBetweenValues(range.start, range.end))
      ..orderBy([
        (e) => OrderingTerm.desc(e.timeStamp),
        (e) => OrderingTerm.desc(e.isRead),
      ]);

    return query.get();
  }

  /// Loads all [Notification] objects from the database which contains the
  /// provided query in it's title or content.
  Future<List<Notification>> searchNotificationsWithQuery({
    required String query,
  }) async =>
      (select(notificationsTable)
            ..where(
              (tbl) =>
                  tbl.title.lower().like('%${query.toLowerCase()}%') |
                  tbl.content.lower().like('%${query.toLowerCase()}%'),
            ))
          .get();

  /// Fetch the count of notifications for the provided interval
  Future<Map<DateTime, int>> fetchNotificationsCountForInterval(
    DateTime start,
    DateTime end,
  ) async {
    // Fetch only necessary columns
    final results = await (selectOnly(notificationsTable)
          ..where(notificationsTable.timeStamp.isBetweenValues(start, end))
          ..addColumns([notificationsTable.timeStamp]))
        .get();

    // Use fold to build the map
    final countsMap = results.fold<Map<DateTime, int>>({}, (map, row) {
      final timeStamp = row.read(notificationsTable.timeStamp);

      if (timeStamp != null) {
        final day = timeStamp.dateOnly;
        map[day] = (map[day] ?? 0) + 1;
      }

      return map;
    });

    return countsMap;
  }

  /// Mark all notifications with the provided IDs as read.
  Future<int> markNotificationsAsRead(List<int> ids) =>
      (update(notificationsTable)..where((tbl) => tbl.id.isIn(ids)))
          .write(const NotificationsTableCompanion(isRead: Value(true)));

  /// Delete notifications with the provided ID.
  /// Returns number of deleted notifications.
  Future<int> removeNotificationWithId(int id) =>
      (delete(notificationsTable)..where((tbl) => tbl.id.equals(id))).go();

  /// Removes notifications from the database which have date before the provided date.
  Future<void> removeBatchNotificationsBefore(DateTime date) async => batch(
        (batch) => batch.deleteWhere(
          notificationsTable,
          (tbl) => tbl.timeStamp.isSmallerThanValue(date),
        ),
      );
}
