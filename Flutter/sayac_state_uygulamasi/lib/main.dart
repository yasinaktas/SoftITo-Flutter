import 'package:flutter/material.dart';
import 'package:sayac_state_uygulamasi/sayac_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HostPage());
  }
}

class HostPage extends StatelessWidget {
  HostPage({super.key});
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("Build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç Uygulaması"),
        centerTitle: true,
        foregroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma miktarı"),
            SayacWidget(key: sayacWidgetKey),
          ],
        ),
      ),
    );
  }
}
