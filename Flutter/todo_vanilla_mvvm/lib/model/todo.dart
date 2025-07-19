class Todo {
  final String title;
  final String description;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
