import 'package:ders13/sayfa1.dart';
import 'package:ders13/sayfa2.dart';
import 'package:ders13/sayfa3.dart';
import 'package:flutter/material.dart';

class DrawerKullanimi extends StatefulWidget {
  const DrawerKullanimi({super.key});

  @override
  State<DrawerKullanimi> createState() => _DrawerKullanimiState();
}

class _DrawerKullanimiState extends State<DrawerKullanimi> {
  int selectedIndex = 0;
  List<Widget> pages = [Sayfa1(), Sayfa2(), Sayfa3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("images/y1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("Başlık", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                  Navigator.pop(context);
                });
              },
              title: Text("Sayfa1"),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Divider(),
            ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                  Navigator.pop(context);
                });
              },
              title: Text("Sayfa2"),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Divider(),
            ListTile(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                  Navigator.pop(context);
                });
              },
              title: Text("Sayfa3"),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              title: Text("Çıkış yap"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
