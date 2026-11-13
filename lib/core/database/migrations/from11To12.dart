// ignore_for_file: file_names

import 'package:drift/drift.dart';
import 'package:mindful/core/database/schemas/schema_versions.dart';
import 'package:mindful/core/utils/db_utils.dart';

Future<void> from11To12(Migrator m, Schema12 schema) async => await runSafe(
      "Migration(11 to 12)",
      () async {
        /// Drop [ParentalControlsTable] as parental controls are removed
        await m.deleteTable('parental_controls_table');
      },
    );
