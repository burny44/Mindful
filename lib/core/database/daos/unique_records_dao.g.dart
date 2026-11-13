// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_records_dao.dart';

// ignore_for_file: type=lint
mixin _$UniqueRecordsDaoMixin on DatabaseAccessor<AppDatabase> {
  $MindfulSettingsTableTable get mindfulSettingsTable =>
      attachedDatabase.mindfulSettingsTable;
  $WellbeingTableTable get wellbeingTable => attachedDatabase.wellbeingTable;
  $SharedUniqueDataTableTable get sharedUniqueDataTable =>
      attachedDatabase.sharedUniqueDataTable;
  $NotificationSettingsTableTable get notificationSettingsTable =>
      attachedDatabase.notificationSettingsTable;
  UniqueRecordsDaoManager get managers => UniqueRecordsDaoManager(this);
}

class UniqueRecordsDaoManager {
  final _$UniqueRecordsDaoMixin _db;
  UniqueRecordsDaoManager(this._db);
  $$MindfulSettingsTableTableTableManager get mindfulSettingsTable =>
      $$MindfulSettingsTableTableTableManager(
          _db.attachedDatabase, _db.mindfulSettingsTable);
  $$WellbeingTableTableTableManager get wellbeingTable =>
      $$WellbeingTableTableTableManager(
          _db.attachedDatabase, _db.wellbeingTable);
  $$SharedUniqueDataTableTableTableManager get sharedUniqueDataTable =>
      $$SharedUniqueDataTableTableTableManager(
          _db.attachedDatabase, _db.sharedUniqueDataTable);
  $$NotificationSettingsTableTableTableManager get notificationSettingsTable =>
      $$NotificationSettingsTableTableTableManager(
          _db.attachedDatabase, _db.notificationSettingsTable);
}
