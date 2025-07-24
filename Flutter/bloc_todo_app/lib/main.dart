import 'package:bloc_todo_app/bloc/todo_bloc.dart';
import 'package:bloc_todo_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<TodoBloc>(create: (_) => TodoBloc())],
      child: MaterialApp(home: const HomePage()),
    );
  }
}
