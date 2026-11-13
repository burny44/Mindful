// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_records_dao.dart';

// ignore_for_file: type=lint
mixin _$DynamicRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppRestrictionTableTable get appRestrictionTable =>
      attachedDatabase.appRestrictionTable;
  $CrashLogsTableTable get crashLogsTable => attachedDatabase.crashLogsTable;
  $AppUsageTableTable get appUsageTable => attachedDatabase.appUsageTable;
  $NotificationsTableTable get notificationsTable =>
      attachedDatabase.notificationsTable;
  DynamicRecordsDaoManager get managers => DynamicRecordsDaoManager(this);
}

class DynamicRecordsDaoManager {
  final _$DynamicRecordsDaoMixin _db;
  DynamicRecordsDaoManager(this._db);
  $$AppRestrictionTableTableTableManager get appRestrictionTable =>
      $$AppRestrictionTableTableTableManager(
          _db.attachedDatabase, _db.appRestrictionTable);
  $$CrashLogsTableTableTableManager get crashLogsTable =>
      $$CrashLogsTableTableTableManager(
          _db.attachedDatabase, _db.crashLogsTable);
  $$AppUsageTableTableTableManager get appUsageTable =>
      $$AppUsageTableTableTableManager(_db.attachedDatabase, _db.appUsageTable);
  $$NotificationsTableTableTableManager get notificationsTable =>
      $$NotificationsTableTableTableManager(
          _db.attachedDatabase, _db.notificationsTable);
}
