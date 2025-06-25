import 'package:flutter/material.dart';

class Ornek1 extends StatelessWidget {
  const Ornek1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Örnekleri"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RehberUygulamasi(),
      ),
    );
  }
}

class RehberUygulamasi extends StatefulWidget {
  const RehberUygulamasi({super.key});

  @override
  State<RehberUygulamasi> createState() => _RehberUygulamasiState();
}

class _RehberUygulamasiState extends State<RehberUygulamasi> {
  List<String> kisiler = [
    "Ahmet Yılmaz",
    "Sevil Koca",
    "Berrin Akyürek",
    "İbrahim Tatlıses",
    "Mehmet Gümüş",
    "Selim Kiraz",
    "Sevgi Kara",
    "Süleyman Alptekin",
    "Arif Aknar",
    "Bersu Cangöz",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kisiler.length,
      itemBuilder: (ctx, index) {
        return KisilerCard(kisi: kisiler[index]);
      },
    );
  }
}

class KisilerCard extends StatefulWidget {
  final String kisi;
  const KisilerCard({super.key, required this.kisi});

  @override
  State<KisilerCard> createState() => _KisilerCardState();
}

class _KisilerCardState extends State<KisilerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage("resimler/1.png")),
        title: Text(
          widget.kisi,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          "0545 766 19 50",
          style: TextStyle(fontSize: 14, color: Colors.black45),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
