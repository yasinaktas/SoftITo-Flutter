import 'package:animations/animasyon_yapilari.dart';
import 'package:animations/diger_sayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AnimasyonYapilari());
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
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
            Hero(tag: "Bilal", child: FlutterLogo(size: 64)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => DigerSayfa()));
              },
              child: Text("Diğer Sayfa"),
            ),
          ],
        ),
      ),
    );
  }
}
