import 'dart:async';

import 'package:todo_vanilla_mvvm/model/todo.dart';
import 'package:todo_vanilla_mvvm/model/todo_info.dart';

class TodoModel {
  final TodoInfo _todoInfo = TodoInfo(
    todos: [],
    totalCount: 0,
    completedCount: 0,
    unCompletedCount: 0,
  );
  TodoInfo get todoInfo => _todoInfo;

  final StreamController<TodoInfo> todoStreamController =
      StreamController<TodoInfo>();
  Stream<TodoInfo> get todoStream => todoStreamController.stream;
  Future<TodoInfo> get todoInfoFuture async {
    return _todoInfo;
  }

  Future<void> addTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    _todoInfo.todos.add(todo);
    _todoInfo.totalCount++;
    if (todo.isCompleted) {
      _todoInfo.completedCount++;
    } else {
      _todoInfo.unCompletedCount++;
    }
    todoStreamController.add(_todoInfo);
  }

  Future<void> updateTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    final index = _todoInfo.todos.indexWhere(
      (t) => t.title == todo.title && t.description == todo.description,
    );
    if (index != -1) {
      _todoInfo.todos[index] = todo;
      todoStreamController.add(_todoInfo);
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay
    _todoInfo.todos.removeWhere(
      (t) => t.title == todo.title && t.description == todo.description,
    );
    _todoInfo.totalCount--;
    if (todo.isCompleted) {
      _todoInfo.completedCount--;
    } else {
      _todoInfo.unCompletedCount--;
    }
    todoStreamController.add(_todoInfo);
  }

  void dispose() {
    todoStreamController.close();
  }
}
