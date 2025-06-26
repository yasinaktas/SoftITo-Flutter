import 'package:flutter/material.dart';

class YatayListView extends StatefulWidget {
  const YatayListView({super.key});

  @override
  State<YatayListView> createState() => _YatayListViewState();
}

class _YatayListViewState extends State<YatayListView> {
  List<String> ilceler = [
    "Bağcılar",
    "Bahçelievler",
    "Bakırköy",
    "Pendik",
    "Kadıköy",
    "Üsküdar",
    "Maltepe",
    "Esenler",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yatay ListView"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ilceler.length,
          itemBuilder: (context, index) {
            return Card(
              child: SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(ilceler[index])],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
