// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StepsTable extends Steps with TableInfo<$StepsTable, Step> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
      'steps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [date, steps];
  @override
  String get aliasedName => _alias ?? 'steps';
  @override
  String get actualTableName => 'steps';
  @override
  VerificationContext validateIntegrity(Insertable<Step> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
          _stepsMeta, steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta));
    } else if (isInserting) {
      context.missing(_stepsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Step map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Step(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      steps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}steps'])!,
    );
  }

  @override
  $StepsTable createAlias(String alias) {
    return $StepsTable(attachedDatabase, alias);
  }
}

class Step extends DataClass implements Insertable<Step> {
  final DateTime date;
  final int steps;
  const Step({required this.date, required this.steps});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['steps'] = Variable<int>(steps);
    return map;
  }

  StepsCompanion toCompanion(bool nullToAbsent) {
    return StepsCompanion(
      date: Value(date),
      steps: Value(steps),
    );
  }

  factory Step.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Step(
      date: serializer.fromJson<DateTime>(json['date']),
      steps: serializer.fromJson<int>(json['steps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'steps': serializer.toJson<int>(steps),
    };
  }

  Step copyWith({DateTime? date, int? steps}) => Step(
        date: date ?? this.date,
        steps: steps ?? this.steps,
      );
  @override
  String toString() {
    return (StringBuffer('Step(')
          ..write('date: $date, ')
          ..write('steps: $steps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, steps);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Step && other.date == this.date && other.steps == this.steps);
}

class StepsCompanion extends UpdateCompanion<Step> {
  final Value<DateTime> date;
  final Value<int> steps;
  final Value<int> rowid;
  const StepsCompanion({
    this.date = const Value.absent(),
    this.steps = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StepsCompanion.insert({
    required DateTime date,
    required int steps,
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        steps = Value(steps);
  static Insertable<Step> custom({
    Expression<DateTime>? date,
    Expression<int>? steps,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (steps != null) 'steps': steps,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StepsCompanion copyWith(
      {Value<DateTime>? date, Value<int>? steps, Value<int>? rowid}) {
    return StepsCompanion(
      date: date ?? this.date,
      steps: steps ?? this.steps,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsCompanion(')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardioPointsGoalTable extends CardioPointsGoal
    with TableInfo<$CardioPointsGoalTable, CardioPointsGoalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardioPointsGoalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cardioPointsGoalMeta =
      const VerificationMeta('cardioPointsGoal');
  @override
  late final GeneratedColumn<int> cardioPointsGoal = GeneratedColumn<int>(
      'cardio_points_goal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [date, cardioPointsGoal];
  @override
  String get aliasedName => _alias ?? 'cardio_points_goal';
  @override
  String get actualTableName => 'cardio_points_goal';
  @override
  VerificationContext validateIntegrity(
      Insertable<CardioPointsGoalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('cardio_points_goal')) {
      context.handle(
          _cardioPointsGoalMeta,
          cardioPointsGoal.isAcceptableOrUnknown(
              data['cardio_points_goal']!, _cardioPointsGoalMeta));
    } else if (isInserting) {
      context.missing(_cardioPointsGoalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  CardioPointsGoalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardioPointsGoalData(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      cardioPointsGoal: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}cardio_points_goal'])!,
    );
  }

  @override
  $CardioPointsGoalTable createAlias(String alias) {
    return $CardioPointsGoalTable(attachedDatabase, alias);
  }
}

class CardioPointsGoalData extends DataClass
    implements Insertable<CardioPointsGoalData> {
  final DateTime date;
  final int cardioPointsGoal;
  const CardioPointsGoalData(
      {required this.date, required this.cardioPointsGoal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['cardio_points_goal'] = Variable<int>(cardioPointsGoal);
    return map;
  }

  CardioPointsGoalCompanion toCompanion(bool nullToAbsent) {
    return CardioPointsGoalCompanion(
      date: Value(date),
      cardioPointsGoal: Value(cardioPointsGoal),
    );
  }

  factory CardioPointsGoalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardioPointsGoalData(
      date: serializer.fromJson<DateTime>(json['date']),
      cardioPointsGoal: serializer.fromJson<int>(json['cardioPointsGoal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'cardioPointsGoal': serializer.toJson<int>(cardioPointsGoal),
    };
  }

  CardioPointsGoalData copyWith({DateTime? date, int? cardioPointsGoal}) =>
      CardioPointsGoalData(
        date: date ?? this.date,
        cardioPointsGoal: cardioPointsGoal ?? this.cardioPointsGoal,
      );
  @override
  String toString() {
    return (StringBuffer('CardioPointsGoalData(')
          ..write('date: $date, ')
          ..write('cardioPointsGoal: $cardioPointsGoal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, cardioPointsGoal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardioPointsGoalData &&
          other.date == this.date &&
          other.cardioPointsGoal == this.cardioPointsGoal);
}

class CardioPointsGoalCompanion extends UpdateCompanion<CardioPointsGoalData> {
  final Value<DateTime> date;
  final Value<int> cardioPointsGoal;
  final Value<int> rowid;
  const CardioPointsGoalCompanion({
    this.date = const Value.absent(),
    this.cardioPointsGoal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardioPointsGoalCompanion.insert({
    required DateTime date,
    required int cardioPointsGoal,
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        cardioPointsGoal = Value(cardioPointsGoal);
  static Insertable<CardioPointsGoalData> custom({
    Expression<DateTime>? date,
    Expression<int>? cardioPointsGoal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (cardioPointsGoal != null) 'cardio_points_goal': cardioPointsGoal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardioPointsGoalCompanion copyWith(
      {Value<DateTime>? date,
      Value<int>? cardioPointsGoal,
      Value<int>? rowid}) {
    return CardioPointsGoalCompanion(
      date: date ?? this.date,
      cardioPointsGoal: cardioPointsGoal ?? this.cardioPointsGoal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (cardioPointsGoal.present) {
      map['cardio_points_goal'] = Variable<int>(cardioPointsGoal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardioPointsGoalCompanion(')
          ..write('date: $date, ')
          ..write('cardioPointsGoal: $cardioPointsGoal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StepsGoalTable extends StepsGoal
    with TableInfo<$StepsGoalTable, StepsGoalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsGoalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _stepsGoalMeta =
      const VerificationMeta('stepsGoal');
  @override
  late final GeneratedColumn<int> stepsGoal = GeneratedColumn<int>(
      'steps_goal', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [date, stepsGoal];
  @override
  String get aliasedName => _alias ?? 'steps_goal';
  @override
  String get actualTableName => 'steps_goal';
  @override
  VerificationContext validateIntegrity(Insertable<StepsGoalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('steps_goal')) {
      context.handle(_stepsGoalMeta,
          stepsGoal.isAcceptableOrUnknown(data['steps_goal']!, _stepsGoalMeta));
    } else if (isInserting) {
      context.missing(_stepsGoalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  StepsGoalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StepsGoalData(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      stepsGoal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}steps_goal'])!,
    );
  }

  @override
  $StepsGoalTable createAlias(String alias) {
    return $StepsGoalTable(attachedDatabase, alias);
  }
}

class StepsGoalData extends DataClass implements Insertable<StepsGoalData> {
  final DateTime date;
  final int stepsGoal;
  const StepsGoalData({required this.date, required this.stepsGoal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<DateTime>(date);
    map['steps_goal'] = Variable<int>(stepsGoal);
    return map;
  }

  StepsGoalCompanion toCompanion(bool nullToAbsent) {
    return StepsGoalCompanion(
      date: Value(date),
      stepsGoal: Value(stepsGoal),
    );
  }

  factory StepsGoalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StepsGoalData(
      date: serializer.fromJson<DateTime>(json['date']),
      stepsGoal: serializer.fromJson<int>(json['stepsGoal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<DateTime>(date),
      'stepsGoal': serializer.toJson<int>(stepsGoal),
    };
  }

  StepsGoalData copyWith({DateTime? date, int? stepsGoal}) => StepsGoalData(
        date: date ?? this.date,
        stepsGoal: stepsGoal ?? this.stepsGoal,
      );
  @override
  String toString() {
    return (StringBuffer('StepsGoalData(')
          ..write('date: $date, ')
          ..write('stepsGoal: $stepsGoal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, stepsGoal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StepsGoalData &&
          other.date == this.date &&
          other.stepsGoal == this.stepsGoal);
}

class StepsGoalCompanion extends UpdateCompanion<StepsGoalData> {
  final Value<DateTime> date;
  final Value<int> stepsGoal;
  final Value<int> rowid;
  const StepsGoalCompanion({
    this.date = const Value.absent(),
    this.stepsGoal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StepsGoalCompanion.insert({
    required DateTime date,
    required int stepsGoal,
    this.rowid = const Value.absent(),
  })  : date = Value(date),
        stepsGoal = Value(stepsGoal);
  static Insertable<StepsGoalData> custom({
    Expression<DateTime>? date,
    Expression<int>? stepsGoal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (stepsGoal != null) 'steps_goal': stepsGoal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StepsGoalCompanion copyWith(
      {Value<DateTime>? date, Value<int>? stepsGoal, Value<int>? rowid}) {
    return StepsGoalCompanion(
      date: date ?? this.date,
      stepsGoal: stepsGoal ?? this.stepsGoal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (stepsGoal.present) {
      map['steps_goal'] = Variable<int>(stepsGoal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsGoalCompanion(')
          ..write('date: $date, ')
          ..write('stepsGoal: $stepsGoal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $StepsTable steps = $StepsTable(this);
  late final $CardioPointsGoalTable cardioPointsGoal =
      $CardioPointsGoalTable(this);
  late final $StepsGoalTable stepsGoal = $StepsGoalTable(this);
  late final StepsDao stepsDao = StepsDao(this as AppDb);
  late final StepsGoalDao stepsGoalDao = StepsGoalDao(this as AppDb);
  late final CardioPointsGoalDao cardioPointsGoalDao =
      CardioPointsGoalDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [steps, cardioPointsGoal, stepsGoal];
}
