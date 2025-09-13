import 'package:todo/core/constants/db_strings.dart';

class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
  });

  Task.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        title = map[columnTitle],
        description = map[columnDescription],
        date = DateTime.parse(map[columnDate]),
        isCompleted = map[columnIsCompleted] == 1;

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnTitle: title,
      columnDescription: description,
      columnDate: date.toIso8601String(),
      columnIsCompleted: isCompleted ? 1 : 0,
    };
  }
  Task.onChange(Task task):
      id=task.id,
  title=task.title,
  description=task.description,
  date=task.date,
  isCompleted=!task.isCompleted;
}