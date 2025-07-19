import 'package:flutter/material.dart';
import 'package:todo_vanilla_mvvm/model/todo.dart';

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Add Todo", style: TextStyle(fontSize: 20)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.grey.shade300),
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter todo title',
                labelText: "Title",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please enter a description'
                  : null,
              decoration: InputDecoration(
                hintText: 'Enter todo description',
                labelText: "Description",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final todo = Todo(
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: false,
                  );
                  Navigator.of(context).pop(todo);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
