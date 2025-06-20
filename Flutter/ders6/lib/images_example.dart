import 'dart:math';

import 'package:flutter/material.dart';

class ImagesExample extends StatefulWidget {
  const ImagesExample({super.key});

  @override
  State<ImagesExample> createState() => _ImagesExampleState();
}

class _ImagesExampleState extends State<ImagesExample> {
  int index = 1;
  List<String> imageNames = [
    "p1.png",
    "p2.png",
    "p3.png",
    "p4.png",
    "p5.png",
    "p6.png",
    "p7.png",
    "p8.png",
    "p9.png",
    "p10.png",
  ];
  Random r = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images Example"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            //Image.asset("resimler/p$index.png"),
            Image.asset("resimler/${imageNames[index]}"),
            Text("Resim Adı: ${imageNames[index]}"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  //index = r.nextInt(10) + 1;
                  index = r.nextInt(10);
                });
              },
              child: Text("Resmi Değiştir"),
            ),
          ],
        ),
      ),
    );
  }
}
