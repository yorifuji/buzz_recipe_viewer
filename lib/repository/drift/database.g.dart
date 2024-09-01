// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'database.dart';

// ignore_for_file: type=lint
class $RecipeNoteDBTable extends RecipeNoteDB
    with TableInfo<$RecipeNoteDBTable, RecipeNoteDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeNoteDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumnWithTypeConverter<RecipeNoteData, String> data =
      GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<RecipeNoteData>($RecipeNoteDBTable.$converterdata);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_note_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeNoteDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_dataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeNoteDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeNoteDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      data: $RecipeNoteDBTable.$converterdata.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
    );
  }

  @override
  $RecipeNoteDBTable createAlias(String alias) {
    return $RecipeNoteDBTable(attachedDatabase, alias);
  }

  static TypeConverter<RecipeNoteData, String> $converterdata =
      RecipeNoteData.converter;
}

class RecipeNoteDBData extends DataClass
    implements Insertable<RecipeNoteDBData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final RecipeNoteData data;
  const RecipeNoteDBData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['data'] =
          Variable<String>($RecipeNoteDBTable.$converterdata.toSql(data));
    }
    return map;
  }

  RecipeNoteDBCompanion toCompanion(bool nullToAbsent) {
    return RecipeNoteDBCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      data: Value(data),
    );
  }

  factory RecipeNoteDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeNoteDBData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      data: serializer.fromJson<RecipeNoteData>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'data': serializer.toJson<RecipeNoteData>(data),
    };
  }

  RecipeNoteDBData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          RecipeNoteData? data}) =>
      RecipeNoteDBData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        data: data ?? this.data,
      );
  RecipeNoteDBData copyWithCompanion(RecipeNoteDBCompanion data) {
    return RecipeNoteDBData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeNoteDBData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeNoteDBData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.data == this.data);
}

class RecipeNoteDBCompanion extends UpdateCompanion<RecipeNoteDBData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<RecipeNoteData> data;
  const RecipeNoteDBCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.data = const Value.absent(),
  });
  RecipeNoteDBCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required RecipeNoteData data,
  }) : data = Value(data);
  static Insertable<RecipeNoteDBData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (data != null) 'data': data,
    });
  }

  RecipeNoteDBCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<RecipeNoteData>? data}) {
    return RecipeNoteDBCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (data.present) {
      map['data'] =
          Variable<String>($RecipeNoteDBTable.$converterdata.toSql(data.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeNoteDBCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $FavoriteDBTable extends FavoriteDB
    with TableInfo<$FavoriteDBTable, FavoriteDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumnWithTypeConverter<FavoriteData, String> data =
      GeneratedColumn<String>('data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<FavoriteData>($FavoriteDBTable.$converterdata);
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, updatedAt, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_dataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      data: $FavoriteDBTable.$converterdata.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!),
    );
  }

  @override
  $FavoriteDBTable createAlias(String alias) {
    return $FavoriteDBTable(attachedDatabase, alias);
  }

  static TypeConverter<FavoriteData, String> $converterdata =
      FavoriteData.converter;
}

class FavoriteDBData extends DataClass implements Insertable<FavoriteDBData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final FavoriteData data;
  const FavoriteDBData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['data'] =
          Variable<String>($FavoriteDBTable.$converterdata.toSql(data));
    }
    return map;
  }

  FavoriteDBCompanion toCompanion(bool nullToAbsent) {
    return FavoriteDBCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      data: Value(data),
    );
  }

  factory FavoriteDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteDBData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      data: serializer.fromJson<FavoriteData>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'data': serializer.toJson<FavoriteData>(data),
    };
  }

  FavoriteDBData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          FavoriteData? data}) =>
      FavoriteDBData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        data: data ?? this.data,
      );
  FavoriteDBData copyWithCompanion(FavoriteDBCompanion data) {
    return FavoriteDBData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteDBData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteDBData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.data == this.data);
}

class FavoriteDBCompanion extends UpdateCompanion<FavoriteDBData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<FavoriteData> data;
  const FavoriteDBCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.data = const Value.absent(),
  });
  FavoriteDBCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required FavoriteData data,
  }) : data = Value(data);
  static Insertable<FavoriteDBData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (data != null) 'data': data,
    });
  }

  FavoriteDBCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<FavoriteData>? data}) {
    return FavoriteDBCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (data.present) {
      map['data'] =
          Variable<String>($FavoriteDBTable.$converterdata.toSql(data.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteDBCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipeNoteDBTable recipeNoteDB = $RecipeNoteDBTable(this);
  late final $FavoriteDBTable favoriteDB = $FavoriteDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recipeNoteDB, favoriteDB];
}

typedef $$RecipeNoteDBTableCreateCompanionBuilder = RecipeNoteDBCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  required RecipeNoteData data,
});
typedef $$RecipeNoteDBTableUpdateCompanionBuilder = RecipeNoteDBCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<RecipeNoteData> data,
});

class $$RecipeNoteDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeNoteDBTable,
    RecipeNoteDBData,
    $$RecipeNoteDBTableFilterComposer,
    $$RecipeNoteDBTableOrderingComposer,
    $$RecipeNoteDBTableCreateCompanionBuilder,
    $$RecipeNoteDBTableUpdateCompanionBuilder> {
  $$RecipeNoteDBTableTableManager(_$AppDatabase db, $RecipeNoteDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RecipeNoteDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RecipeNoteDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<RecipeNoteData> data = const Value.absent(),
          }) =>
              RecipeNoteDBCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            data: data,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            required RecipeNoteData data,
          }) =>
              RecipeNoteDBCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            data: data,
          ),
        ));
}

class $$RecipeNoteDBTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RecipeNoteDBTable> {
  $$RecipeNoteDBTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<RecipeNoteData, RecipeNoteData, String>
      get data => $state.composableBuilder(
          column: $state.table.data,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$RecipeNoteDBTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RecipeNoteDBTable> {
  $$RecipeNoteDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get data => $state.composableBuilder(
      column: $state.table.data,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FavoriteDBTableCreateCompanionBuilder = FavoriteDBCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  required FavoriteData data,
});
typedef $$FavoriteDBTableUpdateCompanionBuilder = FavoriteDBCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<FavoriteData> data,
});

class $$FavoriteDBTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteDBTable,
    FavoriteDBData,
    $$FavoriteDBTableFilterComposer,
    $$FavoriteDBTableOrderingComposer,
    $$FavoriteDBTableCreateCompanionBuilder,
    $$FavoriteDBTableUpdateCompanionBuilder> {
  $$FavoriteDBTableTableManager(_$AppDatabase db, $FavoriteDBTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoriteDBTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoriteDBTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<FavoriteData> data = const Value.absent(),
          }) =>
              FavoriteDBCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            data: data,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            required FavoriteData data,
          }) =>
              FavoriteDBCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            data: data,
          ),
        ));
}

class $$FavoriteDBTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FavoriteDBTable> {
  $$FavoriteDBTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<FavoriteData, FavoriteData, String> get data =>
      $state.composableBuilder(
          column: $state.table.data,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$FavoriteDBTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FavoriteDBTable> {
  $$FavoriteDBTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get data => $state.composableBuilder(
      column: $state.table.data,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeNoteDBTableTableManager get recipeNoteDB =>
      $$RecipeNoteDBTableTableManager(_db, _db.recipeNoteDB);
  $$FavoriteDBTableTableManager get favoriteDB =>
      $$FavoriteDBTableTableManager(_db, _db.favoriteDB);
}
