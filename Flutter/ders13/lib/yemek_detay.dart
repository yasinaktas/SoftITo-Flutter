import 'package:ders13/models/yemek.dart';
import 'package:flutter/material.dart';

class YemekDetaySayfasi extends StatefulWidget {
  final Yemek yemek;
  const YemekDetaySayfasi({super.key, required this.yemek});

  @override
  State<YemekDetaySayfasi> createState() => _YemekDetaySayfasiState();
}

class _YemekDetaySayfasiState extends State<YemekDetaySayfasi> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.yemek.yemekAdi),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            SizedBox(
              width: 340,
              height: 200,
              child: Image.asset(widget.yemek.yemekResimAdi),
            ),
            Text(
              widget.yemek.yemekAdi,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.yemek.yemekFiyat.toInt()} ₺",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isDone = !isDone;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDone ? Colors.green : Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(isDone ? "Sipariş alındı" : "Sipariş ver"),
            ),
          ],
        ),
      ),
    );
  }
}
