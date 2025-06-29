import 'package:clone_todo_homepage/views/home_page.dart';
import 'package:clone_todo_homepage/views/notifications_page.dart';
import 'package:clone_todo_homepage/views/profile_page.dart';
import 'package:clone_todo_homepage/views/search_page.dart';
import 'package:clone_todo_homepage/views/tasks_page.dart';
import 'package:flutter/material.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    TasksPage(),
    NotificationsPage(),
    ProfilePage(),
  ];
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset("images/profile1.png"),
            SizedBox(width: 8),
            Text("Hello,", style: TextStyle(fontSize: 16)),
            Text(
              "Yasin Aktaş",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.diamond, color: Colors.orange),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: pages[selectedPageIndex],
      drawer: Drawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 24.0,
          left: 24,
          right: 24,
          top: 2,
        ),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(32),
          ),
          child: SizedBox(
            height: 64,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 0;
                      });
                    },
                    child: Image.asset("images/home.png"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 1;
                      });
                    },
                    child: Image.asset("images/search.png"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 2;
                      });
                    },
                    child: Image.asset("images/checkbox.png"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 3;
                      });
                    },
                    child: Image.asset("images/notification.png"),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    onTap: () {
                      setState(() {
                        selectedPageIndex = 4;
                      });
                    },
                    child: Image.asset("images/profile1.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
