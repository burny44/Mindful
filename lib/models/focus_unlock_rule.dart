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
import 'package:mindful/core/database/adapters/time_of_day_adapter.dart';

/// A saved "earn unlock" session.
///
/// The apps in [unlockApps] stay blocked until [requiredTimeSec] of screen time
/// is spent in [sourceApps], but only on the selected [scheduleDays] and inside
/// the start-end window.
class FocusUnlockRule {
  const FocusUnlockRule({
    this.id = 0,
    this.name = "",
    this.requiredTimeSec = 0,
    this.scheduleStartTime = const TimeOfDayAdapter.zero(),
    this.scheduleEndTime = const TimeOfDayAdapter.zero(),
    this.scheduleDurationInMins = 0,
    this.scheduleDays = const [true, true, true, true, true, false, false],
    this.sourceApps = const [],
    this.unlockApps = const [],
  });

  final int id;
  final String name;
  final int requiredTimeSec;
  final TimeOfDayAdapter scheduleStartTime;
  final TimeOfDayAdapter scheduleEndTime;
  final int scheduleDurationInMins;
  final List<bool> scheduleDays;
  final List<String> sourceApps;
  final List<String> unlockApps;

  /// A rule only has an effect if it can actually block something.
  bool get isValid =>
      sourceApps.isNotEmpty &&
      unlockApps.isNotEmpty &&
      requiredTimeSec > 0 &&
      scheduleDays.contains(true);

  FocusUnlockRule copyWith({
    int? id,
    String? name,
    int? requiredTimeSec,
    TimeOfDayAdapter? scheduleStartTime,
    TimeOfDayAdapter? scheduleEndTime,
    int? scheduleDurationInMins,
    List<bool>? scheduleDays,
    List<String>? sourceApps,
    List<String>? unlockApps,
  }) =>
      FocusUnlockRule(
        id: id ?? this.id,
        name: name ?? this.name,
        requiredTimeSec: requiredTimeSec ?? this.requiredTimeSec,
        scheduleStartTime: scheduleStartTime ?? this.scheduleStartTime,
        scheduleEndTime: scheduleEndTime ?? this.scheduleEndTime,
        scheduleDurationInMins:
            scheduleDurationInMins ?? this.scheduleDurationInMins,
        scheduleDays: scheduleDays ?? this.scheduleDays,
        sourceApps: sourceApps ?? this.sourceApps,
        unlockApps: unlockApps ?? this.unlockApps,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "requiredTimeSec": requiredTimeSec,
        "scheduleStartTime": scheduleStartTime.toMinutes,
        "scheduleEndTime": scheduleEndTime.toMinutes,
        "scheduleDurationInMins": scheduleDurationInMins,
        "scheduleDays": scheduleDays,
        "sourceApps": sourceApps,
        "unlockApps": unlockApps,
      };

  factory FocusUnlockRule.fromJson(Map<String, dynamic> json) =>
      FocusUnlockRule(
        id: (json["id"] as num?)?.toInt() ?? 0,
        name: json["name"]?.toString() ?? "",
        requiredTimeSec: (json["requiredTimeSec"] as num?)?.toInt() ?? 0,
        scheduleStartTime: TimeOfDayAdapter.fromMinutes(
          (json["scheduleStartTime"] as num?)?.toInt() ?? 0,
        ),
        scheduleEndTime: TimeOfDayAdapter.fromMinutes(
          (json["scheduleEndTime"] as num?)?.toInt() ?? 0,
        ),
        scheduleDurationInMins:
            (json["scheduleDurationInMins"] as num?)?.toInt() ?? 0,
        scheduleDays:
            (json["scheduleDays"] as List?)?.map((e) => e == true).toList() ??
                const [true, true, true, true, true, false, false],
        sourceApps:
            (json["sourceApps"] as List?)?.map((e) => e.toString()).toList() ??
                const [],
        unlockApps:
            (json["unlockApps"] as List?)?.map((e) => e.toString()).toList() ??
                const [],
      );

  @override
  bool operator ==(Object other) =>
      other is FocusUnlockRule &&
      other.id == id &&
      other.name == name &&
      other.requiredTimeSec == requiredTimeSec &&
      other.scheduleStartTime == scheduleStartTime &&
      other.scheduleEndTime == scheduleEndTime &&
      other.scheduleDurationInMins == scheduleDurationInMins &&
      listEquals(other.scheduleDays, scheduleDays) &&
      listEquals(other.sourceApps, sourceApps) &&
      listEquals(other.unlockApps, unlockApps);

  @override
  int get hashCode => Object.hash(
        id,
        name,
        requiredTimeSec,
        scheduleStartTime,
        scheduleEndTime,
        scheduleDurationInMins,
        Object.hashAll(scheduleDays),
        Object.hashAll(sourceApps),
        Object.hashAll(unlockApps),
      );
}
