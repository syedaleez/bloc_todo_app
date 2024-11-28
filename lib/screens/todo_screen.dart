// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/todo_cubit.dart';
// import '../bloc/todo_event.dart';
// import '../bloc/todo_state.dart';
// import '../models/todo.dart';
// import '../theme/theme_styles.dart';

// class TodoScreen extends StatelessWidget {
//   final _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//   title: const Center(
//     child: Text(
//       'To-Do List',
//       style: ThemeStyles.appBarTitleStyle,
//     ),
//   ),
//   backgroundColor: ThemeStyles.primaryColor,
//   elevation: 6.0,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.vertical(
//       bottom: Radius.circular(20),
//     ),
//   ),
// ),
//       body: BlocBuilder<TodoBloc, TodoState>(
//         builder: (context, state) {
//           if (state is TodoLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is TodoLoaded) {
//             return ListView.builder(
//               itemCount: state.todos.length,
//               itemBuilder: (context, index) {
//                 final todo = state.todos[index];
//                 return ListTile(
//   title: Text(
//     todo.title,
//     style: ThemeStyles.listTileTitleStyle,
//   ),
//   trailing: IconButton(
//     icon: const Icon(
//       Icons.delete,
//       color: ThemeStyles.primaryColor,
//     ),
//     onPressed: () {
//       context.read<TodoBloc>().add(DeleteTodo(todo.id));
//     },
//   ),
//   tileColor: ThemeStyles.secondaryColor,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(15),
//   ),
//   contentPadding: const EdgeInsets.symmetric(
//     horizontal: 20,
//     vertical: 10,
//   ),
//   visualDensity: VisualDensity.compact,
//   leading: const Icon(
//     Icons.task_alt,
//     color: ThemeStyles.primaryColor,
//   ),
// );


//               },
//             );
//           } else {
//             return const Center(child: Text('Check Your WiFi/data.'));
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: const Text('Add Todo'),
//               content: TextField(controller: _controller),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     final todo = Todo(id: '', title: _controller.text);
//                     context.read<TodoBloc>().add(AddTodo(todo));
//                     _controller.clear();
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


//2ndddddddddd
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/todo_cubit.dart';
// import '../bloc/todo_state.dart';
// import '../models/todo.dart';
// import '../theme/theme_styles.dart';

// class TodoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar:AppBar(
//   title: const Center(
//     child: Text(
//       'To-Do List',
//       style: ThemeStyles.appBarTitleStyle,
//     ),
//   ),
//   backgroundColor: ThemeStyles.primaryColor,
//   elevation: 6.0,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.vertical(
//       bottom: Radius.circular(20),
//     ),
//   ),
// ),
//       body: BlocBuilder<TodoCubit, TodoState>(
//         builder: (context, state) {
//           if (state is TodoLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is TodoLoaded) {
//             return ListView.builder(
//               itemCount: state.todos.length,
//               itemBuilder: (context, index) {
//                 final todo = state.todos[index];
//                 return ListTile(
//                   title: Text(todo.title),
//                   trailing: Checkbox(
//                     value: todo.isCompleted,
//                     onChanged: (value) {
//                       // Handle completion
//                     },
//                   ),
//                 );
//               },
//             );
//           } else if (state is TodoError) {
//             return Center(child: Text(state.message));
//           }
//           return Center(child: Text('No Todos found.'));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final newTodo = Todo(
//             title: 'New Todo',
//             isCompleted: false, 
//             id: '',
//           );
//           context.read<TodoCubit>().addTodo(newTodo);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }



//newwwwwwwwwwwwwww
import 'package:counter/bloc/todo_state.dart';
import 'package:counter/models/todo.dart';
import 'package:counter/theme/theme_styles.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_cubit.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Todo List')),
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
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple,style: BorderStyle.solid,)
                  ),
                  child: ListTile(
                    title: Text(todo.title,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(todo.description),
                    // leading:Icon(Icons.delete) ,
                    trailing: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        final updatedTodo = Todo(
                          id: todo.id,
                          title: todo.title,
                          description: todo.description,
                          dueDate: todo.dueDate,
                          isCompleted: value!,
                        );
                        context.read<TodoCubit>().updateTodo(updatedTodo);
                      },
                    ),
                    onTap: () {
                      // Navigate to detail view or show dialog
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(todo.title),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Description: ${todo.description}'),
                              Text('Due Date: ${todo.dueDate}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    onLongPress: () {
                      // Delete Todo
                      context.read<TodoCubit>().deleteTodo(todo.id);
                    },
                  ),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No Todos available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show input fields for title, description, and due date
          _showAddTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // void _showAddTodoDialog(BuildContext context) {
  //   String title = '';
  //   String description = '';
  //   String dueDate = '';

  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text('Add Todo'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           TextField(

  //             decoration: InputDecoration(labelText: 'Title'),
  //             onChanged: (value) => title = value,
  //           ),
  //           TextField(
  //             decoration: InputDecoration(labelText: 'Description'),
  //             onChanged: (value) => description = value,
  //           ),
  //           TextField(
  //             decoration: InputDecoration(labelText: 'Due Date'),
  //             onChanged: (value) => dueDate = value,
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             final newTodo = Todo(
  //               id: '',  // ID will be generated by the backend
  //               title: title,
  //               description: description,
  //               dueDate: dueDate,
  //             );
  //             context.read<TodoCubit>().addTodo(newTodo);
  //             Navigator.pop(context);
  //           },
  //           child: Text('Add'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('Cancel'),
  //         ),
  //       ],
  //     ),
  //   );
  // }


void _showAddTodoDialog(BuildContext context) {
  String title = '';
  String description = '';
  String dueDate = '';
  String errorMessage = ''; 

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder( 
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Add Todo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    errorText: errorMessage.isNotEmpty && titleController.text.isEmpty ? errorMessage : null,
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                TextField(
                  controller: dueDateController,
                  decoration: InputDecoration(
                    labelText: 'Due Date',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Validation logic
                  if (titleController.text.isEmpty) {
                    setState(() {
                      errorMessage = 'Title is required';
                    });
                  } else {
                    final newTodo = Todo(
                      id: '',
                      title: titleController.text,
                      description: descriptionController.text,
                      dueDate: dueDateController.text,
                    );
                    context.read<TodoCubit>().addTodo(newTodo);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    },
  );
}



}
