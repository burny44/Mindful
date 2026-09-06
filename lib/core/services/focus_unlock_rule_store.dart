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
import 'package:mindful/models/focus_unlock_rule.dart';

/// Persists the earn-unlock sessions as a JSON list in the app documents dir.
class FocusUnlockRuleStore {
  static const _fileName = "focus_unlock_rules.json";

  static Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, _fileName));
  }

  static Future<List<FocusUnlockRule>> load() async {
    try {
      final file = await _file();
      if (!await file.exists()) return const [];

      final json = jsonDecode(await file.readAsString());
      if (json is List) {
        return json
            .whereType<Map<String, dynamic>>()
            .map(FocusUnlockRule.fromJson)
            .toList();
      }
    } catch (e) {
      debugPrint("FocusUnlockRuleStore.load() Error: $e");
    }
    return const [];
  }

  static Future<void> save(List<FocusUnlockRule> rules) async {
    try {
      final file = await _file();
      await file.writeAsString(
        jsonEncode(rules.map((e) => e.toJson()).toList()),
      );
    } catch (e) {
      debugPrint("FocusUnlockRuleStore.save() Error: $e");
    }
  }
}
