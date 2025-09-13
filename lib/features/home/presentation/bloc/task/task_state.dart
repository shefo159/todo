part of 'task_bloc.dart';


sealed class TaskState extends Equatable {
  final Map<int, List<Task>> tasks;
  final bool isLoading;
  const TaskState(this.isLoading,this.tasks);
}

final class TaskInitial extends TaskState {
  TaskInitial() : super(true,{});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class TaskLoading extends TaskState {
  TaskLoading() : super(true, {});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
final class AddingTask extends TaskState{
  AddingTask():super(true,{});

  @override
  List<Object?> get props => [{}];

}
final class TaskAdded extends TaskState{
  TaskAdded():super(false,{});

  @override
  List<Object?> get props => [{}];

}
final class TasksLoaded extends TaskState {
  final Map<int, List<Task>> tasklist;
  const TasksLoaded(this.tasklist) : super(false, tasklist);

  @override
  // TODO: implement props
  List<Object?> get props => [tasklist];
}
final class TasksError extends TaskState {
  final String message;
   TasksError(this.message) : super(false, {});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
