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

/// Persists the packages whose app timer is strict, as a JSON list in the
/// app documents dir.
class StrictAppTimerStore {
  static const _fileName = "strict_app_timers.json";

  static Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, _fileName));
  }

  static Future<Set<String>> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return {};

      final json = jsonDecode(await file.readAsString());
      if (json is List) return json.whereType<String>().toSet();
    } catch (e) {
      debugPrint("StrictAppTimerStore.load() Error: $e");
    }
    return {};
  }

  static Future<void> save(Set<String> packages) async {
    try {
      final file = await _file();
      await file.writeAsString(jsonEncode(packages.toList()));
    } catch (e) {
      debugPrint("StrictAppTimerStore.save() Error: $e");
    }
  }
}
