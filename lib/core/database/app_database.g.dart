// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppRestrictionTableTable extends AppRestrictionTable
    with TableInfo<$AppRestrictionTableTable, AppRestriction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppRestrictionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _appPackageMeta =
      const VerificationMeta('appPackage');
  @override
  late final GeneratedColumn<String> appPackage = GeneratedColumn<String>(
      'app_package', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timerSecMeta =
      const VerificationMeta('timerSec');
  @override
  late final GeneratedColumn<int> timerSec = GeneratedColumn<int>(
      'timer_sec', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _launchLimitMeta =
      const VerificationMeta('launchLimit');
  @override
  late final GeneratedColumn<int> launchLimit = GeneratedColumn<int>(
      'launch_limit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<TimeOfDayAdapter, int>
      activePeriodStart = GeneratedColumn<int>(
              'active_period_start', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<TimeOfDayAdapter>(
              $AppRestrictionTableTable.$converteractivePeriodStart);
  @override
  late final GeneratedColumnWithTypeConverter<TimeOfDayAdapter, int>
      activePeriodEnd = GeneratedColumn<int>(
              'active_period_end', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<TimeOfDayAdapter>(
              $AppRestrictionTableTable.$converteractivePeriodEnd);
  static const VerificationMeta _periodDurationInMinsMeta =
      const VerificationMeta('periodDurationInMins');
  @override
  late final GeneratedColumn<int> periodDurationInMins = GeneratedColumn<int>(
      'period_duration_in_mins', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _canAccessInternetMeta =
      const VerificationMeta('canAccessInternet');
  @override
  late final GeneratedColumn<bool> canAccessInternet = GeneratedColumn<bool>(
      'can_access_internet', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("can_access_internet" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  late final GeneratedColumnWithTypeConverter<ReminderType, String>
      reminderType = GeneratedColumn<String>(
              'reminder_type', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(ReminderType.toast.name))
          .withConverter<ReminderType>(
              $AppRestrictionTableTable.$converterreminderType);
  @override
  List<GeneratedColumn> get $columns => [
        appPackage,
        timerSec,
        launchLimit,
        activePeriodStart,
        activePeriodEnd,
        periodDurationInMins,
        canAccessInternet,
        reminderType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_restriction_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppRestriction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('app_package')) {
      context.handle(
          _appPackageMeta,
          appPackage.isAcceptableOrUnknown(
              data['app_package']!, _appPackageMeta));
    } else if (isInserting) {
      context.missing(_appPackageMeta);
    }
    if (data.containsKey('timer_sec')) {
      context.handle(_timerSecMeta,
          timerSec.isAcceptableOrUnknown(data['timer_sec']!, _timerSecMeta));
    }
    if (data.containsKey('launch_limit')) {
      context.handle(
          _launchLimitMeta,
          launchLimit.isAcceptableOrUnknown(
              data['launch_limit']!, _launchLimitMeta));
    }
    if (data.containsKey('period_duration_in_mins')) {
      context.handle(
          _periodDurationInMinsMeta,
          periodDurationInMins.isAcceptableOrUnknown(
              data['period_duration_in_mins']!, _periodDurationInMinsMeta));
    }
    if (data.containsKey('can_access_internet')) {
      context.handle(
          _canAccessInternetMeta,
          canAccessInternet.isAcceptableOrUnknown(
              data['can_access_internet']!, _canAccessInternetMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {appPackage};
  @override
  AppRestriction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppRestriction(
      appPackage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_package'])!,
      timerSec: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timer_sec'])!,
      launchLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}launch_limit'])!,
      activePeriodStart: $AppRestrictionTableTable.$converteractivePeriodStart
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}active_period_start'])!),
      activePeriodEnd: $AppRestrictionTableTable.$converteractivePeriodEnd
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}active_period_end'])!),
      periodDurationInMins: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}period_duration_in_mins'])!,
      canAccessInternet: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}can_access_internet'])!,
      reminderType: $AppRestrictionTableTable.$converterreminderType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}reminder_type'])!),
    );
  }

  @override
  $AppRestrictionTableTable createAlias(String alias) {
    return $AppRestrictionTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TimeOfDayAdapter, int, dynamic>
      $converteractivePeriodStart = const TimeOfDayAdapterConverter();
  static JsonTypeConverter2<TimeOfDayAdapter, int, dynamic>
      $converteractivePeriodEnd = const TimeOfDayAdapterConverter();
  static JsonTypeConverter2<ReminderType, String, String>
      $converterreminderType =
      const EnumNameConverter<ReminderType>(ReminderType.values);
}

class AppRestriction extends DataClass implements Insertable<AppRestriction> {
  /// Package name of the related app
  final String appPackage;

  /// The timer set for the app in SECONDS
  final int timerSec;

  /// The number of times user can launch this app
  final int launchLimit;

  /// [TimeOfDay] in minutes from where the active period will start.
  /// It is stored as total minutes.
  final TimeOfDayAdapter activePeriodStart;

  /// [TimeOfDay] in minutes when the active period will end
  /// It is stored as total minutes.
  final TimeOfDayAdapter activePeriodEnd;

  /// Total duration of active period from start to end in MINUTES
  final int periodDurationInMins;

  /// Flag denoting if this app can access internet or not
  final bool canAccessInternet;

  /// [ReminderType] Type of reminders to show when using timed app
  final ReminderType reminderType;
  const AppRestriction(
      {required this.appPackage,
      required this.timerSec,
      required this.launchLimit,
      required this.activePeriodStart,
      required this.activePeriodEnd,
      required this.periodDurationInMins,
      required this.canAccessInternet,
      required this.reminderType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['app_package'] = Variable<String>(appPackage);
    map['timer_sec'] = Variable<int>(timerSec);
    map['launch_limit'] = Variable<int>(launchLimit);
    {
      map['active_period_start'] = Variable<int>($AppRestrictionTableTable
          .$converteractivePeriodStart
          .toSql(activePeriodStart));
    }
    {
      map['active_period_end'] = Variable<int>($AppRestrictionTableTable
          .$converteractivePeriodEnd
          .toSql(activePeriodEnd));
    }
    map['period_duration_in_mins'] = Variable<int>(periodDurationInMins);
    map['can_access_internet'] = Variable<bool>(canAccessInternet);
    {
      map['reminder_type'] = Variable<String>(
          $AppRestrictionTableTable.$converterreminderType.toSql(reminderType));
    }
    return map;
  }

  AppRestrictionTableCompanion toCompanion(bool nullToAbsent) {
    return AppRestrictionTableCompanion(
      appPackage: Value(appPackage),
      timerSec: Value(timerSec),
      launchLimit: Value(launchLimit),
      activePeriodStart: Value(activePeriodStart),
      activePeriodEnd: Value(activePeriodEnd),
      periodDurationInMins: Value(periodDurationInMins),
      canAccessInternet: Value(canAccessInternet),
      reminderType: Value(reminderType),
    );
  }

  factory AppRestriction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppRestriction(
      appPackage: serializer.fromJson<String>(json['appPackage']),
      timerSec: serializer.fromJson<int>(json['timerSec']),
      launchLimit: serializer.fromJson<int>(json['launchLimit']),
      activePeriodStart: $AppRestrictionTableTable.$converteractivePeriodStart
          .fromJson(serializer.fromJson<dynamic>(json['activePeriodStart'])),
      activePeriodEnd: $AppRestrictionTableTable.$converteractivePeriodEnd
          .fromJson(serializer.fromJson<dynamic>(json['activePeriodEnd'])),
      periodDurationInMins:
          serializer.fromJson<int>(json['periodDurationInMins']),
      canAccessInternet: serializer.fromJson<bool>(json['canAccessInternet']),
      reminderType: $AppRestrictionTableTable.$converterreminderType
          .fromJson(serializer.fromJson<String>(json['reminderType'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'appPackage': serializer.toJson<String>(appPackage),
      'timerSec': serializer.toJson<int>(timerSec),
      'launchLimit': serializer.toJson<int>(launchLimit),
      'activePeriodStart': serializer.toJson<dynamic>($AppRestrictionTableTable
          .$converteractivePeriodStart
          .toJson(activePeriodStart)),
      'activePeriodEnd': serializer.toJson<dynamic>($AppRestrictionTableTable
          .$converteractivePeriodEnd
          .toJson(activePeriodEnd)),
      'periodDurationInMins': serializer.toJson<int>(periodDurationInMins),
      'canAccessInternet': serializer.toJson<bool>(canAccessInternet),
      'reminderType': serializer.toJson<String>($AppRestrictionTableTable
          .$converterreminderType
          .toJson(reminderType)),
    };
  }

  AppRestriction copyWith(
          {String? appPackage,
          int? timerSec,
          int? launchLimit,
          TimeOfDayAdapter? activePeriodStart,
          TimeOfDayAdapter? activePeriodEnd,
          int? periodDurationInMins,
          bool? canAccessInternet,
          ReminderType? reminderType}) =>
      AppRestriction(
        appPackage: appPackage ?? this.appPackage,
        timerSec: timerSec ?? this.timerSec,
        launchLimit: launchLimit ?? this.launchLimit,
        activePeriodStart: activePeriodStart ?? this.activePeriodStart,
        activePeriodEnd: activePeriodEnd ?? this.activePeriodEnd,
        periodDurationInMins: periodDurationInMins ?? this.periodDurationInMins,
        canAccessInternet: canAccessInternet ?? this.canAccessInternet,
        reminderType: reminderType ?? this.reminderType,
      );
  AppRestriction copyWithCompanion(AppRestrictionTableCompanion data) {
    return AppRestriction(
      appPackage:
          data.appPackage.present ? data.appPackage.value : this.appPackage,
      timerSec: data.timerSec.present ? data.timerSec.value : this.timerSec,
      launchLimit:
          data.launchLimit.present ? data.launchLimit.value : this.launchLimit,
      activePeriodStart: data.activePeriodStart.present
          ? data.activePeriodStart.value
          : this.activePeriodStart,
      activePeriodEnd: data.activePeriodEnd.present
          ? data.activePeriodEnd.value
          : this.activePeriodEnd,
      periodDurationInMins: data.periodDurationInMins.present
          ? data.periodDurationInMins.value
          : this.periodDurationInMins,
      canAccessInternet: data.canAccessInternet.present
          ? data.canAccessInternet.value
          : this.canAccessInternet,
      reminderType: data.reminderType.present
          ? data.reminderType.value
          : this.reminderType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppRestriction(')
          ..write('appPackage: $appPackage, ')
          ..write('timerSec: $timerSec, ')
          ..write('launchLimit: $launchLimit, ')
          ..write('activePeriodStart: $activePeriodStart, ')
          ..write('activePeriodEnd: $activePeriodEnd, ')
          ..write('periodDurationInMins: $periodDurationInMins, ')
          ..write('canAccessInternet: $canAccessInternet, ')
          ..write('reminderType: $reminderType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      appPackage,
      timerSec,
      launchLimit,
      activePeriodStart,
      activePeriodEnd,
      periodDurationInMins,
      canAccessInternet,
      reminderType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppRestriction &&
          other.appPackage == this.appPackage &&
          other.timerSec == this.timerSec &&
          other.launchLimit == this.launchLimit &&
          other.activePeriodStart == this.activePeriodStart &&
          other.activePeriodEnd == this.activePeriodEnd &&
          other.periodDurationInMins == this.periodDurationInMins &&
          other.canAccessInternet == this.canAccessInternet &&
          other.reminderType == this.reminderType);
}

class AppRestrictionTableCompanion extends UpdateCompanion<AppRestriction> {
  final Value<String> appPackage;
  final Value<int> timerSec;
  final Value<int> launchLimit;
  final Value<TimeOfDayAdapter> activePeriodStart;
  final Value<TimeOfDayAdapter> activePeriodEnd;
  final Value<int> periodDurationInMins;
  final Value<bool> canAccessInternet;
  final Value<ReminderType> reminderType;
  final Value<int> rowid;
  const AppRestrictionTableCompanion({
    this.appPackage = const Value.absent(),
    this.timerSec = const Value.absent(),
    this.launchLimit = const Value.absent(),
    this.activePeriodStart = const Value.absent(),
    this.activePeriodEnd = const Value.absent(),
    this.periodDurationInMins = const Value.absent(),
    this.canAccessInternet = const Value.absent(),
    this.reminderType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppRestrictionTableCompanion.insert({
    required String appPackage,
    this.timerSec = const Value.absent(),
    this.launchLimit = const Value.absent(),
    this.activePeriodStart = const Value.absent(),
    this.activePeriodEnd = const Value.absent(),
    this.periodDurationInMins = const Value.absent(),
    this.canAccessInternet = const Value.absent(),
    this.reminderType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : appPackage = Value(appPackage);
  static Insertable<AppRestriction> custom({
    Expression<String>? appPackage,
    Expression<int>? timerSec,
    Expression<int>? launchLimit,
    Expression<int>? activePeriodStart,
    Expression<int>? activePeriodEnd,
    Expression<int>? periodDurationInMins,
    Expression<bool>? canAccessInternet,
    Expression<String>? reminderType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (appPackage != null) 'app_package': appPackage,
      if (timerSec != null) 'timer_sec': timerSec,
      if (launchLimit != null) 'launch_limit': launchLimit,
      if (activePeriodStart != null) 'active_period_start': activePeriodStart,
      if (activePeriodEnd != null) 'active_period_end': activePeriodEnd,
      if (periodDurationInMins != null)
        'period_duration_in_mins': periodDurationInMins,
      if (canAccessInternet != null) 'can_access_internet': canAccessInternet,
      if (reminderType != null) 'reminder_type': reminderType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppRestrictionTableCompanion copyWith(
      {Value<String>? appPackage,
      Value<int>? timerSec,
      Value<int>? launchLimit,
      Value<TimeOfDayAdapter>? activePeriodStart,
      Value<TimeOfDayAdapter>? activePeriodEnd,
      Value<int>? periodDurationInMins,
      Value<bool>? canAccessInternet,
      Value<ReminderType>? reminderType,
      Value<int>? rowid}) {
    return AppRestrictionTableCompanion(
      appPackage: appPackage ?? this.appPackage,
      timerSec: timerSec ?? this.timerSec,
      launchLimit: launchLimit ?? this.launchLimit,
      activePeriodStart: activePeriodStart ?? this.activePeriodStart,
      activePeriodEnd: activePeriodEnd ?? this.activePeriodEnd,
      periodDurationInMins: periodDurationInMins ?? this.periodDurationInMins,
      canAccessInternet: canAccessInternet ?? this.canAccessInternet,
      reminderType: reminderType ?? this.reminderType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (appPackage.present) {
      map['app_package'] = Variable<String>(appPackage.value);
    }
    if (timerSec.present) {
      map['timer_sec'] = Variable<int>(timerSec.value);
    }
    if (launchLimit.present) {
      map['launch_limit'] = Variable<int>(launchLimit.value);
    }
    if (activePeriodStart.present) {
      map['active_period_start'] = Variable<int>($AppRestrictionTableTable
          .$converteractivePeriodStart
          .toSql(activePeriodStart.value));
    }
    if (activePeriodEnd.present) {
      map['active_period_end'] = Variable<int>($AppRestrictionTableTable
          .$converteractivePeriodEnd
          .toSql(activePeriodEnd.value));
    }
    if (periodDurationInMins.present) {
      map['period_duration_in_mins'] =
          Variable<int>(periodDurationInMins.value);
    }
    if (canAccessInternet.present) {
      map['can_access_internet'] = Variable<bool>(canAccessInternet.value);
    }
    if (reminderType.present) {
      map['reminder_type'] = Variable<String>($AppRestrictionTableTable
          .$converterreminderType
          .toSql(reminderType.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppRestrictionTableCompanion(')
          ..write('appPackage: $appPackage, ')
          ..write('timerSec: $timerSec, ')
          ..write('launchLimit: $launchLimit, ')
          ..write('activePeriodStart: $activePeriodStart, ')
          ..write('activePeriodEnd: $activePeriodEnd, ')
          ..write('periodDurationInMins: $periodDurationInMins, ')
          ..write('canAccessInternet: $canAccessInternet, ')
          ..write('reminderType: $reminderType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CrashLogsTableTable extends CrashLogsTable
    with TableInfo<$CrashLogsTableTable, CrashLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CrashLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _appVersionMeta =
      const VerificationMeta('appVersion');
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
      'app_version', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<DateTime> timeStamp = GeneratedColumn<DateTime>(
      'time_stamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime(0)));
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
      'error', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _stackTraceMeta =
      const VerificationMeta('stackTrace');
  @override
  late final GeneratedColumn<String> stackTrace = GeneratedColumn<String>(
      'stack_trace', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  @override
  List<GeneratedColumn> get $columns =>
      [id, appVersion, timeStamp, error, stackTrace];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'crash_logs_table';
  @override
  VerificationContext validateIntegrity(Insertable<CrashLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('app_version')) {
      context.handle(
          _appVersionMeta,
          appVersion.isAcceptableOrUnknown(
              data['app_version']!, _appVersionMeta));
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    }
    if (data.containsKey('error')) {
      context.handle(
          _errorMeta, error.isAcceptableOrUnknown(data['error']!, _errorMeta));
    }
    if (data.containsKey('stack_trace')) {
      context.handle(
          _stackTraceMeta,
          stackTrace.isAcceptableOrUnknown(
              data['stack_trace']!, _stackTraceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CrashLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CrashLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      appVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_version'])!,
      timeStamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time_stamp'])!,
      error: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error'])!,
      stackTrace: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stack_trace'])!,
    );
  }

  @override
  $CrashLogsTableTable createAlias(String alias) {
    return $CrashLogsTableTable(attachedDatabase, alias);
  }
}

class CrashLog extends DataClass implements Insertable<CrashLog> {
  /// Unique ID for crash logs
  final int id;

  /// Current version of Mindful app
  final String appVersion;

  /// [DateTime] when the error was thrown
  final DateTime timeStamp;

  /// The error string
  final String error;

  /// Stack trace when the error or exception was thrown
  final String stackTrace;
  const CrashLog(
      {required this.id,
      required this.appVersion,
      required this.timeStamp,
      required this.error,
      required this.stackTrace});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['app_version'] = Variable<String>(appVersion);
    map['time_stamp'] = Variable<DateTime>(timeStamp);
    map['error'] = Variable<String>(error);
    map['stack_trace'] = Variable<String>(stackTrace);
    return map;
  }

  CrashLogsTableCompanion toCompanion(bool nullToAbsent) {
    return CrashLogsTableCompanion(
      id: Value(id),
      appVersion: Value(appVersion),
      timeStamp: Value(timeStamp),
      error: Value(error),
      stackTrace: Value(stackTrace),
    );
  }

  factory CrashLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CrashLog(
      id: serializer.fromJson<int>(json['id']),
      appVersion: serializer.fromJson<String>(json['appVersion']),
      timeStamp: serializer.fromJson<DateTime>(json['timeStamp']),
      error: serializer.fromJson<String>(json['error']),
      stackTrace: serializer.fromJson<String>(json['stackTrace']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'appVersion': serializer.toJson<String>(appVersion),
      'timeStamp': serializer.toJson<DateTime>(timeStamp),
      'error': serializer.toJson<String>(error),
      'stackTrace': serializer.toJson<String>(stackTrace),
    };
  }

  CrashLog copyWith(
          {int? id,
          String? appVersion,
          DateTime? timeStamp,
          String? error,
          String? stackTrace}) =>
      CrashLog(
        id: id ?? this.id,
        appVersion: appVersion ?? this.appVersion,
        timeStamp: timeStamp ?? this.timeStamp,
        error: error ?? this.error,
        stackTrace: stackTrace ?? this.stackTrace,
      );
  CrashLog copyWithCompanion(CrashLogsTableCompanion data) {
    return CrashLog(
      id: data.id.present ? data.id.value : this.id,
      appVersion:
          data.appVersion.present ? data.appVersion.value : this.appVersion,
      timeStamp: data.timeStamp.present ? data.timeStamp.value : this.timeStamp,
      error: data.error.present ? data.error.value : this.error,
      stackTrace:
          data.stackTrace.present ? data.stackTrace.value : this.stackTrace,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CrashLog(')
          ..write('id: $id, ')
          ..write('appVersion: $appVersion, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('error: $error, ')
          ..write('stackTrace: $stackTrace')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, appVersion, timeStamp, error, stackTrace);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CrashLog &&
          other.id == this.id &&
          other.appVersion == this.appVersion &&
          other.timeStamp == this.timeStamp &&
          other.error == this.error &&
          other.stackTrace == this.stackTrace);
}

class CrashLogsTableCompanion extends UpdateCompanion<CrashLog> {
  final Value<int> id;
  final Value<String> appVersion;
  final Value<DateTime> timeStamp;
  final Value<String> error;
  final Value<String> stackTrace;
  const CrashLogsTableCompanion({
    this.id = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.error = const Value.absent(),
    this.stackTrace = const Value.absent(),
  });
  CrashLogsTableCompanion.insert({
    this.id = const Value.absent(),
    this.appVersion = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.error = const Value.absent(),
    this.stackTrace = const Value.absent(),
  });
  static Insertable<CrashLog> custom({
    Expression<int>? id,
    Expression<String>? appVersion,
    Expression<DateTime>? timeStamp,
    Expression<String>? error,
    Expression<String>? stackTrace,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appVersion != null) 'app_version': appVersion,
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (error != null) 'error': error,
      if (stackTrace != null) 'stack_trace': stackTrace,
    });
  }

  CrashLogsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? appVersion,
      Value<DateTime>? timeStamp,
      Value<String>? error,
      Value<String>? stackTrace}) {
    return CrashLogsTableCompanion(
      id: id ?? this.id,
      appVersion: appVersion ?? this.appVersion,
      timeStamp: timeStamp ?? this.timeStamp,
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    if (timeStamp.present) {
      map['time_stamp'] = Variable<DateTime>(timeStamp.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = Variable<String>(stackTrace.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CrashLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('appVersion: $appVersion, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('error: $error, ')
          ..write('stackTrace: $stackTrace')
          ..write(')'))
        .toString();
  }
}

class $MindfulSettingsTableTable extends MindfulSettingsTable
    with TableInfo<$MindfulSettingsTableTable, MindfulSettings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MindfulSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<AppThemeMode, int> themeMode =
      GeneratedColumn<int>('theme_mode', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(AppConstants.defaultThemeMode.index))
          .withConverter<AppThemeMode>(
              $MindfulSettingsTableTable.$converterthemeMode);
  static const VerificationMeta _accentColorMeta =
      const VerificationMeta('accentColor');
  @override
  late final GeneratedColumn<String> accentColor = GeneratedColumn<String>(
      'accent_color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(AppConstants.defaultMaterialColor));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(AppConstants.defaultUsername));
  static const VerificationMeta _localeCodeMeta =
      const VerificationMeta('localeCode');
  @override
  late final GeneratedColumn<String> localeCode = GeneratedColumn<String>(
      'locale_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(AppConstants.defaultLocale));
  static const VerificationMeta _useAmoledDarkMeta =
      const VerificationMeta('useAmoledDark');
  @override
  late final GeneratedColumn<bool> useAmoledDark = GeneratedColumn<bool>(
      'use_amoled_dark', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("use_amoled_dark" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _useDynamicColorsMeta =
      const VerificationMeta('useDynamicColors');
  @override
  late final GeneratedColumn<bool> useDynamicColors = GeneratedColumn<bool>(
      'use_dynamic_colors', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("use_dynamic_colors" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<DefaultHomeTab, int>
      defaultHomeTab = GeneratedColumn<int>(
              'default_home_tab', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(DefaultHomeTab.dashboard.index))
          .withConverter<DefaultHomeTab>(
              $MindfulSettingsTableTable.$converterdefaultHomeTab);
  static const VerificationMeta _usageHistoryWeeksMeta =
      const VerificationMeta('usageHistoryWeeks');
  @override
  late final GeneratedColumn<int> usageHistoryWeeks = GeneratedColumn<int>(
      'usage_history_weeks', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  static const VerificationMeta _leftEmergencyPassesMeta =
      const VerificationMeta('leftEmergencyPasses');
  @override
  late final GeneratedColumn<int> leftEmergencyPasses = GeneratedColumn<int>(
      'left_emergency_passes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _lastEmergencyUsedMeta =
      const VerificationMeta('lastEmergencyUsed');
  @override
  late final GeneratedColumn<DateTime> lastEmergencyUsed =
      GeneratedColumn<DateTime>('last_emergency_used', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime(0)));
  static const VerificationMeta _isOnboardingDoneMeta =
      const VerificationMeta('isOnboardingDone');
  @override
  late final GeneratedColumn<bool> isOnboardingDone = GeneratedColumn<bool>(
      'is_onboarding_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_onboarding_done" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _appVersionMeta =
      const VerificationMeta('appVersion');
  @override
  late final GeneratedColumn<String> appVersion = GeneratedColumn<String>(
      'app_version', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        themeMode,
        accentColor,
        username,
        localeCode,
        useAmoledDark,
        useDynamicColors,
        defaultHomeTab,
        usageHistoryWeeks,
        leftEmergencyPasses,
        lastEmergencyUsed,
        isOnboardingDone,
        appVersion
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mindful_settings_table';
  @override
  VerificationContext validateIntegrity(Insertable<MindfulSettings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('accent_color')) {
      context.handle(
          _accentColorMeta,
          accentColor.isAcceptableOrUnknown(
              data['accent_color']!, _accentColorMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    }
    if (data.containsKey('locale_code')) {
      context.handle(
          _localeCodeMeta,
          localeCode.isAcceptableOrUnknown(
              data['locale_code']!, _localeCodeMeta));
    }
    if (data.containsKey('use_amoled_dark')) {
      context.handle(
          _useAmoledDarkMeta,
          useAmoledDark.isAcceptableOrUnknown(
              data['use_amoled_dark']!, _useAmoledDarkMeta));
    }
    if (data.containsKey('use_dynamic_colors')) {
      context.handle(
          _useDynamicColorsMeta,
          useDynamicColors.isAcceptableOrUnknown(
              data['use_dynamic_colors']!, _useDynamicColorsMeta));
    }
    if (data.containsKey('usage_history_weeks')) {
      context.handle(
          _usageHistoryWeeksMeta,
          usageHistoryWeeks.isAcceptableOrUnknown(
              data['usage_history_weeks']!, _usageHistoryWeeksMeta));
    }
    if (data.containsKey('left_emergency_passes')) {
      context.handle(
          _leftEmergencyPassesMeta,
          leftEmergencyPasses.isAcceptableOrUnknown(
              data['left_emergency_passes']!, _leftEmergencyPassesMeta));
    }
    if (data.containsKey('last_emergency_used')) {
      context.handle(
          _lastEmergencyUsedMeta,
          lastEmergencyUsed.isAcceptableOrUnknown(
              data['last_emergency_used']!, _lastEmergencyUsedMeta));
    }
    if (data.containsKey('is_onboarding_done')) {
      context.handle(
          _isOnboardingDoneMeta,
          isOnboardingDone.isAcceptableOrUnknown(
              data['is_onboarding_done']!, _isOnboardingDoneMeta));
    }
    if (data.containsKey('app_version')) {
      context.handle(
          _appVersionMeta,
          appVersion.isAcceptableOrUnknown(
              data['app_version']!, _appVersionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MindfulSettings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MindfulSettings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeMode: $MindfulSettingsTableTable.$converterthemeMode.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}theme_mode'])!),
      accentColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}accent_color'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      localeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale_code'])!,
      useAmoledDark: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}use_amoled_dark'])!,
      useDynamicColors: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}use_dynamic_colors'])!,
      defaultHomeTab: $MindfulSettingsTableTable.$converterdefaultHomeTab
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}default_home_tab'])!),
      usageHistoryWeeks: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}usage_history_weeks'])!,
      leftEmergencyPasses: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}left_emergency_passes'])!,
      lastEmergencyUsed: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_emergency_used'])!,
      isOnboardingDone: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_onboarding_done'])!,
      appVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app_version'])!,
    );
  }

  @override
  $MindfulSettingsTableTable createAlias(String alias) {
    return $MindfulSettingsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AppThemeMode, int, int> $converterthemeMode =
      const EnumIndexConverter<AppThemeMode>(AppThemeMode.values);
  static JsonTypeConverter2<DefaultHomeTab, int, int> $converterdefaultHomeTab =
      const EnumIndexConverter<DefaultHomeTab>(DefaultHomeTab.values);
}

class MindfulSettings extends DataClass implements Insertable<MindfulSettings> {
  /// Unique ID for app settings
  final int id;

  /// Default theme mode for app
  final AppThemeMode themeMode;

  /// Default material color for app
  final String accentColor;

  /// Username shown on the dashboard
  final String username;

  /// App Locale (Language code)
  final String localeCode;

  /// Flag indicating if to use pure amoled black color for dark theme
  final bool useAmoledDark;

  /// Flag indicating if to use wallpaper colors for themes
  final bool useDynamicColors;

  /// Default initial home tab
  final DefaultHomeTab defaultHomeTab;

  /// Maximum number of weeks till the app's usage history will be kept
  final int usageHistoryWeeks;

  /// Number of emergency break passes left for today
  final int leftEmergencyPasses;

  /// Timestamp of the last used emergency break
  final DateTime lastEmergencyUsed;

  /// Flag indicating if onboarding is completed or not
  final bool isOnboardingDone;

  /// The currently installed version of Mindful.
  /// Mainly used to show changelogs screen.
  final String appVersion;
  const MindfulSettings(
      {required this.id,
      required this.themeMode,
      required this.accentColor,
      required this.username,
      required this.localeCode,
      required this.useAmoledDark,
      required this.useDynamicColors,
      required this.defaultHomeTab,
      required this.usageHistoryWeeks,
      required this.leftEmergencyPasses,
      required this.lastEmergencyUsed,
      required this.isOnboardingDone,
      required this.appVersion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['theme_mode'] = Variable<int>(
          $MindfulSettingsTableTable.$converterthemeMode.toSql(themeMode));
    }
    map['accent_color'] = Variable<String>(accentColor);
    map['username'] = Variable<String>(username);
    map['locale_code'] = Variable<String>(localeCode);
    map['use_amoled_dark'] = Variable<bool>(useAmoledDark);
    map['use_dynamic_colors'] = Variable<bool>(useDynamicColors);
    {
      map['default_home_tab'] = Variable<int>($MindfulSettingsTableTable
          .$converterdefaultHomeTab
          .toSql(defaultHomeTab));
    }
    map['usage_history_weeks'] = Variable<int>(usageHistoryWeeks);
    map['left_emergency_passes'] = Variable<int>(leftEmergencyPasses);
    map['last_emergency_used'] = Variable<DateTime>(lastEmergencyUsed);
    map['is_onboarding_done'] = Variable<bool>(isOnboardingDone);
    map['app_version'] = Variable<String>(appVersion);
    return map;
  }

  MindfulSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return MindfulSettingsTableCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      accentColor: Value(accentColor),
      username: Value(username),
      localeCode: Value(localeCode),
      useAmoledDark: Value(useAmoledDark),
      useDynamicColors: Value(useDynamicColors),
      defaultHomeTab: Value(defaultHomeTab),
      usageHistoryWeeks: Value(usageHistoryWeeks),
      leftEmergencyPasses: Value(leftEmergencyPasses),
      lastEmergencyUsed: Value(lastEmergencyUsed),
      isOnboardingDone: Value(isOnboardingDone),
      appVersion: Value(appVersion),
    );
  }

  factory MindfulSettings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MindfulSettings(
      id: serializer.fromJson<int>(json['id']),
      themeMode: $MindfulSettingsTableTable.$converterthemeMode
          .fromJson(serializer.fromJson<int>(json['themeMode'])),
      accentColor: serializer.fromJson<String>(json['accentColor']),
      username: serializer.fromJson<String>(json['username']),
      localeCode: serializer.fromJson<String>(json['localeCode']),
      useAmoledDark: serializer.fromJson<bool>(json['useAmoledDark']),
      useDynamicColors: serializer.fromJson<bool>(json['useDynamicColors']),
      defaultHomeTab: $MindfulSettingsTableTable.$converterdefaultHomeTab
          .fromJson(serializer.fromJson<int>(json['defaultHomeTab'])),
      usageHistoryWeeks: serializer.fromJson<int>(json['usageHistoryWeeks']),
      leftEmergencyPasses:
          serializer.fromJson<int>(json['leftEmergencyPasses']),
      lastEmergencyUsed:
          serializer.fromJson<DateTime>(json['lastEmergencyUsed']),
      isOnboardingDone: serializer.fromJson<bool>(json['isOnboardingDone']),
      appVersion: serializer.fromJson<String>(json['appVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<int>(
          $MindfulSettingsTableTable.$converterthemeMode.toJson(themeMode)),
      'accentColor': serializer.toJson<String>(accentColor),
      'username': serializer.toJson<String>(username),
      'localeCode': serializer.toJson<String>(localeCode),
      'useAmoledDark': serializer.toJson<bool>(useAmoledDark),
      'useDynamicColors': serializer.toJson<bool>(useDynamicColors),
      'defaultHomeTab': serializer.toJson<int>($MindfulSettingsTableTable
          .$converterdefaultHomeTab
          .toJson(defaultHomeTab)),
      'usageHistoryWeeks': serializer.toJson<int>(usageHistoryWeeks),
      'leftEmergencyPasses': serializer.toJson<int>(leftEmergencyPasses),
      'lastEmergencyUsed': serializer.toJson<DateTime>(lastEmergencyUsed),
      'isOnboardingDone': serializer.toJson<bool>(isOnboardingDone),
      'appVersion': serializer.toJson<String>(appVersion),
    };
  }

  MindfulSettings copyWith(
          {int? id,
          AppThemeMode? themeMode,
          String? accentColor,
          String? username,
          String? localeCode,
          bool? useAmoledDark,
          bool? useDynamicColors,
          DefaultHomeTab? defaultHomeTab,
          int? usageHistoryWeeks,
          int? leftEmergencyPasses,
          DateTime? lastEmergencyUsed,
          bool? isOnboardingDone,
          String? appVersion}) =>
      MindfulSettings(
        id: id ?? this.id,
        themeMode: themeMode ?? this.themeMode,
        accentColor: accentColor ?? this.accentColor,
        username: username ?? this.username,
        localeCode: localeCode ?? this.localeCode,
        useAmoledDark: useAmoledDark ?? this.useAmoledDark,
        useDynamicColors: useDynamicColors ?? this.useDynamicColors,
        defaultHomeTab: defaultHomeTab ?? this.defaultHomeTab,
        usageHistoryWeeks: usageHistoryWeeks ?? this.usageHistoryWeeks,
        leftEmergencyPasses: leftEmergencyPasses ?? this.leftEmergencyPasses,
        lastEmergencyUsed: lastEmergencyUsed ?? this.lastEmergencyUsed,
        isOnboardingDone: isOnboardingDone ?? this.isOnboardingDone,
        appVersion: appVersion ?? this.appVersion,
      );
  MindfulSettings copyWithCompanion(MindfulSettingsTableCompanion data) {
    return MindfulSettings(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      accentColor:
          data.accentColor.present ? data.accentColor.value : this.accentColor,
      username: data.username.present ? data.username.value : this.username,
      localeCode:
          data.localeCode.present ? data.localeCode.value : this.localeCode,
      useAmoledDark: data.useAmoledDark.present
          ? data.useAmoledDark.value
          : this.useAmoledDark,
      useDynamicColors: data.useDynamicColors.present
          ? data.useDynamicColors.value
          : this.useDynamicColors,
      defaultHomeTab: data.defaultHomeTab.present
          ? data.defaultHomeTab.value
          : this.defaultHomeTab,
      usageHistoryWeeks: data.usageHistoryWeeks.present
          ? data.usageHistoryWeeks.value
          : this.usageHistoryWeeks,
      leftEmergencyPasses: data.leftEmergencyPasses.present
          ? data.leftEmergencyPasses.value
          : this.leftEmergencyPasses,
      lastEmergencyUsed: data.lastEmergencyUsed.present
          ? data.lastEmergencyUsed.value
          : this.lastEmergencyUsed,
      isOnboardingDone: data.isOnboardingDone.present
          ? data.isOnboardingDone.value
          : this.isOnboardingDone,
      appVersion:
          data.appVersion.present ? data.appVersion.value : this.appVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MindfulSettings(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('accentColor: $accentColor, ')
          ..write('username: $username, ')
          ..write('localeCode: $localeCode, ')
          ..write('useAmoledDark: $useAmoledDark, ')
          ..write('useDynamicColors: $useDynamicColors, ')
          ..write('defaultHomeTab: $defaultHomeTab, ')
          ..write('usageHistoryWeeks: $usageHistoryWeeks, ')
          ..write('leftEmergencyPasses: $leftEmergencyPasses, ')
          ..write('lastEmergencyUsed: $lastEmergencyUsed, ')
          ..write('isOnboardingDone: $isOnboardingDone, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      themeMode,
      accentColor,
      username,
      localeCode,
      useAmoledDark,
      useDynamicColors,
      defaultHomeTab,
      usageHistoryWeeks,
      leftEmergencyPasses,
      lastEmergencyUsed,
      isOnboardingDone,
      appVersion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MindfulSettings &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.accentColor == this.accentColor &&
          other.username == this.username &&
          other.localeCode == this.localeCode &&
          other.useAmoledDark == this.useAmoledDark &&
          other.useDynamicColors == this.useDynamicColors &&
          other.defaultHomeTab == this.defaultHomeTab &&
          other.usageHistoryWeeks == this.usageHistoryWeeks &&
          other.leftEmergencyPasses == this.leftEmergencyPasses &&
          other.lastEmergencyUsed == this.lastEmergencyUsed &&
          other.isOnboardingDone == this.isOnboardingDone &&
          other.appVersion == this.appVersion);
}

class MindfulSettingsTableCompanion extends UpdateCompanion<MindfulSettings> {
  final Value<int> id;
  final Value<AppThemeMode> themeMode;
  final Value<String> accentColor;
  final Value<String> username;
  final Value<String> localeCode;
  final Value<bool> useAmoledDark;
  final Value<bool> useDynamicColors;
  final Value<DefaultHomeTab> defaultHomeTab;
  final Value<int> usageHistoryWeeks;
  final Value<int> leftEmergencyPasses;
  final Value<DateTime> lastEmergencyUsed;
  final Value<bool> isOnboardingDone;
  final Value<String> appVersion;
  const MindfulSettingsTableCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.username = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.useAmoledDark = const Value.absent(),
    this.useDynamicColors = const Value.absent(),
    this.defaultHomeTab = const Value.absent(),
    this.usageHistoryWeeks = const Value.absent(),
    this.leftEmergencyPasses = const Value.absent(),
    this.lastEmergencyUsed = const Value.absent(),
    this.isOnboardingDone = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  MindfulSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.username = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.useAmoledDark = const Value.absent(),
    this.useDynamicColors = const Value.absent(),
    this.defaultHomeTab = const Value.absent(),
    this.usageHistoryWeeks = const Value.absent(),
    this.leftEmergencyPasses = const Value.absent(),
    this.lastEmergencyUsed = const Value.absent(),
    this.isOnboardingDone = const Value.absent(),
    this.appVersion = const Value.absent(),
  });
  static Insertable<MindfulSettings> custom({
    Expression<int>? id,
    Expression<int>? themeMode,
    Expression<String>? accentColor,
    Expression<String>? username,
    Expression<String>? localeCode,
    Expression<bool>? useAmoledDark,
    Expression<bool>? useDynamicColors,
    Expression<int>? defaultHomeTab,
    Expression<int>? usageHistoryWeeks,
    Expression<int>? leftEmergencyPasses,
    Expression<DateTime>? lastEmergencyUsed,
    Expression<bool>? isOnboardingDone,
    Expression<String>? appVersion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (accentColor != null) 'accent_color': accentColor,
      if (username != null) 'username': username,
      if (localeCode != null) 'locale_code': localeCode,
      if (useAmoledDark != null) 'use_amoled_dark': useAmoledDark,
      if (useDynamicColors != null) 'use_dynamic_colors': useDynamicColors,
      if (defaultHomeTab != null) 'default_home_tab': defaultHomeTab,
      if (usageHistoryWeeks != null) 'usage_history_weeks': usageHistoryWeeks,
      if (leftEmergencyPasses != null)
        'left_emergency_passes': leftEmergencyPasses,
      if (lastEmergencyUsed != null) 'last_emergency_used': lastEmergencyUsed,
      if (isOnboardingDone != null) 'is_onboarding_done': isOnboardingDone,
      if (appVersion != null) 'app_version': appVersion,
    });
  }

  MindfulSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<AppThemeMode>? themeMode,
      Value<String>? accentColor,
      Value<String>? username,
      Value<String>? localeCode,
      Value<bool>? useAmoledDark,
      Value<bool>? useDynamicColors,
      Value<DefaultHomeTab>? defaultHomeTab,
      Value<int>? usageHistoryWeeks,
      Value<int>? leftEmergencyPasses,
      Value<DateTime>? lastEmergencyUsed,
      Value<bool>? isOnboardingDone,
      Value<String>? appVersion}) {
    return MindfulSettingsTableCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      accentColor: accentColor ?? this.accentColor,
      username: username ?? this.username,
      localeCode: localeCode ?? this.localeCode,
      useAmoledDark: useAmoledDark ?? this.useAmoledDark,
      useDynamicColors: useDynamicColors ?? this.useDynamicColors,
      defaultHomeTab: defaultHomeTab ?? this.defaultHomeTab,
      usageHistoryWeeks: usageHistoryWeeks ?? this.usageHistoryWeeks,
      leftEmergencyPasses: leftEmergencyPasses ?? this.leftEmergencyPasses,
      lastEmergencyUsed: lastEmergencyUsed ?? this.lastEmergencyUsed,
      isOnboardingDone: isOnboardingDone ?? this.isOnboardingDone,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>($MindfulSettingsTableTable
          .$converterthemeMode
          .toSql(themeMode.value));
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<String>(accentColor.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (localeCode.present) {
      map['locale_code'] = Variable<String>(localeCode.value);
    }
    if (useAmoledDark.present) {
      map['use_amoled_dark'] = Variable<bool>(useAmoledDark.value);
    }
    if (useDynamicColors.present) {
      map['use_dynamic_colors'] = Variable<bool>(useDynamicColors.value);
    }
    if (defaultHomeTab.present) {
      map['default_home_tab'] = Variable<int>($MindfulSettingsTableTable
          .$converterdefaultHomeTab
          .toSql(defaultHomeTab.value));
    }
    if (usageHistoryWeeks.present) {
      map['usage_history_weeks'] = Variable<int>(usageHistoryWeeks.value);
    }
    if (leftEmergencyPasses.present) {
      map['left_emergency_passes'] = Variable<int>(leftEmergencyPasses.value);
    }
    if (lastEmergencyUsed.present) {
      map['last_emergency_used'] = Variable<DateTime>(lastEmergencyUsed.value);
    }
    if (isOnboardingDone.present) {
      map['is_onboarding_done'] = Variable<bool>(isOnboardingDone.value);
    }
    if (appVersion.present) {
      map['app_version'] = Variable<String>(appVersion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MindfulSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('accentColor: $accentColor, ')
          ..write('username: $username, ')
          ..write('localeCode: $localeCode, ')
          ..write('useAmoledDark: $useAmoledDark, ')
          ..write('useDynamicColors: $useDynamicColors, ')
          ..write('defaultHomeTab: $defaultHomeTab, ')
          ..write('usageHistoryWeeks: $usageHistoryWeeks, ')
          ..write('leftEmergencyPasses: $leftEmergencyPasses, ')
          ..write('lastEmergencyUsed: $lastEmergencyUsed, ')
          ..write('isOnboardingDone: $isOnboardingDone, ')
          ..write('appVersion: $appVersion')
          ..write(')'))
        .toString();
  }
}

class $WellbeingTableTable extends WellbeingTable
    with TableInfo<$WellbeingTableTable, Wellbeing> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WellbeingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _allowedShortsTimeSecMeta =
      const VerificationMeta('allowedShortsTimeSec');
  @override
  late final GeneratedColumn<int> allowedShortsTimeSec = GeneratedColumn<int>(
      'allowed_shorts_time_sec', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30 * 60));
  static const VerificationMeta _instagramUsageLimitSecMeta =
      const VerificationMeta('instagramUsageLimitSec');
  @override
  late final GeneratedColumn<int> instagramUsageLimitSec = GeneratedColumn<int>(
      'instagram_usage_limit_sec', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<List<PlatformFeatures>, String>
      blockedFeatures = GeneratedColumn<String>(
              'blocked_features', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(jsonEncode([])))
          .withConverter<List<PlatformFeatures>>(
              $WellbeingTableTable.$converterblockedFeatures);
  static const VerificationMeta _blockNsfwSitesMeta =
      const VerificationMeta('blockNsfwSites');
  @override
  late final GeneratedColumn<bool> blockNsfwSites = GeneratedColumn<bool>(
      'block_nsfw_sites', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("block_nsfw_sites" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      blockedWebsites = GeneratedColumn<String>(
              'blocked_websites', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(jsonEncode([])))
          .withConverter<List<String>>(
              $WellbeingTableTable.$converterblockedWebsites);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      nsfwWebsites = GeneratedColumn<String>(
              'nsfw_websites', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(jsonEncode([])))
          .withConverter<List<String>>(
              $WellbeingTableTable.$converternsfwWebsites);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        allowedShortsTimeSec,
        instagramUsageLimitSec,
        blockedFeatures,
        blockNsfwSites,
        blockedWebsites,
        nsfwWebsites
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wellbeing_table';
  @override
  VerificationContext validateIntegrity(Insertable<Wellbeing> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('allowed_shorts_time_sec')) {
      context.handle(
          _allowedShortsTimeSecMeta,
          allowedShortsTimeSec.isAcceptableOrUnknown(
              data['allowed_shorts_time_sec']!, _allowedShortsTimeSecMeta));
    }
    if (data.containsKey('instagram_usage_limit_sec')) {
      context.handle(
          _instagramUsageLimitSecMeta,
          instagramUsageLimitSec.isAcceptableOrUnknown(
              data['instagram_usage_limit_sec']!, _instagramUsageLimitSecMeta));
    }
    if (data.containsKey('block_nsfw_sites')) {
      context.handle(
          _blockNsfwSitesMeta,
          blockNsfwSites.isAcceptableOrUnknown(
              data['block_nsfw_sites']!, _blockNsfwSitesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wellbeing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wellbeing(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      allowedShortsTimeSec: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}allowed_shorts_time_sec'])!,
      instagramUsageLimitSec: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}instagram_usage_limit_sec'])!,
      blockedFeatures: $WellbeingTableTable.$converterblockedFeatures.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}blocked_features'])!),
      blockNsfwSites: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}block_nsfw_sites'])!,
      blockedWebsites: $WellbeingTableTable.$converterblockedWebsites.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}blocked_websites'])!),
      nsfwWebsites: $WellbeingTableTable.$converternsfwWebsites.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}nsfw_websites'])!),
    );
  }

  @override
  $WellbeingTableTable createAlias(String alias) {
    return $WellbeingTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<PlatformFeatures>, String>
      $converterblockedFeatures =
      const EnumListConverter<PlatformFeatures>(PlatformFeatures.values);
  static TypeConverter<List<String>, String> $converterblockedWebsites =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converternsfwWebsites =
      const StringListConverter();
}

class Wellbeing extends DataClass implements Insertable<Wellbeing> {
  /// Unique ID for wellbeing
  final int id;

  /// Allowed time for short content in SECONDS
  final int allowedShortsTimeSec;

  /// Daily Instagram usage in SECONDS after which reels get blocked.
  /// 0 means disabled, reels then follow [allowedShortsTimeSec].
  final int instagramUsageLimitSec;

  /// List of feature which are blocked
  final List<PlatformFeatures> blockedFeatures;

  /// Flag denoting if the nsfw or adult  websites are blocked or not
  /// i.e if accessibility service is filtering websites or not
  final bool blockNsfwSites;

  /// List of website hosts which are blocked.
  final List<String> blockedWebsites;

  /// List of website hosts which are nsfw.
  final List<String> nsfwWebsites;
  const Wellbeing(
      {required this.id,
      required this.allowedShortsTimeSec,
      required this.instagramUsageLimitSec,
      required this.blockedFeatures,
      required this.blockNsfwSites,
      required this.blockedWebsites,
      required this.nsfwWebsites});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['allowed_shorts_time_sec'] = Variable<int>(allowedShortsTimeSec);
    map['instagram_usage_limit_sec'] = Variable<int>(instagramUsageLimitSec);
    {
      map['blocked_features'] = Variable<String>($WellbeingTableTable
          .$converterblockedFeatures
          .toSql(blockedFeatures));
    }
    map['block_nsfw_sites'] = Variable<bool>(blockNsfwSites);
    {
      map['blocked_websites'] = Variable<String>($WellbeingTableTable
          .$converterblockedWebsites
          .toSql(blockedWebsites));
    }
    {
      map['nsfw_websites'] = Variable<String>(
          $WellbeingTableTable.$converternsfwWebsites.toSql(nsfwWebsites));
    }
    return map;
  }

  WellbeingTableCompanion toCompanion(bool nullToAbsent) {
    return WellbeingTableCompanion(
      id: Value(id),
      allowedShortsTimeSec: Value(allowedShortsTimeSec),
      instagramUsageLimitSec: Value(instagramUsageLimitSec),
      blockedFeatures: Value(blockedFeatures),
      blockNsfwSites: Value(blockNsfwSites),
      blockedWebsites: Value(blockedWebsites),
      nsfwWebsites: Value(nsfwWebsites),
    );
  }

  factory Wellbeing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wellbeing(
      id: serializer.fromJson<int>(json['id']),
      allowedShortsTimeSec:
          serializer.fromJson<int>(json['allowedShortsTimeSec']),
      instagramUsageLimitSec:
          serializer.fromJson<int>(json['instagramUsageLimitSec']),
      blockedFeatures:
          serializer.fromJson<List<PlatformFeatures>>(json['blockedFeatures']),
      blockNsfwSites: serializer.fromJson<bool>(json['blockNsfwSites']),
      blockedWebsites:
          serializer.fromJson<List<String>>(json['blockedWebsites']),
      nsfwWebsites: serializer.fromJson<List<String>>(json['nsfwWebsites']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'allowedShortsTimeSec': serializer.toJson<int>(allowedShortsTimeSec),
      'instagramUsageLimitSec': serializer.toJson<int>(instagramUsageLimitSec),
      'blockedFeatures':
          serializer.toJson<List<PlatformFeatures>>(blockedFeatures),
      'blockNsfwSites': serializer.toJson<bool>(blockNsfwSites),
      'blockedWebsites': serializer.toJson<List<String>>(blockedWebsites),
      'nsfwWebsites': serializer.toJson<List<String>>(nsfwWebsites),
    };
  }

  Wellbeing copyWith(
          {int? id,
          int? allowedShortsTimeSec,
          int? instagramUsageLimitSec,
          List<PlatformFeatures>? blockedFeatures,
          bool? blockNsfwSites,
          List<String>? blockedWebsites,
          List<String>? nsfwWebsites}) =>
      Wellbeing(
        id: id ?? this.id,
        allowedShortsTimeSec: allowedShortsTimeSec ?? this.allowedShortsTimeSec,
        instagramUsageLimitSec:
            instagramUsageLimitSec ?? this.instagramUsageLimitSec,
        blockedFeatures: blockedFeatures ?? this.blockedFeatures,
        blockNsfwSites: blockNsfwSites ?? this.blockNsfwSites,
        blockedWebsites: blockedWebsites ?? this.blockedWebsites,
        nsfwWebsites: nsfwWebsites ?? this.nsfwWebsites,
      );
  Wellbeing copyWithCompanion(WellbeingTableCompanion data) {
    return Wellbeing(
      id: data.id.present ? data.id.value : this.id,
      allowedShortsTimeSec: data.allowedShortsTimeSec.present
          ? data.allowedShortsTimeSec.value
          : this.allowedShortsTimeSec,
      instagramUsageLimitSec: data.instagramUsageLimitSec.present
          ? data.instagramUsageLimitSec.value
          : this.instagramUsageLimitSec,
      blockedFeatures: data.blockedFeatures.present
          ? data.blockedFeatures.value
          : this.blockedFeatures,
      blockNsfwSites: data.blockNsfwSites.present
          ? data.blockNsfwSites.value
          : this.blockNsfwSites,
      blockedWebsites: data.blockedWebsites.present
          ? data.blockedWebsites.value
          : this.blockedWebsites,
      nsfwWebsites: data.nsfwWebsites.present
          ? data.nsfwWebsites.value
          : this.nsfwWebsites,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Wellbeing(')
          ..write('id: $id, ')
          ..write('allowedShortsTimeSec: $allowedShortsTimeSec, ')
          ..write('instagramUsageLimitSec: $instagramUsageLimitSec, ')
          ..write('blockedFeatures: $blockedFeatures, ')
          ..write('blockNsfwSites: $blockNsfwSites, ')
          ..write('blockedWebsites: $blockedWebsites, ')
          ..write('nsfwWebsites: $nsfwWebsites')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      allowedShortsTimeSec,
      instagramUsageLimitSec,
      blockedFeatures,
      blockNsfwSites,
      blockedWebsites,
      nsfwWebsites);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wellbeing &&
          other.id == this.id &&
          other.allowedShortsTimeSec == this.allowedShortsTimeSec &&
          other.instagramUsageLimitSec == this.instagramUsageLimitSec &&
          other.blockedFeatures == this.blockedFeatures &&
          other.blockNsfwSites == this.blockNsfwSites &&
          other.blockedWebsites == this.blockedWebsites &&
          other.nsfwWebsites == this.nsfwWebsites);
}

class WellbeingTableCompanion extends UpdateCompanion<Wellbeing> {
  final Value<int> id;
  final Value<int> allowedShortsTimeSec;
  final Value<int> instagramUsageLimitSec;
  final Value<List<PlatformFeatures>> blockedFeatures;
  final Value<bool> blockNsfwSites;
  final Value<List<String>> blockedWebsites;
  final Value<List<String>> nsfwWebsites;
  const WellbeingTableCompanion({
    this.id = const Value.absent(),
    this.allowedShortsTimeSec = const Value.absent(),
    this.instagramUsageLimitSec = const Value.absent(),
    this.blockedFeatures = const Value.absent(),
    this.blockNsfwSites = const Value.absent(),
    this.blockedWebsites = const Value.absent(),
    this.nsfwWebsites = const Value.absent(),
  });
  WellbeingTableCompanion.insert({
    this.id = const Value.absent(),
    this.allowedShortsTimeSec = const Value.absent(),
    this.instagramUsageLimitSec = const Value.absent(),
    this.blockedFeatures = const Value.absent(),
    this.blockNsfwSites = const Value.absent(),
    this.blockedWebsites = const Value.absent(),
    this.nsfwWebsites = const Value.absent(),
  });
  static Insertable<Wellbeing> custom({
    Expression<int>? id,
    Expression<int>? allowedShortsTimeSec,
    Expression<int>? instagramUsageLimitSec,
    Expression<String>? blockedFeatures,
    Expression<bool>? blockNsfwSites,
    Expression<String>? blockedWebsites,
    Expression<String>? nsfwWebsites,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (allowedShortsTimeSec != null)
        'allowed_shorts_time_sec': allowedShortsTimeSec,
      if (instagramUsageLimitSec != null)
        'instagram_usage_limit_sec': instagramUsageLimitSec,
      if (blockedFeatures != null) 'blocked_features': blockedFeatures,
      if (blockNsfwSites != null) 'block_nsfw_sites': blockNsfwSites,
      if (blockedWebsites != null) 'blocked_websites': blockedWebsites,
      if (nsfwWebsites != null) 'nsfw_websites': nsfwWebsites,
    });
  }

  WellbeingTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? allowedShortsTimeSec,
      Value<int>? instagramUsageLimitSec,
      Value<List<PlatformFeatures>>? blockedFeatures,
      Value<bool>? blockNsfwSites,
      Value<List<String>>? blockedWebsites,
      Value<List<String>>? nsfwWebsites}) {
    return WellbeingTableCompanion(
      id: id ?? this.id,
      allowedShortsTimeSec: allowedShortsTimeSec ?? this.allowedShortsTimeSec,
      instagramUsageLimitSec:
          instagramUsageLimitSec ?? this.instagramUsageLimitSec,
      blockedFeatures: blockedFeatures ?? this.blockedFeatures,
      blockNsfwSites: blockNsfwSites ?? this.blockNsfwSites,
      blockedWebsites: blockedWebsites ?? this.blockedWebsites,
      nsfwWebsites: nsfwWebsites ?? this.nsfwWebsites,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (allowedShortsTimeSec.present) {
      map['allowed_shorts_time_sec'] =
          Variable<int>(allowedShortsTimeSec.value);
    }
    if (instagramUsageLimitSec.present) {
      map['instagram_usage_limit_sec'] =
          Variable<int>(instagramUsageLimitSec.value);
    }
    if (blockedFeatures.present) {
      map['blocked_features'] = Variable<String>($WellbeingTableTable
          .$converterblockedFeatures
          .toSql(blockedFeatures.value));
    }
    if (blockNsfwSites.present) {
      map['block_nsfw_sites'] = Variable<bool>(blockNsfwSites.value);
    }
    if (blockedWebsites.present) {
      map['blocked_websites'] = Variable<String>($WellbeingTableTable
          .$converterblockedWebsites
          .toSql(blockedWebsites.value));
    }
    if (nsfwWebsites.present) {
      map['nsfw_websites'] = Variable<String>($WellbeingTableTable
          .$converternsfwWebsites
          .toSql(nsfwWebsites.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WellbeingTableCompanion(')
          ..write('id: $id, ')
          ..write('allowedShortsTimeSec: $allowedShortsTimeSec, ')
          ..write('instagramUsageLimitSec: $instagramUsageLimitSec, ')
          ..write('blockedFeatures: $blockedFeatures, ')
          ..write('blockNsfwSites: $blockNsfwSites, ')
          ..write('blockedWebsites: $blockedWebsites, ')
          ..write('nsfwWebsites: $nsfwWebsites')
          ..write(')'))
        .toString();
  }
}

class $SharedUniqueDataTableTable extends SharedUniqueDataTable
    with TableInfo<$SharedUniqueDataTableTable, SharedUniqueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SharedUniqueDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      excludedApps = GeneratedColumn<String>(
              'excluded_apps', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(jsonEncode([])))
          .withConverter<List<String>>(
              $SharedUniqueDataTableTable.$converterexcludedApps);
  @override
  List<GeneratedColumn> get $columns => [id, excludedApps];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shared_unique_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<SharedUniqueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SharedUniqueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SharedUniqueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      excludedApps: $SharedUniqueDataTableTable.$converterexcludedApps.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}excluded_apps'])!),
    );
  }

  @override
  $SharedUniqueDataTableTable createAlias(String alias) {
    return $SharedUniqueDataTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterexcludedApps =
      const StringListConverter();
}

class SharedUniqueData extends DataClass
    implements Insertable<SharedUniqueData> {
  /// Unique ID for Shared Data
  final int id;

  /// List of app's packages which are excluded from the aggregated usage statistics.
  final List<String> excludedApps;
  const SharedUniqueData({required this.id, required this.excludedApps});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['excluded_apps'] = Variable<String>($SharedUniqueDataTableTable
          .$converterexcludedApps
          .toSql(excludedApps));
    }
    return map;
  }

  SharedUniqueDataTableCompanion toCompanion(bool nullToAbsent) {
    return SharedUniqueDataTableCompanion(
      id: Value(id),
      excludedApps: Value(excludedApps),
    );
  }

  factory SharedUniqueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SharedUniqueData(
      id: serializer.fromJson<int>(json['id']),
      excludedApps: serializer.fromJson<List<String>>(json['excludedApps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'excludedApps': serializer.toJson<List<String>>(excludedApps),
    };
  }

  SharedUniqueData copyWith({int? id, List<String>? excludedApps}) =>
      SharedUniqueData(
        id: id ?? this.id,
        excludedApps: excludedApps ?? this.excludedApps,
      );
  SharedUniqueData copyWithCompanion(SharedUniqueDataTableCompanion data) {
    return SharedUniqueData(
      id: data.id.present ? data.id.value : this.id,
      excludedApps: data.excludedApps.present
          ? data.excludedApps.value
          : this.excludedApps,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SharedUniqueData(')
          ..write('id: $id, ')
          ..write('excludedApps: $excludedApps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, excludedApps);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SharedUniqueData &&
          other.id == this.id &&
          other.excludedApps == this.excludedApps);
}

class SharedUniqueDataTableCompanion extends UpdateCompanion<SharedUniqueData> {
  final Value<int> id;
  final Value<List<String>> excludedApps;
  const SharedUniqueDataTableCompanion({
    this.id = const Value.absent(),
    this.excludedApps = const Value.absent(),
  });
  SharedUniqueDataTableCompanion.insert({
    this.id = const Value.absent(),
    this.excludedApps = const Value.absent(),
  });
  static Insertable<SharedUniqueData> custom({
    Expression<int>? id,
    Expression<String>? excludedApps,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (excludedApps != null) 'excluded_apps': excludedApps,
    });
  }

  SharedUniqueDataTableCompanion copyWith(
      {Value<int>? id, Value<List<String>>? excludedApps}) {
    return SharedUniqueDataTableCompanion(
      id: id ?? this.id,
      excludedApps: excludedApps ?? this.excludedApps,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (excludedApps.present) {
      map['excluded_apps'] = Variable<String>($SharedUniqueDataTableTable
          .$converterexcludedApps
          .toSql(excludedApps.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SharedUniqueDataTableCompanion(')
          ..write('id: $id, ')
          ..write('excludedApps: $excludedApps')
          ..write(')'))
        .toString();
  }
}

class $AppUsageTableTable extends AppUsageTable
    with TableInfo<$AppUsageTableTable, AppUsage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppUsageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _packageNameMeta =
      const VerificationMeta('packageName');
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
      'package_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime(0)));
  static const VerificationMeta _screenTimeMeta =
      const VerificationMeta('screenTime');
  @override
  late final GeneratedColumn<int> screenTime = GeneratedColumn<int>(
      'screen_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _mobileDataMeta =
      const VerificationMeta('mobileData');
  @override
  late final GeneratedColumn<int> mobileData = GeneratedColumn<int>(
      'mobile_data', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _wifiDataMeta =
      const VerificationMeta('wifiData');
  @override
  late final GeneratedColumn<int> wifiData = GeneratedColumn<int>(
      'wifi_data', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [packageName, date, screenTime, mobileData, wifiData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_usage_table';
  @override
  VerificationContext validateIntegrity(Insertable<AppUsage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('package_name')) {
      context.handle(
          _packageNameMeta,
          packageName.isAcceptableOrUnknown(
              data['package_name']!, _packageNameMeta));
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('screen_time')) {
      context.handle(
          _screenTimeMeta,
          screenTime.isAcceptableOrUnknown(
              data['screen_time']!, _screenTimeMeta));
    }
    if (data.containsKey('mobile_data')) {
      context.handle(
          _mobileDataMeta,
          mobileData.isAcceptableOrUnknown(
              data['mobile_data']!, _mobileDataMeta));
    }
    if (data.containsKey('wifi_data')) {
      context.handle(_wifiDataMeta,
          wifiData.isAcceptableOrUnknown(data['wifi_data']!, _wifiDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {packageName, date};
  @override
  AppUsage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUsage(
      packageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}package_name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      screenTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screen_time'])!,
      mobileData: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mobile_data'])!,
      wifiData: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wifi_data'])!,
    );
  }

  @override
  $AppUsageTableTable createAlias(String alias) {
    return $AppUsageTableTable(attachedDatabase, alias);
  }
}

class AppUsage extends DataClass implements Insertable<AppUsage> {
  /// Package name of the related app
  final String packageName;

  /// The day [DateTime] but date only of the record
  final DateTime date;

  /// Package screen time of the related app
  final int screenTime;

  /// Package mobile data usage of the related app
  final int mobileData;

  /// Package wifi data usage of the related app
  final int wifiData;
  const AppUsage(
      {required this.packageName,
      required this.date,
      required this.screenTime,
      required this.mobileData,
      required this.wifiData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['package_name'] = Variable<String>(packageName);
    map['date'] = Variable<DateTime>(date);
    map['screen_time'] = Variable<int>(screenTime);
    map['mobile_data'] = Variable<int>(mobileData);
    map['wifi_data'] = Variable<int>(wifiData);
    return map;
  }

  AppUsageTableCompanion toCompanion(bool nullToAbsent) {
    return AppUsageTableCompanion(
      packageName: Value(packageName),
      date: Value(date),
      screenTime: Value(screenTime),
      mobileData: Value(mobileData),
      wifiData: Value(wifiData),
    );
  }

  factory AppUsage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUsage(
      packageName: serializer.fromJson<String>(json['packageName']),
      date: serializer.fromJson<DateTime>(json['date']),
      screenTime: serializer.fromJson<int>(json['screenTime']),
      mobileData: serializer.fromJson<int>(json['mobileData']),
      wifiData: serializer.fromJson<int>(json['wifiData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'packageName': serializer.toJson<String>(packageName),
      'date': serializer.toJson<DateTime>(date),
      'screenTime': serializer.toJson<int>(screenTime),
      'mobileData': serializer.toJson<int>(mobileData),
      'wifiData': serializer.toJson<int>(wifiData),
    };
  }

  AppUsage copyWith(
          {String? packageName,
          DateTime? date,
          int? screenTime,
          int? mobileData,
          int? wifiData}) =>
      AppUsage(
        packageName: packageName ?? this.packageName,
        date: date ?? this.date,
        screenTime: screenTime ?? this.screenTime,
        mobileData: mobileData ?? this.mobileData,
        wifiData: wifiData ?? this.wifiData,
      );
  AppUsage copyWithCompanion(AppUsageTableCompanion data) {
    return AppUsage(
      packageName:
          data.packageName.present ? data.packageName.value : this.packageName,
      date: data.date.present ? data.date.value : this.date,
      screenTime:
          data.screenTime.present ? data.screenTime.value : this.screenTime,
      mobileData:
          data.mobileData.present ? data.mobileData.value : this.mobileData,
      wifiData: data.wifiData.present ? data.wifiData.value : this.wifiData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUsage(')
          ..write('packageName: $packageName, ')
          ..write('date: $date, ')
          ..write('screenTime: $screenTime, ')
          ..write('mobileData: $mobileData, ')
          ..write('wifiData: $wifiData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(packageName, date, screenTime, mobileData, wifiData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUsage &&
          other.packageName == this.packageName &&
          other.date == this.date &&
          other.screenTime == this.screenTime &&
          other.mobileData == this.mobileData &&
          other.wifiData == this.wifiData);
}

class AppUsageTableCompanion extends UpdateCompanion<AppUsage> {
  final Value<String> packageName;
  final Value<DateTime> date;
  final Value<int> screenTime;
  final Value<int> mobileData;
  final Value<int> wifiData;
  final Value<int> rowid;
  const AppUsageTableCompanion({
    this.packageName = const Value.absent(),
    this.date = const Value.absent(),
    this.screenTime = const Value.absent(),
    this.mobileData = const Value.absent(),
    this.wifiData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppUsageTableCompanion.insert({
    required String packageName,
    this.date = const Value.absent(),
    this.screenTime = const Value.absent(),
    this.mobileData = const Value.absent(),
    this.wifiData = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : packageName = Value(packageName);
  static Insertable<AppUsage> custom({
    Expression<String>? packageName,
    Expression<DateTime>? date,
    Expression<int>? screenTime,
    Expression<int>? mobileData,
    Expression<int>? wifiData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (packageName != null) 'package_name': packageName,
      if (date != null) 'date': date,
      if (screenTime != null) 'screen_time': screenTime,
      if (mobileData != null) 'mobile_data': mobileData,
      if (wifiData != null) 'wifi_data': wifiData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppUsageTableCompanion copyWith(
      {Value<String>? packageName,
      Value<DateTime>? date,
      Value<int>? screenTime,
      Value<int>? mobileData,
      Value<int>? wifiData,
      Value<int>? rowid}) {
    return AppUsageTableCompanion(
      packageName: packageName ?? this.packageName,
      date: date ?? this.date,
      screenTime: screenTime ?? this.screenTime,
      mobileData: mobileData ?? this.mobileData,
      wifiData: wifiData ?? this.wifiData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (screenTime.present) {
      map['screen_time'] = Variable<int>(screenTime.value);
    }
    if (mobileData.present) {
      map['mobile_data'] = Variable<int>(mobileData.value);
    }
    if (wifiData.present) {
      map['wifi_data'] = Variable<int>(wifiData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppUsageTableCompanion(')
          ..write('packageName: $packageName, ')
          ..write('date: $date, ')
          ..write('screenTime: $screenTime, ')
          ..write('mobileData: $mobileData, ')
          ..write('wifiData: $wifiData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationSettingsTableTable extends NotificationSettingsTable
    with TableInfo<$NotificationSettingsTableTable, NotificationSettings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<RecapType, int> recapType =
      GeneratedColumn<int>('recap_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<RecapType>(
              $NotificationSettingsTableTable.$converterrecapType);
  static const VerificationMeta _notificationHistoryWeeksMeta =
      const VerificationMeta('notificationHistoryWeeks');
  @override
  late final GeneratedColumn<int> notificationHistoryWeeks =
      GeneratedColumn<int>('notification_history_weeks', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(2));
  static const VerificationMeta _storeNonBatchedTooMeta =
      const VerificationMeta('storeNonBatchedToo');
  @override
  late final GeneratedColumn<bool> storeNonBatchedToo = GeneratedColumn<bool>(
      'store_non_batched_too', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("store_non_batched_too" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      batchedApps = GeneratedColumn<String>('batched_apps', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: Constant(jsonEncode([])))
          .withConverter<List<String>>(
              $NotificationSettingsTableTable.$converterbatchedApps);
  @override
  late final GeneratedColumnWithTypeConverter<List<NotificationSchedule>,
      String> schedules = GeneratedColumn<String>(
          'schedules', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue:
              Constant(jsonEncode(defaultNotificationSettingsModel.schedules)))
      .withConverter<List<NotificationSchedule>>(
          $NotificationSettingsTableTable.$converterschedules);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        recapType,
        notificationHistoryWeeks,
        storeNonBatchedToo,
        batchedApps,
        schedules
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationSettings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notification_history_weeks')) {
      context.handle(
          _notificationHistoryWeeksMeta,
          notificationHistoryWeeks.isAcceptableOrUnknown(
              data['notification_history_weeks']!,
              _notificationHistoryWeeksMeta));
    }
    if (data.containsKey('store_non_batched_too')) {
      context.handle(
          _storeNonBatchedTooMeta,
          storeNonBatchedToo.isAcceptableOrUnknown(
              data['store_non_batched_too']!, _storeNonBatchedTooMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationSettings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationSettings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      recapType: $NotificationSettingsTableTable.$converterrecapType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}recap_type'])!),
      notificationHistoryWeeks: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}notification_history_weeks'])!,
      storeNonBatchedToo: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}store_non_batched_too'])!,
      batchedApps: $NotificationSettingsTableTable.$converterbatchedApps
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}batched_apps'])!),
      schedules: $NotificationSettingsTableTable.$converterschedules.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}schedules'])!),
    );
  }

  @override
  $NotificationSettingsTableTable createAlias(String alias) {
    return $NotificationSettingsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RecapType, int, int> $converterrecapType =
      const EnumIndexConverter<RecapType>(RecapType.values);
  static TypeConverter<List<String>, String> $converterbatchedApps =
      const StringListConverter();
  static TypeConverter<List<NotificationSchedule>, String> $converterschedules =
      const NotificationScheduleListConverter();
}

class NotificationSettings extends DataClass
    implements Insertable<NotificationSettings> {
  /// Unique ID for notification config
  final int id;

  /// Notifications recap type for schedule triggered [RecapType]
  final RecapType recapType;

  /// Maximum number of weeks till the app's notification history will be kept
  /// Default is 2 weeks.
  final int notificationHistoryWeeks;

  /// Boolean denoting if to store notifications of non-batched apps too.
  final bool storeNonBatchedToo;

  /// List of app's packages whose notifications are batched.
  final List<String> batchedApps;

  /// List of batching schedules
  final List<NotificationSchedule> schedules;
  const NotificationSettings(
      {required this.id,
      required this.recapType,
      required this.notificationHistoryWeeks,
      required this.storeNonBatchedToo,
      required this.batchedApps,
      required this.schedules});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['recap_type'] = Variable<int>(
          $NotificationSettingsTableTable.$converterrecapType.toSql(recapType));
    }
    map['notification_history_weeks'] = Variable<int>(notificationHistoryWeeks);
    map['store_non_batched_too'] = Variable<bool>(storeNonBatchedToo);
    {
      map['batched_apps'] = Variable<String>($NotificationSettingsTableTable
          .$converterbatchedApps
          .toSql(batchedApps));
    }
    {
      map['schedules'] = Variable<String>(
          $NotificationSettingsTableTable.$converterschedules.toSql(schedules));
    }
    return map;
  }

  NotificationSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationSettingsTableCompanion(
      id: Value(id),
      recapType: Value(recapType),
      notificationHistoryWeeks: Value(notificationHistoryWeeks),
      storeNonBatchedToo: Value(storeNonBatchedToo),
      batchedApps: Value(batchedApps),
      schedules: Value(schedules),
    );
  }

  factory NotificationSettings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationSettings(
      id: serializer.fromJson<int>(json['id']),
      recapType: $NotificationSettingsTableTable.$converterrecapType
          .fromJson(serializer.fromJson<int>(json['recapType'])),
      notificationHistoryWeeks:
          serializer.fromJson<int>(json['notificationHistoryWeeks']),
      storeNonBatchedToo: serializer.fromJson<bool>(json['storeNonBatchedToo']),
      batchedApps: serializer.fromJson<List<String>>(json['batchedApps']),
      schedules:
          serializer.fromJson<List<NotificationSchedule>>(json['schedules']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recapType': serializer.toJson<int>($NotificationSettingsTableTable
          .$converterrecapType
          .toJson(recapType)),
      'notificationHistoryWeeks':
          serializer.toJson<int>(notificationHistoryWeeks),
      'storeNonBatchedToo': serializer.toJson<bool>(storeNonBatchedToo),
      'batchedApps': serializer.toJson<List<String>>(batchedApps),
      'schedules': serializer.toJson<List<NotificationSchedule>>(schedules),
    };
  }

  NotificationSettings copyWith(
          {int? id,
          RecapType? recapType,
          int? notificationHistoryWeeks,
          bool? storeNonBatchedToo,
          List<String>? batchedApps,
          List<NotificationSchedule>? schedules}) =>
      NotificationSettings(
        id: id ?? this.id,
        recapType: recapType ?? this.recapType,
        notificationHistoryWeeks:
            notificationHistoryWeeks ?? this.notificationHistoryWeeks,
        storeNonBatchedToo: storeNonBatchedToo ?? this.storeNonBatchedToo,
        batchedApps: batchedApps ?? this.batchedApps,
        schedules: schedules ?? this.schedules,
      );
  NotificationSettings copyWithCompanion(
      NotificationSettingsTableCompanion data) {
    return NotificationSettings(
      id: data.id.present ? data.id.value : this.id,
      recapType: data.recapType.present ? data.recapType.value : this.recapType,
      notificationHistoryWeeks: data.notificationHistoryWeeks.present
          ? data.notificationHistoryWeeks.value
          : this.notificationHistoryWeeks,
      storeNonBatchedToo: data.storeNonBatchedToo.present
          ? data.storeNonBatchedToo.value
          : this.storeNonBatchedToo,
      batchedApps:
          data.batchedApps.present ? data.batchedApps.value : this.batchedApps,
      schedules: data.schedules.present ? data.schedules.value : this.schedules,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettings(')
          ..write('id: $id, ')
          ..write('recapType: $recapType, ')
          ..write('notificationHistoryWeeks: $notificationHistoryWeeks, ')
          ..write('storeNonBatchedToo: $storeNonBatchedToo, ')
          ..write('batchedApps: $batchedApps, ')
          ..write('schedules: $schedules')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recapType, notificationHistoryWeeks,
      storeNonBatchedToo, batchedApps, schedules);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSettings &&
          other.id == this.id &&
          other.recapType == this.recapType &&
          other.notificationHistoryWeeks == this.notificationHistoryWeeks &&
          other.storeNonBatchedToo == this.storeNonBatchedToo &&
          other.batchedApps == this.batchedApps &&
          other.schedules == this.schedules);
}

class NotificationSettingsTableCompanion
    extends UpdateCompanion<NotificationSettings> {
  final Value<int> id;
  final Value<RecapType> recapType;
  final Value<int> notificationHistoryWeeks;
  final Value<bool> storeNonBatchedToo;
  final Value<List<String>> batchedApps;
  final Value<List<NotificationSchedule>> schedules;
  const NotificationSettingsTableCompanion({
    this.id = const Value.absent(),
    this.recapType = const Value.absent(),
    this.notificationHistoryWeeks = const Value.absent(),
    this.storeNonBatchedToo = const Value.absent(),
    this.batchedApps = const Value.absent(),
    this.schedules = const Value.absent(),
  });
  NotificationSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.recapType = const Value.absent(),
    this.notificationHistoryWeeks = const Value.absent(),
    this.storeNonBatchedToo = const Value.absent(),
    this.batchedApps = const Value.absent(),
    this.schedules = const Value.absent(),
  });
  static Insertable<NotificationSettings> custom({
    Expression<int>? id,
    Expression<int>? recapType,
    Expression<int>? notificationHistoryWeeks,
    Expression<bool>? storeNonBatchedToo,
    Expression<String>? batchedApps,
    Expression<String>? schedules,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recapType != null) 'recap_type': recapType,
      if (notificationHistoryWeeks != null)
        'notification_history_weeks': notificationHistoryWeeks,
      if (storeNonBatchedToo != null)
        'store_non_batched_too': storeNonBatchedToo,
      if (batchedApps != null) 'batched_apps': batchedApps,
      if (schedules != null) 'schedules': schedules,
    });
  }

  NotificationSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<RecapType>? recapType,
      Value<int>? notificationHistoryWeeks,
      Value<bool>? storeNonBatchedToo,
      Value<List<String>>? batchedApps,
      Value<List<NotificationSchedule>>? schedules}) {
    return NotificationSettingsTableCompanion(
      id: id ?? this.id,
      recapType: recapType ?? this.recapType,
      notificationHistoryWeeks:
          notificationHistoryWeeks ?? this.notificationHistoryWeeks,
      storeNonBatchedToo: storeNonBatchedToo ?? this.storeNonBatchedToo,
      batchedApps: batchedApps ?? this.batchedApps,
      schedules: schedules ?? this.schedules,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recapType.present) {
      map['recap_type'] = Variable<int>($NotificationSettingsTableTable
          .$converterrecapType
          .toSql(recapType.value));
    }
    if (notificationHistoryWeeks.present) {
      map['notification_history_weeks'] =
          Variable<int>(notificationHistoryWeeks.value);
    }
    if (storeNonBatchedToo.present) {
      map['store_non_batched_too'] = Variable<bool>(storeNonBatchedToo.value);
    }
    if (batchedApps.present) {
      map['batched_apps'] = Variable<String>($NotificationSettingsTableTable
          .$converterbatchedApps
          .toSql(batchedApps.value));
    }
    if (schedules.present) {
      map['schedules'] = Variable<String>($NotificationSettingsTableTable
          .$converterschedules
          .toSql(schedules.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('recapType: $recapType, ')
          ..write('notificationHistoryWeeks: $notificationHistoryWeeks, ')
          ..write('storeNonBatchedToo: $storeNonBatchedToo, ')
          ..write('batchedApps: $batchedApps, ')
          ..write('schedules: $schedules')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTableTable extends NotificationsTable
    with TableInfo<$NotificationsTableTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _packageNameMeta =
      const VerificationMeta('packageName');
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
      'package_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<DateTime> timeStamp = GeneratedColumn<DateTime>(
      'time_stamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime(0)));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, key, packageName, timeStamp, title, content, category, isRead];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications_table';
  @override
  VerificationContext validateIntegrity(Insertable<Notification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('package_name')) {
      context.handle(
          _packageNameMeta,
          packageName.isAcceptableOrUnknown(
              data['package_name']!, _packageNameMeta));
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      packageName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}package_name'])!,
      timeStamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time_stamp'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
    );
  }

  @override
  $NotificationsTableTable createAlias(String alias) {
    return $NotificationsTableTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  /// Unique ID for notification
  final int id;

  /// Unique key of this notification created by system for live link
  final String key;

  /// Package name of the related app
  final String packageName;

  /// [DateTime] when the notification is pushed
  final DateTime timeStamp;

  /// The title of the notification
  final String title;

  /// The content of the notification
  final String content;

  /// The category of the notification
  final String category;

  /// Boolean denoting the status of this notification (Read/Unread)
  final bool isRead;
  const Notification(
      {required this.id,
      required this.key,
      required this.packageName,
      required this.timeStamp,
      required this.title,
      required this.content,
      required this.category,
      required this.isRead});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['package_name'] = Variable<String>(packageName);
    map['time_stamp'] = Variable<DateTime>(timeStamp);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['category'] = Variable<String>(category);
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  NotificationsTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationsTableCompanion(
      id: Value(id),
      key: Value(key),
      packageName: Value(packageName),
      timeStamp: Value(timeStamp),
      title: Value(title),
      content: Value(content),
      category: Value(category),
      isRead: Value(isRead),
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      packageName: serializer.fromJson<String>(json['packageName']),
      timeStamp: serializer.fromJson<DateTime>(json['timeStamp']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<String>(json['category']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'packageName': serializer.toJson<String>(packageName),
      'timeStamp': serializer.toJson<DateTime>(timeStamp),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<String>(category),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  Notification copyWith(
          {int? id,
          String? key,
          String? packageName,
          DateTime? timeStamp,
          String? title,
          String? content,
          String? category,
          bool? isRead}) =>
      Notification(
        id: id ?? this.id,
        key: key ?? this.key,
        packageName: packageName ?? this.packageName,
        timeStamp: timeStamp ?? this.timeStamp,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category ?? this.category,
        isRead: isRead ?? this.isRead,
      );
  Notification copyWithCompanion(NotificationsTableCompanion data) {
    return Notification(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      packageName:
          data.packageName.present ? data.packageName.value : this.packageName,
      timeStamp: data.timeStamp.present ? data.timeStamp.value : this.timeStamp,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      category: data.category.present ? data.category.value : this.category,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('packageName: $packageName, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, key, packageName, timeStamp, title, content, category, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.key == this.key &&
          other.packageName == this.packageName &&
          other.timeStamp == this.timeStamp &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.isRead == this.isRead);
}

class NotificationsTableCompanion extends UpdateCompanion<Notification> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> packageName;
  final Value<DateTime> timeStamp;
  final Value<String> title;
  final Value<String> content;
  final Value<String> category;
  final Value<bool> isRead;
  const NotificationsTableCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.packageName = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  NotificationsTableCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String packageName,
    this.timeStamp = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.isRead = const Value.absent(),
  })  : key = Value(key),
        packageName = Value(packageName);
  static Insertable<Notification> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? packageName,
    Expression<DateTime>? timeStamp,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? category,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (packageName != null) 'package_name': packageName,
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (category != null) 'category': category,
      if (isRead != null) 'is_read': isRead,
    });
  }

  NotificationsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<String>? packageName,
      Value<DateTime>? timeStamp,
      Value<String>? title,
      Value<String>? content,
      Value<String>? category,
      Value<bool>? isRead}) {
    return NotificationsTableCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      packageName: packageName ?? this.packageName,
      timeStamp: timeStamp ?? this.timeStamp,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (timeStamp.present) {
      map['time_stamp'] = Variable<DateTime>(timeStamp.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsTableCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('packageName: $packageName, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppRestrictionTableTable appRestrictionTable =
      $AppRestrictionTableTable(this);
  late final $CrashLogsTableTable crashLogsTable = $CrashLogsTableTable(this);
  late final $MindfulSettingsTableTable mindfulSettingsTable =
      $MindfulSettingsTableTable(this);
  late final $WellbeingTableTable wellbeingTable = $WellbeingTableTable(this);
  late final $SharedUniqueDataTableTable sharedUniqueDataTable =
      $SharedUniqueDataTableTable(this);
  late final $AppUsageTableTable appUsageTable = $AppUsageTableTable(this);
  late final $NotificationSettingsTableTable notificationSettingsTable =
      $NotificationSettingsTableTable(this);
  late final $NotificationsTableTable notificationsTable =
      $NotificationsTableTable(this);
  late final UniqueRecordsDao uniqueRecordsDao =
      UniqueRecordsDao(this as AppDatabase);
  late final DynamicRecordsDao dynamicRecordsDao =
      DynamicRecordsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        appRestrictionTable,
        crashLogsTable,
        mindfulSettingsTable,
        wellbeingTable,
        sharedUniqueDataTable,
        appUsageTable,
        notificationSettingsTable,
        notificationsTable
      ];
}

typedef $$AppRestrictionTableTableCreateCompanionBuilder
    = AppRestrictionTableCompanion Function({
  required String appPackage,
  Value<int> timerSec,
  Value<int> launchLimit,
  Value<TimeOfDayAdapter> activePeriodStart,
  Value<TimeOfDayAdapter> activePeriodEnd,
  Value<int> periodDurationInMins,
  Value<bool> canAccessInternet,
  Value<ReminderType> reminderType,
  Value<int> rowid,
});
typedef $$AppRestrictionTableTableUpdateCompanionBuilder
    = AppRestrictionTableCompanion Function({
  Value<String> appPackage,
  Value<int> timerSec,
  Value<int> launchLimit,
  Value<TimeOfDayAdapter> activePeriodStart,
  Value<TimeOfDayAdapter> activePeriodEnd,
  Value<int> periodDurationInMins,
  Value<bool> canAccessInternet,
  Value<ReminderType> reminderType,
  Value<int> rowid,
});

class $$AppRestrictionTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppRestrictionTableTable> {
  $$AppRestrictionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get appPackage => $composableBuilder(
      column: $table.appPackage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timerSec => $composableBuilder(
      column: $table.timerSec, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get launchLimit => $composableBuilder(
      column: $table.launchLimit, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<TimeOfDayAdapter, TimeOfDayAdapter, int>
      get activePeriodStart => $composableBuilder(
          column: $table.activePeriodStart,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<TimeOfDayAdapter, TimeOfDayAdapter, int>
      get activePeriodEnd => $composableBuilder(
          column: $table.activePeriodEnd,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get periodDurationInMins => $composableBuilder(
      column: $table.periodDurationInMins,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get canAccessInternet => $composableBuilder(
      column: $table.canAccessInternet,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ReminderType, ReminderType, String>
      get reminderType => $composableBuilder(
          column: $table.reminderType,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$AppRestrictionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppRestrictionTableTable> {
  $$AppRestrictionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get appPackage => $composableBuilder(
      column: $table.appPackage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timerSec => $composableBuilder(
      column: $table.timerSec, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get launchLimit => $composableBuilder(
      column: $table.launchLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get activePeriodStart => $composableBuilder(
      column: $table.activePeriodStart,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get activePeriodEnd => $composableBuilder(
      column: $table.activePeriodEnd,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get periodDurationInMins => $composableBuilder(
      column: $table.periodDurationInMins,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get canAccessInternet => $composableBuilder(
      column: $table.canAccessInternet,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reminderType => $composableBuilder(
      column: $table.reminderType,
      builder: (column) => ColumnOrderings(column));
}

class $$AppRestrictionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppRestrictionTableTable> {
  $$AppRestrictionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get appPackage => $composableBuilder(
      column: $table.appPackage, builder: (column) => column);

  GeneratedColumn<int> get timerSec =>
      $composableBuilder(column: $table.timerSec, builder: (column) => column);

  GeneratedColumn<int> get launchLimit => $composableBuilder(
      column: $table.launchLimit, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimeOfDayAdapter, int>
      get activePeriodStart => $composableBuilder(
          column: $table.activePeriodStart, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TimeOfDayAdapter, int> get activePeriodEnd =>
      $composableBuilder(
          column: $table.activePeriodEnd, builder: (column) => column);

  GeneratedColumn<int> get periodDurationInMins => $composableBuilder(
      column: $table.periodDurationInMins, builder: (column) => column);

  GeneratedColumn<bool> get canAccessInternet => $composableBuilder(
      column: $table.canAccessInternet, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ReminderType, String> get reminderType =>
      $composableBuilder(
          column: $table.reminderType, builder: (column) => column);
}

class $$AppRestrictionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppRestrictionTableTable,
    AppRestriction,
    $$AppRestrictionTableTableFilterComposer,
    $$AppRestrictionTableTableOrderingComposer,
    $$AppRestrictionTableTableAnnotationComposer,
    $$AppRestrictionTableTableCreateCompanionBuilder,
    $$AppRestrictionTableTableUpdateCompanionBuilder,
    (
      AppRestriction,
      BaseReferences<_$AppDatabase, $AppRestrictionTableTable, AppRestriction>
    ),
    AppRestriction,
    PrefetchHooks Function()> {
  $$AppRestrictionTableTableTableManager(
      _$AppDatabase db, $AppRestrictionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppRestrictionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppRestrictionTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppRestrictionTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> appPackage = const Value.absent(),
            Value<int> timerSec = const Value.absent(),
            Value<int> launchLimit = const Value.absent(),
            Value<TimeOfDayAdapter> activePeriodStart = const Value.absent(),
            Value<TimeOfDayAdapter> activePeriodEnd = const Value.absent(),
            Value<int> periodDurationInMins = const Value.absent(),
            Value<bool> canAccessInternet = const Value.absent(),
            Value<ReminderType> reminderType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppRestrictionTableCompanion(
            appPackage: appPackage,
            timerSec: timerSec,
            launchLimit: launchLimit,
            activePeriodStart: activePeriodStart,
            activePeriodEnd: activePeriodEnd,
            periodDurationInMins: periodDurationInMins,
            canAccessInternet: canAccessInternet,
            reminderType: reminderType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String appPackage,
            Value<int> timerSec = const Value.absent(),
            Value<int> launchLimit = const Value.absent(),
            Value<TimeOfDayAdapter> activePeriodStart = const Value.absent(),
            Value<TimeOfDayAdapter> activePeriodEnd = const Value.absent(),
            Value<int> periodDurationInMins = const Value.absent(),
            Value<bool> canAccessInternet = const Value.absent(),
            Value<ReminderType> reminderType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppRestrictionTableCompanion.insert(
            appPackage: appPackage,
            timerSec: timerSec,
            launchLimit: launchLimit,
            activePeriodStart: activePeriodStart,
            activePeriodEnd: activePeriodEnd,
            periodDurationInMins: periodDurationInMins,
            canAccessInternet: canAccessInternet,
            reminderType: reminderType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AppRestrictionTableTable, AppRestriction>(
                        table),
                    BaseReferences<_$AppDatabase, $AppRestrictionTableTable,
                        AppRestriction>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppRestrictionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppRestrictionTableTable,
    AppRestriction,
    $$AppRestrictionTableTableFilterComposer,
    $$AppRestrictionTableTableOrderingComposer,
    $$AppRestrictionTableTableAnnotationComposer,
    $$AppRestrictionTableTableCreateCompanionBuilder,
    $$AppRestrictionTableTableUpdateCompanionBuilder,
    (
      AppRestriction,
      BaseReferences<_$AppDatabase, $AppRestrictionTableTable, AppRestriction>
    ),
    AppRestriction,
    PrefetchHooks Function()>;
typedef $$CrashLogsTableTableCreateCompanionBuilder = CrashLogsTableCompanion
    Function({
  Value<int> id,
  Value<String> appVersion,
  Value<DateTime> timeStamp,
  Value<String> error,
  Value<String> stackTrace,
});
typedef $$CrashLogsTableTableUpdateCompanionBuilder = CrashLogsTableCompanion
    Function({
  Value<int> id,
  Value<String> appVersion,
  Value<DateTime> timeStamp,
  Value<String> error,
  Value<String> stackTrace,
});

class $$CrashLogsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CrashLogsTableTable> {
  $$CrashLogsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnFilters(column));
}

class $$CrashLogsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CrashLogsTableTable> {
  $$CrashLogsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get error => $composableBuilder(
      column: $table.error, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => ColumnOrderings(column));
}

class $$CrashLogsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CrashLogsTableTable> {
  $$CrashLogsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => column);

  GeneratedColumn<DateTime> get timeStamp =>
      $composableBuilder(column: $table.timeStamp, builder: (column) => column);

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);

  GeneratedColumn<String> get stackTrace => $composableBuilder(
      column: $table.stackTrace, builder: (column) => column);
}

class $$CrashLogsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CrashLogsTableTable,
    CrashLog,
    $$CrashLogsTableTableFilterComposer,
    $$CrashLogsTableTableOrderingComposer,
    $$CrashLogsTableTableAnnotationComposer,
    $$CrashLogsTableTableCreateCompanionBuilder,
    $$CrashLogsTableTableUpdateCompanionBuilder,
    (CrashLog, BaseReferences<_$AppDatabase, $CrashLogsTableTable, CrashLog>),
    CrashLog,
    PrefetchHooks Function()> {
  $$CrashLogsTableTableTableManager(
      _$AppDatabase db, $CrashLogsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CrashLogsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CrashLogsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CrashLogsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> appVersion = const Value.absent(),
            Value<DateTime> timeStamp = const Value.absent(),
            Value<String> error = const Value.absent(),
            Value<String> stackTrace = const Value.absent(),
          }) =>
              CrashLogsTableCompanion(
            id: id,
            appVersion: appVersion,
            timeStamp: timeStamp,
            error: error,
            stackTrace: stackTrace,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> appVersion = const Value.absent(),
            Value<DateTime> timeStamp = const Value.absent(),
            Value<String> error = const Value.absent(),
            Value<String> stackTrace = const Value.absent(),
          }) =>
              CrashLogsTableCompanion.insert(
            id: id,
            appVersion: appVersion,
            timeStamp: timeStamp,
            error: error,
            stackTrace: stackTrace,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$CrashLogsTableTable, CrashLog>(table),
                    BaseReferences<_$AppDatabase, $CrashLogsTableTable,
                        CrashLog>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CrashLogsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CrashLogsTableTable,
    CrashLog,
    $$CrashLogsTableTableFilterComposer,
    $$CrashLogsTableTableOrderingComposer,
    $$CrashLogsTableTableAnnotationComposer,
    $$CrashLogsTableTableCreateCompanionBuilder,
    $$CrashLogsTableTableUpdateCompanionBuilder,
    (CrashLog, BaseReferences<_$AppDatabase, $CrashLogsTableTable, CrashLog>),
    CrashLog,
    PrefetchHooks Function()>;
typedef $$MindfulSettingsTableTableCreateCompanionBuilder
    = MindfulSettingsTableCompanion Function({
  Value<int> id,
  Value<AppThemeMode> themeMode,
  Value<String> accentColor,
  Value<String> username,
  Value<String> localeCode,
  Value<bool> useAmoledDark,
  Value<bool> useDynamicColors,
  Value<DefaultHomeTab> defaultHomeTab,
  Value<int> usageHistoryWeeks,
  Value<int> leftEmergencyPasses,
  Value<DateTime> lastEmergencyUsed,
  Value<bool> isOnboardingDone,
  Value<String> appVersion,
});
typedef $$MindfulSettingsTableTableUpdateCompanionBuilder
    = MindfulSettingsTableCompanion Function({
  Value<int> id,
  Value<AppThemeMode> themeMode,
  Value<String> accentColor,
  Value<String> username,
  Value<String> localeCode,
  Value<bool> useAmoledDark,
  Value<bool> useDynamicColors,
  Value<DefaultHomeTab> defaultHomeTab,
  Value<int> usageHistoryWeeks,
  Value<int> leftEmergencyPasses,
  Value<DateTime> lastEmergencyUsed,
  Value<bool> isOnboardingDone,
  Value<String> appVersion,
});

class $$MindfulSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $MindfulSettingsTableTable> {
  $$MindfulSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<AppThemeMode, AppThemeMode, int>
      get themeMode => $composableBuilder(
          column: $table.themeMode,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localeCode => $composableBuilder(
      column: $table.localeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useAmoledDark => $composableBuilder(
      column: $table.useAmoledDark, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get useDynamicColors => $composableBuilder(
      column: $table.useDynamicColors,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DefaultHomeTab, DefaultHomeTab, int>
      get defaultHomeTab => $composableBuilder(
          column: $table.defaultHomeTab,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get usageHistoryWeeks => $composableBuilder(
      column: $table.usageHistoryWeeks,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get leftEmergencyPasses => $composableBuilder(
      column: $table.leftEmergencyPasses,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastEmergencyUsed => $composableBuilder(
      column: $table.lastEmergencyUsed,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOnboardingDone => $composableBuilder(
      column: $table.isOnboardingDone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => ColumnFilters(column));
}

class $$MindfulSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MindfulSettingsTableTable> {
  $$MindfulSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localeCode => $composableBuilder(
      column: $table.localeCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useAmoledDark => $composableBuilder(
      column: $table.useAmoledDark,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get useDynamicColors => $composableBuilder(
      column: $table.useDynamicColors,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultHomeTab => $composableBuilder(
      column: $table.defaultHomeTab,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageHistoryWeeks => $composableBuilder(
      column: $table.usageHistoryWeeks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get leftEmergencyPasses => $composableBuilder(
      column: $table.leftEmergencyPasses,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastEmergencyUsed => $composableBuilder(
      column: $table.lastEmergencyUsed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOnboardingDone => $composableBuilder(
      column: $table.isOnboardingDone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => ColumnOrderings(column));
}

class $$MindfulSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MindfulSettingsTableTable> {
  $$MindfulSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AppThemeMode, int> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get accentColor => $composableBuilder(
      column: $table.accentColor, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get localeCode => $composableBuilder(
      column: $table.localeCode, builder: (column) => column);

  GeneratedColumn<bool> get useAmoledDark => $composableBuilder(
      column: $table.useAmoledDark, builder: (column) => column);

  GeneratedColumn<bool> get useDynamicColors => $composableBuilder(
      column: $table.useDynamicColors, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DefaultHomeTab, int> get defaultHomeTab =>
      $composableBuilder(
          column: $table.defaultHomeTab, builder: (column) => column);

  GeneratedColumn<int> get usageHistoryWeeks => $composableBuilder(
      column: $table.usageHistoryWeeks, builder: (column) => column);

  GeneratedColumn<int> get leftEmergencyPasses => $composableBuilder(
      column: $table.leftEmergencyPasses, builder: (column) => column);

  GeneratedColumn<DateTime> get lastEmergencyUsed => $composableBuilder(
      column: $table.lastEmergencyUsed, builder: (column) => column);

  GeneratedColumn<bool> get isOnboardingDone => $composableBuilder(
      column: $table.isOnboardingDone, builder: (column) => column);

  GeneratedColumn<String> get appVersion => $composableBuilder(
      column: $table.appVersion, builder: (column) => column);
}

class $$MindfulSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MindfulSettingsTableTable,
    MindfulSettings,
    $$MindfulSettingsTableTableFilterComposer,
    $$MindfulSettingsTableTableOrderingComposer,
    $$MindfulSettingsTableTableAnnotationComposer,
    $$MindfulSettingsTableTableCreateCompanionBuilder,
    $$MindfulSettingsTableTableUpdateCompanionBuilder,
    (
      MindfulSettings,
      BaseReferences<_$AppDatabase, $MindfulSettingsTableTable, MindfulSettings>
    ),
    MindfulSettings,
    PrefetchHooks Function()> {
  $$MindfulSettingsTableTableTableManager(
      _$AppDatabase db, $MindfulSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MindfulSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MindfulSettingsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MindfulSettingsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<AppThemeMode> themeMode = const Value.absent(),
            Value<String> accentColor = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> localeCode = const Value.absent(),
            Value<bool> useAmoledDark = const Value.absent(),
            Value<bool> useDynamicColors = const Value.absent(),
            Value<DefaultHomeTab> defaultHomeTab = const Value.absent(),
            Value<int> usageHistoryWeeks = const Value.absent(),
            Value<int> leftEmergencyPasses = const Value.absent(),
            Value<DateTime> lastEmergencyUsed = const Value.absent(),
            Value<bool> isOnboardingDone = const Value.absent(),
            Value<String> appVersion = const Value.absent(),
          }) =>
              MindfulSettingsTableCompanion(
            id: id,
            themeMode: themeMode,
            accentColor: accentColor,
            username: username,
            localeCode: localeCode,
            useAmoledDark: useAmoledDark,
            useDynamicColors: useDynamicColors,
            defaultHomeTab: defaultHomeTab,
            usageHistoryWeeks: usageHistoryWeeks,
            leftEmergencyPasses: leftEmergencyPasses,
            lastEmergencyUsed: lastEmergencyUsed,
            isOnboardingDone: isOnboardingDone,
            appVersion: appVersion,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<AppThemeMode> themeMode = const Value.absent(),
            Value<String> accentColor = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> localeCode = const Value.absent(),
            Value<bool> useAmoledDark = const Value.absent(),
            Value<bool> useDynamicColors = const Value.absent(),
            Value<DefaultHomeTab> defaultHomeTab = const Value.absent(),
            Value<int> usageHistoryWeeks = const Value.absent(),
            Value<int> leftEmergencyPasses = const Value.absent(),
            Value<DateTime> lastEmergencyUsed = const Value.absent(),
            Value<bool> isOnboardingDone = const Value.absent(),
            Value<String> appVersion = const Value.absent(),
          }) =>
              MindfulSettingsTableCompanion.insert(
            id: id,
            themeMode: themeMode,
            accentColor: accentColor,
            username: username,
            localeCode: localeCode,
            useAmoledDark: useAmoledDark,
            useDynamicColors: useDynamicColors,
            defaultHomeTab: defaultHomeTab,
            usageHistoryWeeks: usageHistoryWeeks,
            leftEmergencyPasses: leftEmergencyPasses,
            lastEmergencyUsed: lastEmergencyUsed,
            isOnboardingDone: isOnboardingDone,
            appVersion: appVersion,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$MindfulSettingsTableTable, MindfulSettings>(
                        table),
                    BaseReferences<_$AppDatabase, $MindfulSettingsTableTable,
                        MindfulSettings>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MindfulSettingsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MindfulSettingsTableTable,
        MindfulSettings,
        $$MindfulSettingsTableTableFilterComposer,
        $$MindfulSettingsTableTableOrderingComposer,
        $$MindfulSettingsTableTableAnnotationComposer,
        $$MindfulSettingsTableTableCreateCompanionBuilder,
        $$MindfulSettingsTableTableUpdateCompanionBuilder,
        (
          MindfulSettings,
          BaseReferences<_$AppDatabase, $MindfulSettingsTableTable,
              MindfulSettings>
        ),
        MindfulSettings,
        PrefetchHooks Function()>;
typedef $$WellbeingTableTableCreateCompanionBuilder = WellbeingTableCompanion
    Function({
  Value<int> id,
  Value<int> allowedShortsTimeSec,
  Value<int> instagramUsageLimitSec,
  Value<List<PlatformFeatures>> blockedFeatures,
  Value<bool> blockNsfwSites,
  Value<List<String>> blockedWebsites,
  Value<List<String>> nsfwWebsites,
});
typedef $$WellbeingTableTableUpdateCompanionBuilder = WellbeingTableCompanion
    Function({
  Value<int> id,
  Value<int> allowedShortsTimeSec,
  Value<int> instagramUsageLimitSec,
  Value<List<PlatformFeatures>> blockedFeatures,
  Value<bool> blockNsfwSites,
  Value<List<String>> blockedWebsites,
  Value<List<String>> nsfwWebsites,
});

class $$WellbeingTableTableFilterComposer
    extends Composer<_$AppDatabase, $WellbeingTableTable> {
  $$WellbeingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get allowedShortsTimeSec => $composableBuilder(
      column: $table.allowedShortsTimeSec,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get instagramUsageLimitSec => $composableBuilder(
      column: $table.instagramUsageLimitSec,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<PlatformFeatures>, List<PlatformFeatures>,
          String>
      get blockedFeatures => $composableBuilder(
          column: $table.blockedFeatures,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get blockNsfwSites => $composableBuilder(
      column: $table.blockNsfwSites,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get blockedWebsites => $composableBuilder(
          column: $table.blockedWebsites,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get nsfwWebsites => $composableBuilder(
          column: $table.nsfwWebsites,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$WellbeingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WellbeingTableTable> {
  $$WellbeingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get allowedShortsTimeSec => $composableBuilder(
      column: $table.allowedShortsTimeSec,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get instagramUsageLimitSec => $composableBuilder(
      column: $table.instagramUsageLimitSec,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blockedFeatures => $composableBuilder(
      column: $table.blockedFeatures,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get blockNsfwSites => $composableBuilder(
      column: $table.blockNsfwSites,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blockedWebsites => $composableBuilder(
      column: $table.blockedWebsites,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nsfwWebsites => $composableBuilder(
      column: $table.nsfwWebsites,
      builder: (column) => ColumnOrderings(column));
}

class $$WellbeingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WellbeingTableTable> {
  $$WellbeingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get allowedShortsTimeSec => $composableBuilder(
      column: $table.allowedShortsTimeSec, builder: (column) => column);

  GeneratedColumn<int> get instagramUsageLimitSec => $composableBuilder(
      column: $table.instagramUsageLimitSec, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<PlatformFeatures>, String>
      get blockedFeatures => $composableBuilder(
          column: $table.blockedFeatures, builder: (column) => column);

  GeneratedColumn<bool> get blockNsfwSites => $composableBuilder(
      column: $table.blockNsfwSites, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get blockedWebsites =>
      $composableBuilder(
          column: $table.blockedWebsites, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get nsfwWebsites =>
      $composableBuilder(
          column: $table.nsfwWebsites, builder: (column) => column);
}

class $$WellbeingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WellbeingTableTable,
    Wellbeing,
    $$WellbeingTableTableFilterComposer,
    $$WellbeingTableTableOrderingComposer,
    $$WellbeingTableTableAnnotationComposer,
    $$WellbeingTableTableCreateCompanionBuilder,
    $$WellbeingTableTableUpdateCompanionBuilder,
    (Wellbeing, BaseReferences<_$AppDatabase, $WellbeingTableTable, Wellbeing>),
    Wellbeing,
    PrefetchHooks Function()> {
  $$WellbeingTableTableTableManager(
      _$AppDatabase db, $WellbeingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WellbeingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WellbeingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WellbeingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> allowedShortsTimeSec = const Value.absent(),
            Value<int> instagramUsageLimitSec = const Value.absent(),
            Value<List<PlatformFeatures>> blockedFeatures =
                const Value.absent(),
            Value<bool> blockNsfwSites = const Value.absent(),
            Value<List<String>> blockedWebsites = const Value.absent(),
            Value<List<String>> nsfwWebsites = const Value.absent(),
          }) =>
              WellbeingTableCompanion(
            id: id,
            allowedShortsTimeSec: allowedShortsTimeSec,
            instagramUsageLimitSec: instagramUsageLimitSec,
            blockedFeatures: blockedFeatures,
            blockNsfwSites: blockNsfwSites,
            blockedWebsites: blockedWebsites,
            nsfwWebsites: nsfwWebsites,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> allowedShortsTimeSec = const Value.absent(),
            Value<int> instagramUsageLimitSec = const Value.absent(),
            Value<List<PlatformFeatures>> blockedFeatures =
                const Value.absent(),
            Value<bool> blockNsfwSites = const Value.absent(),
            Value<List<String>> blockedWebsites = const Value.absent(),
            Value<List<String>> nsfwWebsites = const Value.absent(),
          }) =>
              WellbeingTableCompanion.insert(
            id: id,
            allowedShortsTimeSec: allowedShortsTimeSec,
            instagramUsageLimitSec: instagramUsageLimitSec,
            blockedFeatures: blockedFeatures,
            blockNsfwSites: blockNsfwSites,
            blockedWebsites: blockedWebsites,
            nsfwWebsites: nsfwWebsites,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$WellbeingTableTable, Wellbeing>(table),
                    BaseReferences<_$AppDatabase, $WellbeingTableTable,
                        Wellbeing>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WellbeingTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WellbeingTableTable,
    Wellbeing,
    $$WellbeingTableTableFilterComposer,
    $$WellbeingTableTableOrderingComposer,
    $$WellbeingTableTableAnnotationComposer,
    $$WellbeingTableTableCreateCompanionBuilder,
    $$WellbeingTableTableUpdateCompanionBuilder,
    (Wellbeing, BaseReferences<_$AppDatabase, $WellbeingTableTable, Wellbeing>),
    Wellbeing,
    PrefetchHooks Function()>;
typedef $$SharedUniqueDataTableTableCreateCompanionBuilder
    = SharedUniqueDataTableCompanion Function({
  Value<int> id,
  Value<List<String>> excludedApps,
});
typedef $$SharedUniqueDataTableTableUpdateCompanionBuilder
    = SharedUniqueDataTableCompanion Function({
  Value<int> id,
  Value<List<String>> excludedApps,
});

class $$SharedUniqueDataTableTableFilterComposer
    extends Composer<_$AppDatabase, $SharedUniqueDataTableTable> {
  $$SharedUniqueDataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get excludedApps => $composableBuilder(
          column: $table.excludedApps,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$SharedUniqueDataTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SharedUniqueDataTableTable> {
  $$SharedUniqueDataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get excludedApps => $composableBuilder(
      column: $table.excludedApps,
      builder: (column) => ColumnOrderings(column));
}

class $$SharedUniqueDataTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SharedUniqueDataTableTable> {
  $$SharedUniqueDataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get excludedApps =>
      $composableBuilder(
          column: $table.excludedApps, builder: (column) => column);
}

class $$SharedUniqueDataTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SharedUniqueDataTableTable,
    SharedUniqueData,
    $$SharedUniqueDataTableTableFilterComposer,
    $$SharedUniqueDataTableTableOrderingComposer,
    $$SharedUniqueDataTableTableAnnotationComposer,
    $$SharedUniqueDataTableTableCreateCompanionBuilder,
    $$SharedUniqueDataTableTableUpdateCompanionBuilder,
    (
      SharedUniqueData,
      BaseReferences<_$AppDatabase, $SharedUniqueDataTableTable,
          SharedUniqueData>
    ),
    SharedUniqueData,
    PrefetchHooks Function()> {
  $$SharedUniqueDataTableTableTableManager(
      _$AppDatabase db, $SharedUniqueDataTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SharedUniqueDataTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$SharedUniqueDataTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SharedUniqueDataTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<List<String>> excludedApps = const Value.absent(),
          }) =>
              SharedUniqueDataTableCompanion(
            id: id,
            excludedApps: excludedApps,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<List<String>> excludedApps = const Value.absent(),
          }) =>
              SharedUniqueDataTableCompanion.insert(
            id: id,
            excludedApps: excludedApps,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SharedUniqueDataTableTable, SharedUniqueData>(
                        table),
                    BaseReferences<_$AppDatabase, $SharedUniqueDataTableTable,
                        SharedUniqueData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SharedUniqueDataTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SharedUniqueDataTableTable,
        SharedUniqueData,
        $$SharedUniqueDataTableTableFilterComposer,
        $$SharedUniqueDataTableTableOrderingComposer,
        $$SharedUniqueDataTableTableAnnotationComposer,
        $$SharedUniqueDataTableTableCreateCompanionBuilder,
        $$SharedUniqueDataTableTableUpdateCompanionBuilder,
        (
          SharedUniqueData,
          BaseReferences<_$AppDatabase, $SharedUniqueDataTableTable,
              SharedUniqueData>
        ),
        SharedUniqueData,
        PrefetchHooks Function()>;
typedef $$AppUsageTableTableCreateCompanionBuilder = AppUsageTableCompanion
    Function({
  required String packageName,
  Value<DateTime> date,
  Value<int> screenTime,
  Value<int> mobileData,
  Value<int> wifiData,
  Value<int> rowid,
});
typedef $$AppUsageTableTableUpdateCompanionBuilder = AppUsageTableCompanion
    Function({
  Value<String> packageName,
  Value<DateTime> date,
  Value<int> screenTime,
  Value<int> mobileData,
  Value<int> wifiData,
  Value<int> rowid,
});

class $$AppUsageTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppUsageTableTable> {
  $$AppUsageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get screenTime => $composableBuilder(
      column: $table.screenTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mobileData => $composableBuilder(
      column: $table.mobileData, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wifiData => $composableBuilder(
      column: $table.wifiData, builder: (column) => ColumnFilters(column));
}

class $$AppUsageTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppUsageTableTable> {
  $$AppUsageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get screenTime => $composableBuilder(
      column: $table.screenTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mobileData => $composableBuilder(
      column: $table.mobileData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wifiData => $composableBuilder(
      column: $table.wifiData, builder: (column) => ColumnOrderings(column));
}

class $$AppUsageTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppUsageTableTable> {
  $$AppUsageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get screenTime => $composableBuilder(
      column: $table.screenTime, builder: (column) => column);

  GeneratedColumn<int> get mobileData => $composableBuilder(
      column: $table.mobileData, builder: (column) => column);

  GeneratedColumn<int> get wifiData =>
      $composableBuilder(column: $table.wifiData, builder: (column) => column);
}

class $$AppUsageTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppUsageTableTable,
    AppUsage,
    $$AppUsageTableTableFilterComposer,
    $$AppUsageTableTableOrderingComposer,
    $$AppUsageTableTableAnnotationComposer,
    $$AppUsageTableTableCreateCompanionBuilder,
    $$AppUsageTableTableUpdateCompanionBuilder,
    (AppUsage, BaseReferences<_$AppDatabase, $AppUsageTableTable, AppUsage>),
    AppUsage,
    PrefetchHooks Function()> {
  $$AppUsageTableTableTableManager(_$AppDatabase db, $AppUsageTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppUsageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppUsageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppUsageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> packageName = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> screenTime = const Value.absent(),
            Value<int> mobileData = const Value.absent(),
            Value<int> wifiData = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppUsageTableCompanion(
            packageName: packageName,
            date: date,
            screenTime: screenTime,
            mobileData: mobileData,
            wifiData: wifiData,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String packageName,
            Value<DateTime> date = const Value.absent(),
            Value<int> screenTime = const Value.absent(),
            Value<int> mobileData = const Value.absent(),
            Value<int> wifiData = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppUsageTableCompanion.insert(
            packageName: packageName,
            date: date,
            screenTime: screenTime,
            mobileData: mobileData,
            wifiData: wifiData,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AppUsageTableTable, AppUsage>(table),
                    BaseReferences<_$AppDatabase, $AppUsageTableTable,
                        AppUsage>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppUsageTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppUsageTableTable,
    AppUsage,
    $$AppUsageTableTableFilterComposer,
    $$AppUsageTableTableOrderingComposer,
    $$AppUsageTableTableAnnotationComposer,
    $$AppUsageTableTableCreateCompanionBuilder,
    $$AppUsageTableTableUpdateCompanionBuilder,
    (AppUsage, BaseReferences<_$AppDatabase, $AppUsageTableTable, AppUsage>),
    AppUsage,
    PrefetchHooks Function()>;
typedef $$NotificationSettingsTableTableCreateCompanionBuilder
    = NotificationSettingsTableCompanion Function({
  Value<int> id,
  Value<RecapType> recapType,
  Value<int> notificationHistoryWeeks,
  Value<bool> storeNonBatchedToo,
  Value<List<String>> batchedApps,
  Value<List<NotificationSchedule>> schedules,
});
typedef $$NotificationSettingsTableTableUpdateCompanionBuilder
    = NotificationSettingsTableCompanion Function({
  Value<int> id,
  Value<RecapType> recapType,
  Value<int> notificationHistoryWeeks,
  Value<bool> storeNonBatchedToo,
  Value<List<String>> batchedApps,
  Value<List<NotificationSchedule>> schedules,
});

class $$NotificationSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<RecapType, RecapType, int> get recapType =>
      $composableBuilder(
          column: $table.recapType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get notificationHistoryWeeks => $composableBuilder(
      column: $table.notificationHistoryWeeks,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get storeNonBatchedToo => $composableBuilder(
      column: $table.storeNonBatchedToo,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get batchedApps => $composableBuilder(
          column: $table.batchedApps,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<NotificationSchedule>,
          List<NotificationSchedule>, String>
      get schedules => $composableBuilder(
          column: $table.schedules,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$NotificationSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get recapType => $composableBuilder(
      column: $table.recapType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notificationHistoryWeeks => $composableBuilder(
      column: $table.notificationHistoryWeeks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get storeNonBatchedToo => $composableBuilder(
      column: $table.storeNonBatchedToo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchedApps => $composableBuilder(
      column: $table.batchedApps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get schedules => $composableBuilder(
      column: $table.schedules, builder: (column) => ColumnOrderings(column));
}

class $$NotificationSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RecapType, int> get recapType =>
      $composableBuilder(column: $table.recapType, builder: (column) => column);

  GeneratedColumn<int> get notificationHistoryWeeks => $composableBuilder(
      column: $table.notificationHistoryWeeks, builder: (column) => column);

  GeneratedColumn<bool> get storeNonBatchedToo => $composableBuilder(
      column: $table.storeNonBatchedToo, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get batchedApps =>
      $composableBuilder(
          column: $table.batchedApps, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<NotificationSchedule>, String>
      get schedules => $composableBuilder(
          column: $table.schedules, builder: (column) => column);
}

class $$NotificationSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationSettingsTableTable,
    NotificationSettings,
    $$NotificationSettingsTableTableFilterComposer,
    $$NotificationSettingsTableTableOrderingComposer,
    $$NotificationSettingsTableTableAnnotationComposer,
    $$NotificationSettingsTableTableCreateCompanionBuilder,
    $$NotificationSettingsTableTableUpdateCompanionBuilder,
    (
      NotificationSettings,
      BaseReferences<_$AppDatabase, $NotificationSettingsTableTable,
          NotificationSettings>
    ),
    NotificationSettings,
    PrefetchHooks Function()> {
  $$NotificationSettingsTableTableTableManager(
      _$AppDatabase db, $NotificationSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationSettingsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationSettingsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationSettingsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<RecapType> recapType = const Value.absent(),
            Value<int> notificationHistoryWeeks = const Value.absent(),
            Value<bool> storeNonBatchedToo = const Value.absent(),
            Value<List<String>> batchedApps = const Value.absent(),
            Value<List<NotificationSchedule>> schedules = const Value.absent(),
          }) =>
              NotificationSettingsTableCompanion(
            id: id,
            recapType: recapType,
            notificationHistoryWeeks: notificationHistoryWeeks,
            storeNonBatchedToo: storeNonBatchedToo,
            batchedApps: batchedApps,
            schedules: schedules,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<RecapType> recapType = const Value.absent(),
            Value<int> notificationHistoryWeeks = const Value.absent(),
            Value<bool> storeNonBatchedToo = const Value.absent(),
            Value<List<String>> batchedApps = const Value.absent(),
            Value<List<NotificationSchedule>> schedules = const Value.absent(),
          }) =>
              NotificationSettingsTableCompanion.insert(
            id: id,
            recapType: recapType,
            notificationHistoryWeeks: notificationHistoryWeeks,
            storeNonBatchedToo: storeNonBatchedToo,
            batchedApps: batchedApps,
            schedules: schedules,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$NotificationSettingsTableTable,
                        NotificationSettings>(table),
                    BaseReferences<
                        _$AppDatabase,
                        $NotificationSettingsTableTable,
                        NotificationSettings>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationSettingsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $NotificationSettingsTableTable,
        NotificationSettings,
        $$NotificationSettingsTableTableFilterComposer,
        $$NotificationSettingsTableTableOrderingComposer,
        $$NotificationSettingsTableTableAnnotationComposer,
        $$NotificationSettingsTableTableCreateCompanionBuilder,
        $$NotificationSettingsTableTableUpdateCompanionBuilder,
        (
          NotificationSettings,
          BaseReferences<_$AppDatabase, $NotificationSettingsTableTable,
              NotificationSettings>
        ),
        NotificationSettings,
        PrefetchHooks Function()>;
typedef $$NotificationsTableTableCreateCompanionBuilder
    = NotificationsTableCompanion Function({
  Value<int> id,
  required String key,
  required String packageName,
  Value<DateTime> timeStamp,
  Value<String> title,
  Value<String> content,
  Value<String> category,
  Value<bool> isRead,
});
typedef $$NotificationsTableTableUpdateCompanionBuilder
    = NotificationsTableCompanion Function({
  Value<int> id,
  Value<String> key,
  Value<String> packageName,
  Value<DateTime> timeStamp,
  Value<String> title,
  Value<String> content,
  Value<String> category,
  Value<bool> isRead,
});

class $$NotificationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));
}

class $$NotificationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));
}

class $$NotificationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTableTable> {
  $$NotificationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get packageName => $composableBuilder(
      column: $table.packageName, builder: (column) => column);

  GeneratedColumn<DateTime> get timeStamp =>
      $composableBuilder(column: $table.timeStamp, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);
}

class $$NotificationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationsTableTable,
    Notification,
    $$NotificationsTableTableFilterComposer,
    $$NotificationsTableTableOrderingComposer,
    $$NotificationsTableTableAnnotationComposer,
    $$NotificationsTableTableCreateCompanionBuilder,
    $$NotificationsTableTableUpdateCompanionBuilder,
    (
      Notification,
      BaseReferences<_$AppDatabase, $NotificationsTableTable, Notification>
    ),
    Notification,
    PrefetchHooks Function()> {
  $$NotificationsTableTableTableManager(
      _$AppDatabase db, $NotificationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> packageName = const Value.absent(),
            Value<DateTime> timeStamp = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
          }) =>
              NotificationsTableCompanion(
            id: id,
            key: key,
            packageName: packageName,
            timeStamp: timeStamp,
            title: title,
            content: content,
            category: category,
            isRead: isRead,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String key,
            required String packageName,
            Value<DateTime> timeStamp = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
          }) =>
              NotificationsTableCompanion.insert(
            id: id,
            key: key,
            packageName: packageName,
            timeStamp: timeStamp,
            title: title,
            content: content,
            category: category,
            isRead: isRead,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$NotificationsTableTable, Notification>(table),
                    BaseReferences<_$AppDatabase, $NotificationsTableTable,
                        Notification>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotificationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotificationsTableTable,
    Notification,
    $$NotificationsTableTableFilterComposer,
    $$NotificationsTableTableOrderingComposer,
    $$NotificationsTableTableAnnotationComposer,
    $$NotificationsTableTableCreateCompanionBuilder,
    $$NotificationsTableTableUpdateCompanionBuilder,
    (
      Notification,
      BaseReferences<_$AppDatabase, $NotificationsTableTable, Notification>
    ),
    Notification,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppRestrictionTableTableTableManager get appRestrictionTable =>
      $$AppRestrictionTableTableTableManager(_db, _db.appRestrictionTable);
  $$CrashLogsTableTableTableManager get crashLogsTable =>
      $$CrashLogsTableTableTableManager(_db, _db.crashLogsTable);
  $$MindfulSettingsTableTableTableManager get mindfulSettingsTable =>
      $$MindfulSettingsTableTableTableManager(_db, _db.mindfulSettingsTable);
  $$WellbeingTableTableTableManager get wellbeingTable =>
      $$WellbeingTableTableTableManager(_db, _db.wellbeingTable);
  $$SharedUniqueDataTableTableTableManager get sharedUniqueDataTable =>
      $$SharedUniqueDataTableTableTableManager(_db, _db.sharedUniqueDataTable);
  $$AppUsageTableTableTableManager get appUsageTable =>
      $$AppUsageTableTableTableManager(_db, _db.appUsageTable);
  $$NotificationSettingsTableTableTableManager get notificationSettingsTable =>
      $$NotificationSettingsTableTableTableManager(
          _db, _db.notificationSettingsTable);
  $$NotificationsTableTableTableManager get notificationsTable =>
      $$NotificationsTableTableTableManager(_db, _db.notificationsTable);
}
