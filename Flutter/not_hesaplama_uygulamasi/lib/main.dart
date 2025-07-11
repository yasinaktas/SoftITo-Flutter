import 'package:flutter/material.dart';
import 'package:not_hesaplama_uygulamasi/constants/sabitler.dart';
import 'package:not_hesaplama_uygulamasi/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ortalama Hesaplama",
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}
