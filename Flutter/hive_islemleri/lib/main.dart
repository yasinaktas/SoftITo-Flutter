import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_islemleri/shared_kullanimi.dart';

void main() async {
  await Hive.initFlutter("uygulama");
  await Hive.openBox("test");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyProject());
  }
}

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Depolama İşlemleri"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 0, color: Colors.grey.shade300),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SharedKullanimi()),
                );
              },
              child: Text("Shared Preferences"),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> veriEkle(var value) async {
    // hive'de add ve put ile veri eklenebilir
    // add -> veriyi ekler ve keyi otomatik atar, index ile (list gibi)
    // put -> veriyi eklerken keyi biz veririz (map gibi)
    var box = Hive.box("test");
    await box.clear();
    int result = await box.add(value);
    return result;
  }
}
