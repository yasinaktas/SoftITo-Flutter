import 'package:flutter/material.dart';

class DigerSayfa extends StatefulWidget {
  const DigerSayfa({super.key});

  @override
  State<DigerSayfa> createState() => _DigerSayfaState();
}

class _DigerSayfaState extends State<DigerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Animasyonlar"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade200),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hero Widget aynı yapıların farklı sayfalara geçişlerinde animasyonlu bir geçiş sağlar
            Hero(tag: "Bilal", child: FlutterLogo(size: 256)),
          ],
        ),
      ),
    );
  }
}
