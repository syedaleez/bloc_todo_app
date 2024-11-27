import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoApi {
  final String baseUrl = 'https://crudcrud.com/api/48b1e591d3bf4e4489adf822f3e00639/todos';

  // Future<List<Todo>> fetchTodos() async {
  //   final response = await http.get(Uri.parse(baseUrl));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = jsonDecode(response.body);
  //     return data.map((item) => Todo.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load todos');
  //   }
  // }
//new methoddddddddddddd
Future<List<Todo>> fetchTodos() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((data) => Todo.fromJson(data)).toList();
  } else {
    print('Failed to load todos: ${response.statusCode}');
    throw Exception('Failed to load todos');
  }
}



  // Future<void> addTodo(Todo todo) async {
  //   await http.post(
  //     Uri.parse(baseUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(todo.toJson()),
  //   );
  // }

Future<void> addTodo(Todo todo) async {
  final response = await http.post(
    Uri.parse(baseUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(todo.toJson()),
  );

  print('Status Code: ${response.statusCode}');
  print('Response Body: ${response.body}');

  if (response.statusCode == 201) { // 201 sucess hogya else fail to add in api
    print('Todo added successfully');
  } else {
    print('Failed to add todo: ${response.body}');
    throw Exception('Failed to add todo');
  }
}



  Future<void> deleteTodo(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
