class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({required this.id, required this.title, this.isCompleted = false});

  // Convert JSON to Todo
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  // Convert Todo to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
