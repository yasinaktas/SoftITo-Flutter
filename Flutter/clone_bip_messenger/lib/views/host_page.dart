import 'package:clone_bip_messenger/views/calls_page.dart';
import 'package:clone_bip_messenger/views/discover_page.dart';
import 'package:clone_bip_messenger/views/messages_page.dart';
import 'package:clone_bip_messenger/views/more_page.dart';
import 'package:clone_bip_messenger/views/stories_page.dart';
import 'package:flutter/material.dart';

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int selectedPageIndex = 1;
  List<Widget> pages = [
    StoriesPage(),
    MessagesPage(),
    CallsPage(),
    DiscoverPage(),
    MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey.shade600,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedPageIndex,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              spacing: 2,
              children: [
                Icon(Icons.circle_outlined),
                Text(
                  "Durum",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            label: "Durum",
          ),
          BottomNavigationBarItem(
            icon: Column(
              spacing: 2,
              children: [
                Icon(Icons.message_outlined),
                Text(
                  "Mesajlar",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            label: "Mesajlar",
          ),
          BottomNavigationBarItem(
            icon: Column(
              spacing: 2,
              children: [
                Icon(Icons.call_outlined),
                Text(
                  "Aramalar",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            label: "Aramalar",
          ),
          BottomNavigationBarItem(
            icon: Column(
              spacing: 2,
              children: [
                Icon(Icons.explore_outlined),
                Text(
                  "Keşfet",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            label: "Keşfet",
          ),
          BottomNavigationBarItem(
            icon: Column(
              spacing: 2,
              children: [
                Icon(Icons.dehaze),
                Text(
                  "Daha Fazla",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            label: "Daha Fazla",
          ),
        ],
      ),
    );
  }
}
