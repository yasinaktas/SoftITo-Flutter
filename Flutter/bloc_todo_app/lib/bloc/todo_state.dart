import 'package:bloc_todo_app/models/todo.dart';

class TodoState {
  final List<Todo> todos;

  TodoState({required this.todos});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }
}
