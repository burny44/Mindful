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

/// A saved scheduled focus session.
///
/// [distractingApps] stay blocked while the session is inside its schedule and
/// not currently in a break. When [isStrict] is true the session cannot be
/// edited or removed after it is saved.
class ScheduledFocusSession {
  const ScheduledFocusSession({
    this.id = 0,
    this.name = "",
    this.scheduleStartTime = const TimeOfDayAdapter.zero(),
    this.scheduleEndTime = const TimeOfDayAdapter.zero(),
    this.scheduleDurationInMins = 0,
    this.scheduleDays = const [true, true, true, true, true, false, false],
    this.distractingApps = const [],
    this.breaksEnabled = false,
    this.numberOfBreaks = 3,
    this.breakDurationSec = 10 * 60,
    this.pauseBetweenBreaksSec = 0,
    this.isStrict = false,
  });

  final int id;
  final String name;
  final TimeOfDayAdapter scheduleStartTime;
  final TimeOfDayAdapter scheduleEndTime;
  final int scheduleDurationInMins;
  final List<bool> scheduleDays;
  final List<String> distractingApps;
  final bool breaksEnabled;
  final int numberOfBreaks;
  final int breakDurationSec;
  final int pauseBetweenBreaksSec;
  final bool isStrict;

  bool get isValid =>
      distractingApps.isNotEmpty && scheduleDays.contains(true);

  ScheduledFocusSession copyWith({
    int? id,
    String? name,
    TimeOfDayAdapter? scheduleStartTime,
    TimeOfDayAdapter? scheduleEndTime,
    int? scheduleDurationInMins,
    List<bool>? scheduleDays,
    List<String>? distractingApps,
    bool? breaksEnabled,
    int? numberOfBreaks,
    int? breakDurationSec,
    int? pauseBetweenBreaksSec,
    bool? isStrict,
  }) =>
      ScheduledFocusSession(
        id: id ?? this.id,
        name: name ?? this.name,
        scheduleStartTime: scheduleStartTime ?? this.scheduleStartTime,
        scheduleEndTime: scheduleEndTime ?? this.scheduleEndTime,
        scheduleDurationInMins:
            scheduleDurationInMins ?? this.scheduleDurationInMins,
        scheduleDays: scheduleDays ?? this.scheduleDays,
        distractingApps: distractingApps ?? this.distractingApps,
        breaksEnabled: breaksEnabled ?? this.breaksEnabled,
        numberOfBreaks: numberOfBreaks ?? this.numberOfBreaks,
        breakDurationSec: breakDurationSec ?? this.breakDurationSec,
        pauseBetweenBreaksSec:
            pauseBetweenBreaksSec ?? this.pauseBetweenBreaksSec,
        isStrict: isStrict ?? this.isStrict,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "scheduleStartTime": scheduleStartTime.toMinutes,
        "scheduleEndTime": scheduleEndTime.toMinutes,
        "scheduleDurationInMins": scheduleDurationInMins,
        "scheduleDays": scheduleDays,
        "distractingApps": distractingApps,
        "breaksEnabled": breaksEnabled,
        "numberOfBreaks": numberOfBreaks,
        "breakDurationSec": breakDurationSec,
        "pauseBetweenBreaksSec": pauseBetweenBreaksSec,
        "isStrict": isStrict,
      };

  factory ScheduledFocusSession.fromJson(Map<String, dynamic> json) =>
      ScheduledFocusSession(
        id: (json["id"] as num?)?.toInt() ?? 0,
        name: json["name"]?.toString() ?? "",
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
        distractingApps: (json["distractingApps"] as List?)
                ?.map((e) => e.toString())
                .toList() ??
            const [],
        breaksEnabled: json["breaksEnabled"] == true,
        numberOfBreaks: (json["numberOfBreaks"] as num?)?.toInt() ?? 3,
        breakDurationSec:
            (json["breakDurationSec"] as num?)?.toInt() ?? 10 * 60,
        pauseBetweenBreaksSec:
            (json["pauseBetweenBreaksSec"] as num?)?.toInt() ?? 0,
        isStrict: json["isStrict"] == true,
      );

  @override
  bool operator ==(Object other) =>
      other is ScheduledFocusSession &&
      other.id == id &&
      other.name == name &&
      other.scheduleStartTime == scheduleStartTime &&
      other.scheduleEndTime == scheduleEndTime &&
      other.scheduleDurationInMins == scheduleDurationInMins &&
      listEquals(other.scheduleDays, scheduleDays) &&
      listEquals(other.distractingApps, distractingApps) &&
      other.breaksEnabled == breaksEnabled &&
      other.numberOfBreaks == numberOfBreaks &&
      other.breakDurationSec == breakDurationSec &&
      other.pauseBetweenBreaksSec == pauseBetweenBreaksSec &&
      other.isStrict == isStrict;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        scheduleStartTime,
        scheduleEndTime,
        scheduleDurationInMins,
        Object.hashAll(scheduleDays),
        Object.hashAll(distractingApps),
        breaksEnabled,
        numberOfBreaks,
        breakDurationSec,
        pauseBetweenBreaksSec,
        isStrict,
      );
}
