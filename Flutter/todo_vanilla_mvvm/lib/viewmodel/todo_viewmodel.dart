import 'package:flutter/material.dart';
import 'package:todo_vanilla_mvvm/model/app_state.dart';
import 'package:todo_vanilla_mvvm/model/todo.dart';
import 'package:todo_vanilla_mvvm/model/todo_info.dart';
import 'package:todo_vanilla_mvvm/model/todo_model.dart';

class TodoViewmodel extends ChangeNotifier {
  final TodoModel _todoModel = TodoModel();

  AppState<TodoInfo> _appState = AppState<TodoInfo>(
    info: TodoInfo(
      todos: <Todo>[],
      totalCount: 0,
      completedCount: 0,
      unCompletedCount: 0,
    ),
  );

  AppState<TodoInfo> get appState => _appState;

  TodoViewmodel() {
    _todoModel.todoStream.listen((todoInfo) {
      _appState = _appState.copyWith(info: todoInfo);
    });
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    _appState = _appState.copyWith(isLoading: true);
    notifyListeners();
    try {
      await _todoModel.addTodo(todo);
      _appState = _appState.copyWith(isLoading: false);
    } catch (e) {
      _appState = _appState.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> updateTodo(Todo todo) async {
    _appState = _appState.copyWith(isLoading: true);
    notifyListeners();
    try {
      await _todoModel.updateTodo(todo);
      _appState = _appState.copyWith(isLoading: false);
    } catch (e) {
      _appState = _appState.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    _appState = _appState.copyWith(isLoading: true);
    notifyListeners();
    try {
      await _todoModel.deleteTodo(todo);
      _appState = _appState.copyWith(isLoading: false);
    } catch (e) {
      _appState = _appState.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  void clearError() {
    _appState = _appState.copyWith(errorMessage: null);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _todoModel.dispose();
  }
}
