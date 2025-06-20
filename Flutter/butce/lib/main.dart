import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ButceSayfasi());
  }
}

class ButceSayfasi extends StatefulWidget {
  const ButceSayfasi({super.key});

  @override
  State<ButceSayfasi> createState() => _ButceSayfasiState();
}

class _ButceSayfasiState extends State<ButceSayfasi> {
  final int artis = 100;
  final int azalis = 250;
  int butce = 1000;
  final String name = "Yasin Aktaş";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bütçe Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ad Soyad: $name"),
            Text("Bütçe: $butce"),
            Text("Arttırma: $artis"),
            Text("Azaltma: $azalis"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      butce += artis;
                    });
                  },
                  child: Text("Arttır"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        butce -= azalis;
                      });
                    },
                    child: Text("Azalt"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
