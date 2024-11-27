import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../models/todo.dart';
import '../theme/theme_styles.dart';

class TodoScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
  title: const Center(
    child: Text(
      'To-Do List',
      style: ThemeStyles.appBarTitleStyle,
    ),
  ),
  backgroundColor: ThemeStyles.primaryColor,
  elevation: 6.0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
  ),
),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
  title: Text(
    todo.title,
    style: ThemeStyles.listTileTitleStyle,
  ),
  trailing: IconButton(
    icon: const Icon(
      Icons.delete,
      color: ThemeStyles.primaryColor,
    ),
    onPressed: () {
      context.read<TodoBloc>().add(DeleteTodo(todo.id));
    },
  ),
  tileColor: ThemeStyles.secondaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  ),
  visualDensity: VisualDensity.compact,
  leading: const Icon(
    Icons.task_alt,
    color: ThemeStyles.primaryColor,
  ),
);


              },
            );
          } else {
            return const Center(child: Text('Check Your WiFi/data.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Todo'),
              content: TextField(controller: _controller),
              actions: [
                TextButton(
                  onPressed: () {
                    final todo = Todo(id: '', title: _controller.text);
                    context.read<TodoBloc>().add(AddTodo(todo));
                    _controller.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
