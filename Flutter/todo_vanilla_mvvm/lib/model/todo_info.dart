import 'package:todo_vanilla_mvvm/model/todo.dart';

class TodoInfo {
  final List<Todo> todos;
  int totalCount;
  int completedCount;
  int unCompletedCount;

  TodoInfo({
    required this.todos,
    required this.totalCount,
    required this.completedCount,
    required this.unCompletedCount,
  });
}
