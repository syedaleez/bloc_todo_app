import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../models/todo.dart';

class TodoScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
  title: const Center(
    child: Text(
      'To-Do List',
      style: TextStyle(
        fontSize: 24,              
        fontWeight: FontWeight.w600, 
        color: Colors.white,        
        letterSpacing: 1.2,         
        fontFamily: 'Roboto',       
      ),
    ),
  ),
  backgroundColor: Colors.deepPurple, 
  elevation: 6.0, 
  actions: [
    IconButton(
      icon: Icon(Icons.brightness_3_outlined, color: Colors.white), // Icon to add tasks
      onPressed: () {
        // Add action here
      },
    ),
  ],
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(20), 
    ),
  ),
  automaticallyImplyLeading: false, 
)
,
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
    style: TextStyle(
      color: Colors.deepPurple,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
  trailing: IconButton(
    icon: Icon(
      Icons.delete,
      color: Colors.deepPurple,
    ),
    onPressed: () {
      context.read<TodoBloc>().add(DeleteTodo(todo.id));
    },
  ),
  tileColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20, 
    vertical: 10,
  ),
  visualDensity: VisualDensity.compact,
  leading: Icon(
    Icons.task_alt,
    color: Colors.deepPurple,
  ),
);

              },
            );
          } else {
            return Center(child: Text('Error fetching data.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Add Todo'),
              content: TextField(controller: _controller),
              actions: [
                TextButton(
                  onPressed: () {
                    final todo = Todo(id: '', title: _controller.text);
                    context.read<TodoBloc>().add(AddTodo(todo));
                    _controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
