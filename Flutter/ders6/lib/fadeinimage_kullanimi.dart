import 'package:flutter/material.dart';

class FateInImageKullanimi extends StatefulWidget {
  const FateInImageKullanimi({super.key});

  @override
  State<FateInImageKullanimi> createState() => _FateInImageKullanimiState();
}

class _FateInImageKullanimiState extends State<FateInImageKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade In Image Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
              placeholder: "resimler/place.jpg",
              image:
                  "https://cdn.pixabay.com/photo/2024/01/05/11/14/lake-8489336_1280.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
