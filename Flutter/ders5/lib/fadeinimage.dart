import 'package:flutter/material.dart';

class FadeInImageKullanimi extends StatefulWidget {
  const FadeInImageKullanimi({super.key});

  @override
  State<FadeInImageKullanimi> createState() => _FadeInImageKullanimiState();
}

class _FadeInImageKullanimiState extends State<FadeInImageKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeIn Image Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
    );
  }
}
