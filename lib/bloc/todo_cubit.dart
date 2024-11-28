// import 'package:counter/models/todo.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../api/todo_api.dart';
// import 'todo_state.dart';

// class TodoCubit extends Cubit<TodoState> {
//   final TodoApi api;

//   TodoCubit(this.api) : super(TodoLoading()) {
//     loadTodos(); // Initial data load
//   }

//   Future<void> loadTodos() async {
//     try {
//       emit(TodoLoading());
//       final todos = await api.fetchTodos();
//       emit(TodoLoaded(todos));
//     } catch (e) {
//       emit(TodoError('Failed to fetch todos'));
//     }
//   }

//   Future<void> addTodo(Todo todo) async {
//     try {
//       await api.addTodo(todo);
//       loadTodos();  // Reload the list after adding
//     } catch (e) {
//       emit(TodoError('Failed to add todo'));
//     }
//   }
// }



import 'package:counter/api/todo_api.dart';
import 'package:counter/bloc/todo_state.dart';
import 'package:counter/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoApi api;

  TodoCubit(this.api) : super(TodoLoading()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      emit(TodoLoading());
      final todos = await api.fetchTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError('Failed to fetch todos'));
    }
  }

  Future<void> addTodo(Todo todo) async {
    if (todo.title.isEmpty) {
        print('fill fields first');
      }
    else{
    try {
      
      await api.addTodo(todo);
      loadTodos();
    } catch (e) {
      emit(TodoError('Failed to add todo'));
    }}
  }

  Future<void> deleteTodo(String id) async {
    try {
      await api.deleteTodo(id);
      loadTodos();
    } catch (e) {
      emit(TodoError('Failed to delete todo'));
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await api.updateTodo(todo.id, todo);
      loadTodos();
    } catch (e) {
      emit(TodoError('Failed to update todo'));
    }
  }
}
