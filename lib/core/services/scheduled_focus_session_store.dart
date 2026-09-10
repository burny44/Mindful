/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:mindful/models/scheduled_focus_session.dart';

/// Persists scheduled focus sessions as a JSON list in the app documents dir.
class ScheduledFocusSessionStore {
  static const _fileName = "scheduled_focus_sessions.json";

  static Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, _fileName));
  }

  static Future<List<ScheduledFocusSession>> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return const [];

      final json = jsonDecode(await file.readAsString());
      if (json is List) {
        return json
            .whereType<Map<String, dynamic>>()
            .map(ScheduledFocusSession.fromJson)
            .toList();
      }
    } catch (e) {
      debugPrint("ScheduledFocusSessionStore.load() Error: $e");
    }
    return const [];
  }

  static Future<void> save(List<ScheduledFocusSession> sessions) async {
    try {
      final file = await _file();
      await file.writeAsString(
        jsonEncode(sessions.map((e) => e.toJson()).toList()),
      );
    } catch (e) {
      debugPrint("ScheduledFocusSessionStore.save() Error: $e");
    }
  }
}
