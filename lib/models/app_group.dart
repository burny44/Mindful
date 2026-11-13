/*
 *
 *  * Copyright (c) 2024 Mindful (https://github.com/akaMrNagar/Mindful)
 *  * Author : Pawan Nagar (https://github.com/akaMrNagar)
 *  *
 *  * This source code is licensed under the GPL-2.0 license license found in the
 *  * LICENSE file in the root directory of this source tree.
 *
 */

import 'package:flutter/foundation.dart';

/// A named set of apps (and virtual apps like Instagram Reels) which can be
/// used as a single target in focus sessions and earn-unlock rules.
@immutable
class AppGroup {
  const AppGroup({
    this.id = 0,
    this.name = "",
    this.apps = const [],
  });

  final int id;
  final String name;

  /// Package names and virtual app ids. Never contains other groups.
  final List<String> apps;

  bool get isValid => name.trim().isNotEmpty && apps.isNotEmpty;

  AppGroup copyWith({
    int? id,
    String? name,
    List<String>? apps,
  }) =>
      AppGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        apps: apps ?? this.apps,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "apps": apps,
      };

  factory AppGroup.fromJson(Map<String, dynamic> json) => AppGroup(
        id: (json["id"] as num?)?.toInt() ?? 0,
        name: json["name"]?.toString() ?? "",
        apps: (json["apps"] as List?)?.map((e) => e.toString()).toList() ??
            const [],
      );

  @override
  bool operator ==(Object other) =>
      other is AppGroup &&
      other.id == id &&
      other.name == name &&
      listEquals(other.apps, apps);

  @override
  int get hashCode => Object.hash(id, name, Object.hashAll(apps));
}
