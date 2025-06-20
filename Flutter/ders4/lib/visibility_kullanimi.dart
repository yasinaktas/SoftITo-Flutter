import 'package:flutter/material.dart';

class VisibilityKullanimi extends StatefulWidget {
  const VisibilityKullanimi({super.key});

  @override
  State<VisibilityKullanimi> createState() => _VisibilityKullanimiState();
}

class _VisibilityKullanimiState extends State<VisibilityKullanimi> {
  String buttonText = "Yok Et";
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visibility Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              child: Text(
                "Selam Herkese",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                  if (isVisible) {
                    buttonText = "Yok Et";
                  } else {
                    buttonText = "Göster";
                  }
                });
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
