// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TaskDao? _taskDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `task` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `category` INTEGER NOT NULL, `date` TEXT NOT NULL, `priority` INTEGER NOT NULL, `isComplete` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }
}

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskEntityInsertionAdapter = InsertionAdapter(
            database,
            'task',
            (TaskEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'category': item.category.index,
                  'date': item.date,
                  'priority': item.priority.index,
                  'isComplete': item.isComplete ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskEntity> _taskEntityInsertionAdapter;

  @override
  Future<List<TaskEntity>> fetchAllTask() async {
    return _queryAdapter.queryList('SELECT *     FROM task',
        mapper: (Map<String, Object?> row) => TaskEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            description: row['description'] as String,
            category: Category.values[row['category'] as int],
            date: row['date'] as String,
            priority: Priority.values[row['priority'] as int],
            isComplete: (row['isComplete'] as int) != 0));
  }

  @override
  Future<void> deleteTask(int id) async {
    await _queryAdapter.queryNoReturn('DELETE     FROM task     WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertTask(TaskEntity entity) async {
    await _taskEntityInsertionAdapter.insert(
        entity, OnConflictStrategy.replace);
  }
}
