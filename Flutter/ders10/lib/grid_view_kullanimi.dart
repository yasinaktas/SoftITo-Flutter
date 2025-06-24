import 'package:flutter/material.dart';

class SabitGridViewKullanimi extends StatefulWidget {
  const SabitGridViewKullanimi({super.key});

  @override
  State<SabitGridViewKullanimi> createState() => _SabitGridViewKullanimiState();
}

class _SabitGridViewKullanimiState extends State<SabitGridViewKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabit GridView"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  debugPrint("Güneş Tıklandı");
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [Icon(Icons.wb_sunny_rounded), Text("Güneş")],
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  debugPrint("Ay Tıklandı");
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [Icon(Icons.brightness_2_rounded), Text("Ay")],
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  debugPrint("Yıldız Tıklandı");
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [Icon(Icons.star_rounded), Text("Yıldız")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
