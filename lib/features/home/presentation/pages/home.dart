import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/data/repositories/database.dart';
import 'package:todo/features/home/presentation/bloc/nav/nav_bloc.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../bloc/task/task_bloc.dart';
import '../widgets/add_task.dart';
import '../widgets/list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    TaskDB().init();
    List<String> titles = ['Today Tasks', 'Late Tasks', 'Completed Tasks'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavBloc()),
        BlocProvider(create: (_) => TaskBloc()),
      ],
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('To Do'),
          actions: [
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.showBottomSheet(
                  (context) => AddTaskBottomSheet(),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<NavBloc, NavState>(
          builder: (context, state) {
            context.read<TaskBloc>().add(LoadTasksEvent());
            return WaterDropNavBar(
              backgroundColor: theme.colorScheme.primary,
              waterDropColor: theme.colorScheme.onPrimary,
              bottomPadding: 10,
              inactiveIconColor: theme.disabledColor,
              iconSize: 30,
              barItems: [
                BarItem(
                  filledIcon: Icons.toc,
                  outlinedIcon: Icons.toc_outlined,
                ),
                BarItem(
                  filledIcon: Icons.assignment_late,
                  outlinedIcon: Icons.assignment_late_outlined,
                ),
                BarItem(
                  filledIcon: Icons.done_all_rounded,
                  outlinedIcon: Icons.done_all_outlined,
                ),
              ],
              onItemSelected: (int index) {
                context.read<NavBloc>().add(NavIndexChanged(index));
              },
              selectedIndex: state.selectedIndex,
            );
          },
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, tasksState) {
            return BlocSelector<NavBloc, NavState, int>(
              selector: (state) => state.selectedIndex,
              builder: (context, index) {
                return tasksState.isLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: height * 0.33,
                        ),
                        child: LinearProgressIndicator(
                          minHeight: 15,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                    : ToDoList(
                        pageTitle: titles[index],
                        tasks: tasksState.tasks[index] ?? [],
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
// BlocSelector<NavBloc, NavState, int>(
// selector: (state) => state.selectedIndex,
// builder: (context, index) {
// return tasksState.isLoading
// ? Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 50.0,
// vertical: height * 0.33,
// ),
// child: LinearProgressIndicator(
// minHeight: 15,
// borderRadius: BorderRadius.circular(4),
// ),
// )
//     : ToDoList(
// pageTitle: titles[index],
// tasks: tasksState.tasks[index] ?? [],
// );
// },
// )