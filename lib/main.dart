import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/todo_api.dart';
import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: BlocProvider(
        create: (context) => TodoBloc(TodoApi())..add(LoadTodos()),
        child: TodoScreen(),
      ),
    );
  }
}
