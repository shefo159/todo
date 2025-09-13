import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/counter/counter_bloc.dart';

import 'core/constants/routes.dart';
import 'core/constants/themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.system,
      routes: Routes.routes,
      initialRoute: Routes.initial,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>[
            Expanded(child: SizedBox()),
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(Decrement()),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Expanded(child: SizedBox()),
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(Increment()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
