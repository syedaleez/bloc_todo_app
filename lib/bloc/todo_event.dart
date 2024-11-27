import 'package:equatable/equatable.dart';
import '../models/todo.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}
