// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from12To13(Migrator m, Schema13 schema) async => await runSafe(
      "Migration(12 to 13)",
      () async {
        /// Drop tables of the removed manual focus sessions ("Focus now").
        /// Scheduled focus sessions and earn-unlock rules are stored outside
        /// the database and are not affected.
        await m.deleteTable('focus_mode_table');
        await m.deleteTable('focus_profile_table');
        await m.deleteTable('focus_sessions_table');
      },
    );
