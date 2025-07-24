import 'package:bloc_todo_app/models/todo.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent({required this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  final int index;

  DeleteTodoEvent({required this.index});
}
