import 'package:flutter/material.dart';
import 'package:todo_vanilla_mvvm/model/todo.dart';
import 'package:todo_vanilla_mvvm/view/todo_add_page.dart';
import 'package:todo_vanilla_mvvm/viewmodel/todo_viewmodel.dart';
import 'package:todo_vanilla_mvvm/viewmodel/todo_viewmodel_provider.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late final TodoViewmodel _todoViewmodel;

  @override
  void initState() {
    super.initState();
    _todoViewmodel = TodoViewmodelProvider.read(context);
  }

  @override
  void dispose() {
    super.dispose();
    _todoViewmodel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _todoViewmodel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Todo List', style: TextStyle(fontSize: 20)),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Divider(color: Colors.grey.shade300),
            ),
            actions: [
              Visibility(
                visible: _todoViewmodel.appState.isLoading,
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Todo todo = await Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => TodoAddPage()));
              _todoViewmodel.addTodo(todo);
            },
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            itemCount: _todoViewmodel.appState.info.todos.length,
            itemBuilder: (context, index) {
              final todo = _todoViewmodel.appState.info.todos[index];
              return Dismissible(
                key: Key(todo.title + todo.description),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.check, color: Colors.white),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    return await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete Todo'),
                          content: Text(
                            'Are you sure you want to delete this todo?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                _todoViewmodel.deleteTodo(todo);
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (direction == DismissDirection.endToStart) {
                    todo.isCompleted = !todo.isCompleted;
                    _todoViewmodel.updateTodo(todo);
                    return false; // Do not dismiss, just update the todo
                  }
                  return false; // Default case, do not dismiss
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: todo.isCompleted
                        ? Colors.green
                        : Colors.indigoAccent,
                    child: todo.isCompleted
                        ? Icon(Icons.check, color: Colors.white)
                        : Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) {
                      todo.isCompleted = value ?? false;
                      _todoViewmodel.updateTodo(todo);
                    },
                  ),
                  onLongPress: () {
                    _todoViewmodel.deleteTodo(todo);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
