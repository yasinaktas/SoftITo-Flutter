import 'package:flutter/material.dart';

class PopupMenuKullanimi extends StatefulWidget {
  const PopupMenuKullanimi({super.key});

  @override
  State<PopupMenuKullanimi> createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<PopupMenuKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Menu Kullanımı"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            PopupMenuButton(
              onCanceled: () {
                print("Seçim yapılmadı");
              },
              onSelected: (value) {
                if (value == 1) {
                  print("Silindi");
                }
                if (value == 2) {
                  print("Güncellendi");
                }
              },
              child: Icon(Icons.open_in_new),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 1,
                    child: Text("Sil", style: TextStyle(color: Colors.red)),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.all(10),
                    value: 2,
                    child: Text(
                      "Güncelle",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}
