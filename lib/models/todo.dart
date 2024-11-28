// class Todo {
//   final String id;
//   final String title;
//   final bool isCompleted;

//   Todo({required this.id, required this.title, this.isCompleted = false});

//   // Convert JSON to Todo
//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       id: json['_id'],
//       title: json['title'],
//       isCompleted: json['isCompleted'],
//     );
//   }

//   // Convert Todo to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'isCompleted': isCompleted,
//     };
//   }
// }




class Todo {
  final String id;
  final String title;
  final String description;  // New field
  final String dueDate;       // New field
  final bool isCompleted;

  Todo({required this.id, required this.title, this.description = '', this.dueDate = '', this.isCompleted = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      description: json['description'] ?? '',
      dueDate: json['dueDate'] ?? '',
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'isCompleted': isCompleted,
    };
  }
}
