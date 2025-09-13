part of 'task_bloc.dart';


sealed class TaskEvent {}
final class LoadTasksEvent extends TaskEvent {}
final class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);
}
final class CompleteTaskEvent extends TaskEvent {
  final int id;
  CompleteTaskEvent(this.id);
}
final class DeleteTaskEvent extends TaskEvent {
  final int id;
  DeleteTaskEvent(this.id);
}
final class UpdateTaskEvent extends TaskEvent {
  final Task task;
  UpdateTaskEvent({required this.task});
}
final class ClearTaskEvent extends TaskEvent {}

