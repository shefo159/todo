import 'package:sqflite/sqflite.dart';
import 'package:todo/core/constants/db_strings.dart';
import 'package:todo/features/home/data/models/task.dart';
import 'package:todo/features/home/domain/repositories/database.dart';

class TaskDB extends DatabaseRepository{
  // Singleton pattern
  TaskDB._();
  static final TaskDB instance = TaskDB._();
  factory TaskDB() {
    return instance;
  }


  Database? database;

  @override
  Future<void> clear() {
    return database!.delete(tableTasks);
  }

  @override
  Future<void> close() {
    return database!.close();
  }

  @override
  Future<void> deleteTask(int id) {
    return database!.delete(
      tableTasks,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Task>> getTasks() {
    return database!.query(tableTasks,orderBy:columnDate).then((maps) {
      return List.generate(maps.length, (index) {
        return Task.fromMap(maps[index]);
      });
    });
  }

  @override
  Future<void> init() {
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableTasks ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,
           $columnTitle TEXT,
            $columnDescription TEXT,
             $columnDate TEXT,
              $columnIsCompleted BOOLEAN
              )''',

        );
      },
      onOpen: (db) {
        database =db;
      },
    );
  }

  @override
  Future<void> insertTask(Task task) {
    return database!.insert(tableTasks, task.toMap());
  }

  @override
  Future<void> updateTask(Task task) {
    return database!.update(
      tableTasks,
      task.toMap(),
      where: '$columnId = ?',
      whereArgs: [task.id],
    );
  }
  
}