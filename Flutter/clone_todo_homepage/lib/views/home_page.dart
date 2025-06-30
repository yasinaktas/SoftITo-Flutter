import 'dart:math';

import 'package:clone_todo_homepage/models/task_today.dart';
import 'package:clone_todo_homepage/views/task_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskToday> tasksToday = [
    TaskToday(
      title: "UX Design for MONS calendar",
      description:
          "Ekranları tasarla, bottom navigation bar yerleştir, drawer ekle, tabbar sekmelerini ekle",
      date: "Oct 25, 2025",
      imagePathList: [
        "images/profile2.png",
        "images/profile3.png",
        "images/profile4.png",
        "images/profile5.png",
      ],
    ),
    TaskToday(
      title: "UX Design for MONS calendar",
      description:
          "Ekranları tasarla, bottom navigation bar yerleştir, drawer ekle, tabbar sekmelerini ekle",
      date: "Oct 25, 2025",
      imagePathList: [
        "images/profile3.png",
        "images/profile4.png",
        "images/profile5.png",
        "images/profile6.png",
      ],
    ),
    TaskToday(
      title: "UX Design for MONS calendar",
      description:
          "Ekranları tasarla, bottom navigation bar yerleştir, drawer ekle, tabbar sekmelerini ekle",
      date: "Oct 25, 2025",
      imagePathList: [
        "images/profile3.png",
        "images/profile4.png",
        "images/profile5.png",
        "images/profile6.png",
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 12),
        child: ListView(
          children: [
            Row(
              children: [
                Text("4 New", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text("tasks today"),
              ],
            ),
            TodayTasksList(tasksToday: tasksToday),
            Row(
              spacing: 4,
              children: [
                Text(
                  "To",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Do",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade100,
                  radius: 16,
                  child: Text(
                    tasksToday.length.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            TodayTasksListSmall(tasksToday: tasksToday),
            Row(
              spacing: 4,
              children: [
                Text(
                  "In",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Progress",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  radius: 16,
                  child: Text(
                    tasksToday.length.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            for (TaskToday taskToday in tasksToday)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: HomeCard3(taskToday: taskToday),
              ),
          ],
        ),
      ),
    );
  }
}

class TodayTasksList extends StatefulWidget {
  final List<TaskToday> tasksToday;
  const TodayTasksList({super.key, required this.tasksToday});

  @override
  State<TodayTasksList> createState() => _TodayTasksListState();
}

class _TodayTasksListState extends State<TodayTasksList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tasksToday.length,
        itemBuilder: (context, index) {
          return HomeCard1(taskToday: widget.tasksToday[index]);
        },
      ),
    );
  }
}

class HomeCard1 extends StatelessWidget {
  final TaskToday taskToday;
  const HomeCard1({super.key, required this.taskToday});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final double hue = random.nextDouble() * 360;
    final double saturation = random.nextDouble() * 0.4 + 0.2;
    final double lightness = random.nextDouble() * 0.05 + 0.85;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetail(taskToday: taskToday),
          ),
        );
      },
      child: Container(
        width: 270,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor(),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          spacing: 12,
          children: [
            Text(
              taskToday.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Image.asset("images/flag_red.png"),
                SizedBox(width: 8),
                Text(taskToday.date),
              ],
            ),
            Text(
              taskToday.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Stack(
                  children: [
                    for (int i = 0; i < taskToday.imagePathList.length; i++)
                      Padding(
                        padding: EdgeInsets.only(left: 24.0 * i),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            taskToday.imagePathList[i],
                          ),
                          radius: 20,
                        ),
                      ),
                  ],
                ),
                Text("+4"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TodayTasksListSmall extends StatefulWidget {
  final List<TaskToday> tasksToday;
  const TodayTasksListSmall({super.key, required this.tasksToday});

  @override
  State<TodayTasksListSmall> createState() => _TodayTasksListSmallState();
}

class _TodayTasksListSmallState extends State<TodayTasksListSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tasksToday.length,
        itemBuilder: (context, index) {
          return HomeCard2(taskToday: widget.tasksToday[index]);
        },
      ),
    );
  }
}

class HomeCard2 extends StatelessWidget {
  final TaskToday taskToday;
  const HomeCard2({super.key, required this.taskToday});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final double hue = random.nextDouble() * 360;
    final double saturation = random.nextDouble() * 0.4 + 0.2;
    final double lightness = random.nextDouble() * 0.05 + 0.85;
    return Container(
      width: 170,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor(),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Urgent",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Text(
            taskToday.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Image.asset("images/flag_red.png"),
              SizedBox(width: 8),
              Text(taskToday.date),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeCard3 extends StatefulWidget {
  final TaskToday taskToday;
  const HomeCard3({super.key, required this.taskToday});

  @override
  State<HomeCard3> createState() => _HomeCard3State();
}

class _HomeCard3State extends State<HomeCard3> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    final double hue = random.nextDouble() * 360;
    final double saturation = random.nextDouble() * 0.3 + 0.4;
    final double lightness = random.nextDouble() * 0.15 + 0.75;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 16, top: 0),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: HSLColor.fromAHSL(
                1.0,
                hue,
                saturation,
                lightness,
              ).toColor(),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.taskToday.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Image.asset("images/flag.png"),
                          Text("6 hours"),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Checkbox(
                    value: isClicked,
                    onChanged: (newValue) {
                      setState(() {
                        isClicked = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
