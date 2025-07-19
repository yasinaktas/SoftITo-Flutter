import 'package:flutter/material.dart';
import 'package:todo_vanilla_mvvm/view/todo_list_page.dart';
import 'package:todo_vanilla_mvvm/viewmodel/todo_viewmodel.dart';
import 'package:todo_vanilla_mvvm/viewmodel/todo_viewmodel_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoViewmodelProvider(
      viewmodel: TodoViewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoListPage(),
      ),
    );
  }
}
