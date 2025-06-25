import 'package:flutter/material.dart';
import 'package:yemekler/models/yemek.dart';

class DetailPage extends StatelessWidget {
  final Yemek yemek;
  const DetailPage({super.key, required this.yemek});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(yemek.name),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        spacing: 20,
        children: [
          Row(children: [Expanded(child: Image.asset(yemek.imageUrl))]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  yemek.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Fiyat: ${yemek.price}₺",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(padding: const EdgeInsets.all(16.0), child: Text(yemek.desc)),
        ],
      ),
    );
  }
}
