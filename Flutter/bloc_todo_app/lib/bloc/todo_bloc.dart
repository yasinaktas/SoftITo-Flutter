import 'package:bloc_todo_app/bloc/todo_event.dart';
import 'package:bloc_todo_app/bloc/todo_state.dart';
import 'package:bloc_todo_app/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: [])) {
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = List<Todo>.from(state.todos)..add(event.todo);
    emit(state.copyWith(todos: updatedTodos));
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) {
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(event.index);
    emit(state.copyWith(todos: updatedTodos));
  }
}
