import 'dart:math';

import 'package:flutter/material.dart';

class Ornek3 extends StatelessWidget {
  const Ornek3({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "Sevil Aydın",
      "Berke Özdemir",
      "Zehra Gümüşbıçak",
      "Aycan Mutlu",
      "Serpil Ulus",
      "Aydan Özdemir",
      "Zeynep Akmar",
      "Lütfü Sarı",
      "Ece Ulus",
      "Can Apaydın",
    ];
    List<String> images = [
      "1.png",
      "2.png",
      "3.png",
      "4.png",
      "5.png",
      "6.png",
      "7.png",
      "8.png",
      "9.png",
      "10.png",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Resim ve Yazı Örnek"),
        centerTitle: true,
        backgroundColor: Colors.limeAccent,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (ctx, i) {
          return KisiCard(name: names[i], image: images[i]);
        },
      ),
    );
  }
}

class KisiCard extends StatefulWidget {
  final String name;
  final String image;
  const KisiCard({super.key, required this.name, required this.image});

  @override
  State<KisiCard> createState() => _KisiCardState();
}

class _KisiCardState extends State<KisiCard> {
  int a = Random().nextInt(256);
  int r = Random().nextInt(256);
  int g = Random().nextInt(256);
  int b = Random().nextInt(256);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(a, r, g, b),
      child: SizedBox(
        height: 75,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("resimler/${widget.image}"),
            radius: 25,
          ),
          title: Text(widget.name),
          subtitle: Text("05${100000000 + Random().nextInt(99999999)}"),
          trailing: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
