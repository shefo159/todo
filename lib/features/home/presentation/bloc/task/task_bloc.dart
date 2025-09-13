import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/data/repositories/database.dart';
import '../../../data/models/date.dart';
import '../../../data/models/task.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      TaskDB().database == null ? await TaskDB().init() : null;
      try {
        final tasks = await TaskDB().getTasks();
        final sortedTasks = sortTasks(tasks);
        emit(TasksLoaded(sortedTasks));
      } catch (error) {
        emit(TasksError(error.toString()));
      }
    });
    on<AddTaskEvent>((event, emit) async {
      try {
        emit(AddingTask());
        TaskDB().insertTask(event.task);
        emit(TaskAdded());
        final tasks = await TaskDB().getTasks();
        final sortedTasks = sortTasks(tasks);
        emit(TasksLoaded(sortedTasks));
      } catch (error) {
        emit(TasksError(error.toString()));
      }
    });
    on<DeleteTaskEvent>((event, emit) async {
      try {
        await TaskDB().deleteTask(event.id);
        final tasks = await TaskDB().getTasks();
        final sortedTasks = sortTasks(tasks);
        emit(TasksLoaded(sortedTasks));
      } catch (error) {
        emit(TasksError(error.toString()));
      }
    });
    on<UpdateTaskEvent>((event, emit) async {
      try {
        await TaskDB().updateTask(event.task);
        final tasks = await TaskDB().getTasks();
        final sortedTasks = sortTasks(tasks);
        emit(TasksLoaded(sortedTasks));
      } catch (error) {
        emit(TasksError(error.toString()));
      }
    });
    on<ClearTaskEvent>((event, emit) async {
      try {
        await TaskDB().clear();
        emit(TasksLoaded({}));
      } catch (error) {
        emit(TasksError(error.toString()));
      }
    });
  }

  Map<int, List<Task>> sortTasks(List<Task> tasks) {
    return {
      0: tasks.where((task) {
        return DateModel(date: task.date) == DateModel(date: DateTime.now());
      }).toList(),
      1: tasks.where((task) {
        return task.date.isBefore(DateTime.now()) && task.isCompleted == false;
      }).toList(),
      2: tasks.where((task) {
        return task.isCompleted;
      }).toList(),
    };
  }
}
