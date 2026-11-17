// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from14To15(Migrator m, Schema15 schema) async => await runSafe(
      "Migration(14 to 15)",
      () async {
        /// Add daily YouTube Shorts watch limit column to [WellbeingTable]
        await m.addColumn(
          schema.wellbeingTable,
          schema.wellbeingTable.youtubeShortsLimitSec,
        );
      },
    );
