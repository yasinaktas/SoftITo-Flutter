import 'package:flutter/material.dart';

class SabitListViewKullanimi extends StatefulWidget {
  const SabitListViewKullanimi({super.key});

  @override
  State<SabitListViewKullanimi> createState() => _SabitListViewKullanimiState();
}

class _SabitListViewKullanimiState extends State<SabitListViewKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabit Liste"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: DikeyListViewOrnek(),
    );
  }
}

class DikeyListViewOrnek extends StatelessWidget {
  const DikeyListViewOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text("Başlık"),
          subtitle: Text("Alt Başlık"),
          trailing: Icon(Icons.keyboard_arrow_right),
          tileColor: Colors.amber,
          onTap: () {
            debugPrint("List Tile Tıklandı");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text("Card Tasarımı"),
                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            color: Colors.lightGreen,
            child: Text("Merhaba"),
          ),
        ),
      ],
    );
  }
}
