import 'package:ders13/drawer_kullanimi.dart';
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
      home: DrawerKullanimi(),
    );
  }
}

class FutureBuilderKullanimi extends StatefulWidget {
  const FutureBuilderKullanimi({super.key});

  @override
  State<FutureBuilderKullanimi> createState() => _FutureBuilderKullanimiState();
}

class _FutureBuilderKullanimiState extends State<FutureBuilderKullanimi> {
  Future<int> faktoriyelHesapla(int sayi) async {
    int sonuc = 1;
    for (int i = 1; i <= sayi; i++) {
      sonuc *= i;
    }
    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            FutureBuilder<int>(
              future: faktoriyelHesapla(5),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint("Hata oldu: ${snapshot.error}");
                }
                if (snapshot.hasData) {
                  return Text(
                    "Sonuç: ${snapshot.data}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text("Gösterilecek veri yok!");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
