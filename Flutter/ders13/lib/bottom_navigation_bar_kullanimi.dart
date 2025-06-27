import 'package:ders13/sayfa1.dart';
import 'package:ders13/sayfa2.dart';
import 'package:ders13/sayfa3.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarKullanimi extends StatefulWidget {
  const BottomNavigationBarKullanimi({super.key});

  @override
  State<BottomNavigationBarKullanimi> createState() =>
      _BottomNavigationBarKullanimiState();
}

class _BottomNavigationBarKullanimiState
    extends State<BottomNavigationBarKullanimi> {
  int selectedIndex = 0;
  List<Widget> sayfaListesi = [Sayfa1(), Sayfa2(), Sayfa3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.orange,
        backgroundColor: Colors.grey.shade300,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
