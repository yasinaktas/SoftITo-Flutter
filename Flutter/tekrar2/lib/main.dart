import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasarimTekrar(),
    );
  }
}

class TasarimTekrar extends StatefulWidget {
  const TasarimTekrar({super.key});

  @override
  State<TasarimTekrar> createState() => _TasarimTekrarState();
}

class _TasarimTekrarState extends State<TasarimTekrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      onEndDrawerChanged: (isOpened) {
        debugPrint(isOpened.toString());
      },
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 300,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver"),
              background: Image.network(
                "https://cdn.kayiprihtim.com/wp-content/uploads/2025/02/Shrek-5-Ilk-Tanitim-Zendaya.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          sliverListDeneme(),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
                sabitGridViewElemani(rastgeleRenkUret()),
              ]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverList sliverListDeneme() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => dinamikEleman(),
      ),
    );
  }

  Widget dinamikEleman() {
    return Container(height: 75, color: rastgeleRenkUret());
  }

  Color rastgeleRenkUret() {
    Random random = Random();
    double hue = random.nextDouble() * 360;
    double saturation = random.nextDouble();
    double lightness = random.nextDouble() * 0.15 + 0.75;
    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }

  SliverChildListDelegate sliverListDelegate() {
    return SliverChildListDelegate([
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
      Card(child: ListTile(title: Text("Deneme"))),
    ]);
  }

  GridView gridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 250,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      childAspectRatio: 16 / 9,
      children: [
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
        sabitGridViewElemani(Colors.red),
      ],
    );
  }

  Widget sabitGridViewElemani(Color bgColor) {
    return Container(color: bgColor, child: Text("Deneme"));
  }

  dinamikGridElemani(int index) {
    return Container(
      height: 75,
      color: Colors.teal[((index % 9) + 1) * 100],
      child: Text("Deneme"),
    );
  }
}

class SabitGridViewEleman extends StatelessWidget {
  final Color renk;
  const SabitGridViewEleman({super.key, required this.renk});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red[100]);
  }
}
