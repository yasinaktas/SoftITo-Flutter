import 'package:ders10/views/ulke_card.dart';
import 'package:flutter/material.dart';

class DinamikListViewKullanimi extends StatefulWidget {
  const DinamikListViewKullanimi({super.key});

  @override
  State<DinamikListViewKullanimi> createState() =>
      _DinamikListViewKullanimiState();
}

class _DinamikListViewKullanimiState extends State<DinamikListViewKullanimi> {
  List<String> ulkeler = [
    "Türkiye",
    "Mısır",
    "Filistin",
    "Azerbaycan",
    "Singapur",
    "Arnavutluk",
    "Katar",
    "Almanya",
    "Fransa",
    "İtalya",
    "İspanya",
  ];
  List<String> uzunListe = [];
  String myTitle = "Dinamik List";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.builder(
          itemCount: ulkeler.length,
          itemBuilder: (context, index) {
            return UlkeCard(index: index, ulke: ulkeler[index]);
          },
        ),
      ),
    );
  }
}

class BasicListTileListView extends StatelessWidget {
  const BasicListTileListView({super.key, required this.ulkeler});

  final List<String> ulkeler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: ulkeler.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(ulkeler[index]),
                subtitle: Text("${index + 1}. ülke"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BasicCardListView extends StatelessWidget {
  const BasicCardListView({super.key, required this.ulkeler});

  final List<String> ulkeler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: ulkeler.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.flag),
                    Text(ulkeler[index]),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
