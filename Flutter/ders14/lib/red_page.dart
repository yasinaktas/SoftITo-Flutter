import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatefulWidget {
  const RedPage({super.key});

  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Geri butonun işlevini yapıp yapmayacağını belirler
      onPopInvokedWithResult: (didPop, result) {
        debugPrint(didPop.toString());
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Kırmızı Sayfa"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  _rastgeleSayi = Random().nextInt(100);
                  Navigator.of(context).pop(_rastgeleSayi);
                },
                child: Text("Ana Sayfaya Geri Dön"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  if (Navigator.canPop(context)){
                    
                  }
                },
                child: Text("Can Pop"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
