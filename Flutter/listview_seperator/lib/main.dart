import 'package:flutter/material.dart';
import 'package:listview_seperator/models/ogrenci.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasarimEkrani(),
    );
  }
}

class TasarimEkrani extends StatefulWidget {
  const TasarimEkrani({super.key});

  @override
  State<TasarimEkrani> createState() => _TasarimEkraniState();
}

class _TasarimEkraniState extends State<TasarimEkrani> {
  List<Ogrenci> tumOgrenciler = List.generate(
    5000,
    (index) => Ogrenci(
      id: index + 1,
      ad: "Öğrenci adı: ${index + 1}",
      soyad: "Öğrenci soyadı: ${index + 1}",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green,
        elevation: 2,
        surfaceTintColor: Colors.amber,
        shadowColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        width: 300,
        semanticLabel: "Deneme",
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Text("Deneme"),
            DrawerHeader(
              duration: Duration(seconds: 3),
              child: Container(color: Colors.red),
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(00),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Tasarım Ekranı"),
        actions: [DrawerButton(), DrawerButtonIcon()],
      ),
      body: ListView.separated(
        itemCount: tumOgrenciler.length,
        itemBuilder: (context, index) =>
            VeriAlanSabitEleman(ogrenci: tumOgrenciler[index]),
        separatorBuilder: (context, index) {
          if (index % 4 == 3) {
            return Divider(thickness: 1, color: Colors.black);
          }
          return Container();
        },
      ),
    );
  }
}

class VeriAlanSabitEleman extends StatelessWidget {
  final Ogrenci ogrenci;
  const VeriAlanSabitEleman({super.key, required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: Colors.pink.shade100,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(child: Text(ogrenci.id.toString())),
                  title: Text(ogrenci.ad),
                  subtitle: Text(ogrenci.soyad),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
