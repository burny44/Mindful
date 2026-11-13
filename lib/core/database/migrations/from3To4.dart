// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from3To4(Migrator m, Schema4 schema) async => await runSafe(
      "Migration(3 to 4)",
      () async {
        /// Create [AppUsageTable]
        await m.createTable(schema.appUsageTable);

        /// Create [ParentalControlsTable]
        await m.createTable(schema.parentalControlsTable);

        /// Add nsfw websites column to [WellbeingTable]
        await m.addColumn(
          schema.wellbeingTable,
          schema.wellbeingTable.nsfwWebsites,
        );

        /// Add usage history weeks column to [MindfulSettingsTable]
        await m.addColumn(
          schema.mindfulSettingsTable,
          schema.mindfulSettingsTable.usageHistoryWeeks,
        );

        /// Add app version column to [MindfulSettingsTable]
        await m.addColumn(
          schema.mindfulSettingsTable,
          schema.mindfulSettingsTable.appVersion,
        );

        /// Values from [MindfulSettingsTable] and [InvincibleModeTable] used to
        /// be moved to [ParentalControlsTable] here. Parental controls have since
        /// been removed (see migration 11 to 12), so they are simply dropped.

        /// Drop columns from [MindfulSettingsTable]
        await m.alterTable(TableMigration(schema.mindfulSettingsTable));

        /// Drop [InvincibleModeTable]
        await m.deleteTable('invincible_mode_table');
      },
    );
