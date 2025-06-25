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
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  action: SnackBarAction(
                    label: "Paylaş",
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(yemek.desc),
                          title: Text(yemek.name),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Paylaş"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("İptal"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  content: Text(
                    "${yemek.name} tarifi kişileriniz ile paylaşılacak...",
                  ),
                ),
              );
            },
            icon: Icon(Icons.ios_share),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
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
