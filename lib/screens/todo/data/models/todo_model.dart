class TodoModel {
  final String id;
  final String task;

  TodoModel({
    required this.id,
    required this.task,
  });

  static TodoModel fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String? ?? "field empty",
      task: json['task'] as String? ?? "field empty",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
    };
  }
}
