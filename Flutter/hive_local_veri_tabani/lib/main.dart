import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_local_veri_tabani/models/ogrenci.dart';

void main() async {
  await Hive.initFlutter("proje");
  //await Hive.openBox<String>("tablo");
  await Hive.openBox("tablo");
  Hive.registerAdapter(OgrenciAdapter());
  Hive.registerAdapter(GozRenkAdapter());
  await Hive.openBox<Ogrenci>("ogrenciler");
  await Hive.openLazyBox<int>("sayilar");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void _ornekTabloMetotlari() async {
    Box box = Hive.box("tablo"); // Kutunun referansı
    await box.clear();
    box.add("SoftIto");
    box.add(1882);
    box.add(true);
    box.add(["yasin", "yakup", "zeynep"]);

    box.put("ad", "yasin");
    box.put("soyad", "aktaş");
    box.put("yaş", 27);
    box.put("askerlik", false);

    for (var key in box.keys) {
      debugPrint(key.toString());
    }
    debugPrint("------------------------");
    for (var value in box.values) {
      debugPrint(value.toString());
    }

    // box.toMap ile map elde edilebilir
    // box.get("yaş"), await box.delete("yaş")
    // box.getAt(3), await box.deleteAt(3)
    // box.length
  }

  void _ogrenciTabloMetotlari() async {
    var ogr1 = Ogrenci(
      id: 0,
      ad: "Yasin",
      soyad: "Aktaş",
      gozRengi: GozRenk.kahverengi,
      yas: 27,
    );
    var ogr2 = Ogrenci(
      id: 1,
      ad: "Zeynep",
      soyad: "Aktaş",
      gozRengi: GozRenk.siyah,
      yas: 20,
    );

    Box box = Hive.box<Ogrenci>("ogrenciler");
    await box.clear();
    box.add(ogr1);
    box.add(ogr2);

    debugPrint(box.toMap().toString());
  }

  void _lazyAndEncryptedBox() async {
    var boxNumbers = Hive.lazyBox<int>("sayilar");
    for (int i = 0; i < 20; i++) {
      await boxNumbers.add(i * 50);
    }
    for (int i = 0; i < 20; i++) {
      debugPrint((await boxNumbers.getAt(i)).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //_ornekTabloMetotlari();
            //_ogrenciTabloMetotlari();
            _lazyAndEncryptedBox();
          },
          child: Icon(Icons.add),
        ),
        body: Center(child: Text("Hello")),
      ),
    );
  }
}
