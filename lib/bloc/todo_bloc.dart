import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/todo_api.dart';
import '../models/todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoApi api;

  TodoBloc(this.api) : super(TodoLoading()) {
    // on<LoadTodos>((event, emit) async {
    //   try {
    //     final todos = await api.fetchTodos();
    //     emit(TodoLoaded(todos));
    //   } catch (_) {
    //     emit(TodoError());
    //   }
    // });
on<LoadTodos>((event, emit) async {
  emit(TodoLoading());
  try {
    final todos = await api.fetchTodos();
    emit(TodoLoaded(todos));
  } catch (error) {
    print('Error loading todos: $error');
    emit(TodoError());
  }
});



    on<AddTodo>((event, emit) async {
      await api.addTodo(event.todo);
      add(LoadTodos());
    });

    on<DeleteTodo>((event, emit) async {
      await api.deleteTodo(event.id);
      add(LoadTodos());
    });
  }
}
