import 'package:ders13/sayfa1.dart';
import 'package:ders13/sayfa2.dart';
import 'package:ders13/sayfa3.dart';
import 'package:flutter/material.dart';

class TabbarKullanimi extends StatefulWidget {
  const TabbarKullanimi({super.key});

  @override
  State<TabbarKullanimi> createState() => _TabbarKullanimiState();
}

class _TabbarKullanimiState extends State<TabbarKullanimi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(vertical: 2),
              child: TabBar(
                labelColor: Colors.purple,
                unselectedLabelColor: Colors.blue,
                dividerHeight: 0,
                tabs: [
                  Tab(text: "Bir"),
                  Tab(child: Icon(Icons.home)),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.person), Text("Profil")],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [Sayfa1(), Sayfa2(), Sayfa3()]),
      ),
    );
  }
}
