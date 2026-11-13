// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from10To11(Migrator m, Schema11 schema) async => await runSafe(
      "Migration(10 to 11)",
      () async {
        /// Drop [BedtimeScheduleTable] as bedtime feature is removed
        await m.deleteTable('bedtime_schedule_table');

        /// Drop [includeBedtimeSchedule] column from [ParentalControlsTable]
        await m.alterTable(TableMigration(schema.parentalControlsTable));

        /// Bedtime was the 4th home tab (index 3), fall back to dashboard
        await m.database.customStatement(
          'UPDATE mindful_settings_table SET default_home_tab = 0 '
          'WHERE default_home_tab NOT IN (0, 1, 2)',
        );
      },
    );
