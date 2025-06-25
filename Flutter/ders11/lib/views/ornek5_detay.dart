import 'package:ders11/models/user.dart';
import 'package:flutter/material.dart';

class Ornek5Detay extends StatelessWidget {
  final User user;
  const Ornek5Detay({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Detay Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(user.imageUrl),
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "0${user.tel}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
