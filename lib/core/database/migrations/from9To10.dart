// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from9To10(Migrator m, Schema10 schema) async => await runSafe(
      "Migration(9 to 10)",
      () async {
        /// Drop [RestrictionGroupsTable] as grouped apps blocking is removed
        await m.deleteTable('restriction_groups_table');

        /// Drop [associatedGroupId] column from [AppRestrictionTable]
        await m.alterTable(TableMigration(schema.appRestrictionTable));

        /// Drop [includeGroupsTimer] and [includeGroupsActivePeriod] columns
        /// from [ParentalControlsTable]
        await m.alterTable(TableMigration(schema.parentalControlsTable));
      },
    );
