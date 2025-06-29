import 'package:clone_todo_homepage/models/task_today.dart';
import 'package:clone_todo_homepage/views/home_page.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  final TaskToday taskToday;
  const TaskDetail({super.key, required this.taskToday});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Today task",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset("images/pencil.png")),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.taskToday.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/profile1.png"),
                  ),
                  SizedBox(width: 12),
                  Text("Created by"),
                  SizedBox(width: 4),
                  Text(
                    "Yasin Aktaş",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(widget.taskToday.description),
              Row(
                spacing: 8,
                children: [
                  Image.asset("images/flag_red.png"),
                  Text(widget.taskToday.date),
                ],
              ),
              Row(
                spacing: 6,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "High",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 32,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "5 Scare",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    "stop starting, start finishing",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Stack(
                    children: [
                      for (
                        int i = 0;
                        i < widget.taskToday.imagePathList.length;
                        i++
                      )
                        Padding(
                          padding: EdgeInsets.only(left: 24.0 * i),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              widget.taskToday.imagePathList[i],
                            ),
                            radius: 20,
                          ),
                        ),
                    ],
                  ),
                  Text("+4"),
                ],
              ),
              Text(
                "Subtask",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              HomeCard3(taskToday: widget.taskToday),
              HomeCard3(taskToday: widget.taskToday),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.add, size: 20),
                        Text(
                          "Add subtask",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Attachment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              HomeCard3(taskToday: widget.taskToday),
              HomeCard3(taskToday: widget.taskToday),
            ],
          ),
        ),
      ),
    );
  }
}
