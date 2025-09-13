import 'package:todo/features/home/data/models/task.dart';

abstract class DatabaseRepository {
  Future<void> init();
  Future<List<Task>> getTasks();
  Future<void> insertTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
  Future<void> clear();
  Future<void> close();
}