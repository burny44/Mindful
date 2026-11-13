// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from13To14(Migrator m, Schema14 schema) async => await runSafe(
      "Migration(13 to 14)",
      () async {
        /// Add daily Instagram usage limit (for reels) column to [WellbeingTable]
        await m.addColumn(
          schema.wellbeingTable,
          schema.wellbeingTable.instagramUsageLimitSec,
        );
      },
    );
