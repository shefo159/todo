import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/data/models/task.dart';

import '../bloc/task/task_bloc.dart';


class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.pageTitle, required this.tasks});

  final String pageTitle;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pageTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            (tasks.isEmpty)? Center(
              child: Text( 'No tasks available', style: theme.textTheme.titleMedium)
            ) : Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index].id.toString()),
                    onDismissed: (direction) {
                      context.read<TaskBloc>().add(
                        DeleteTaskEvent(tasks[index].id!),
                      );
                    },
                    background: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text('Delete Task'),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: tasks[index].isCompleted,
                          onChanged: (value) {
                            context.read<TaskBloc>().add(
                              UpdateTaskEvent(task:Task.onChange(tasks[index]))
                            );
                          },
                        ),
                        title: Text(
                          tasks[index].title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          tasks[index].description,
                        ),
                        trailing: Text('${tasks[index].date.day}-${tasks[index].date.month}-${tasks[index].date.year}'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(color: theme.colorScheme.inverseSurface),
                  );
                },
                itemCount: tasks.length,
              ),
            ),


          ],
        );
      }
}
