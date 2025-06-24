import 'package:flutter/material.dart';

class CardAndListTileKullanimi extends StatefulWidget {
  const CardAndListTileKullanimi({super.key});

  @override
  State<CardAndListTileKullanimi> createState() =>
      _CardAndListTileKullanimiState();
}

class _CardAndListTileKullanimiState extends State<CardAndListTileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Kullanımı"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.wb_sunny),
                title: Text("Güneş"),
                subtitle: Text("Güneş alt başlık"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardOrnek extends StatelessWidget {
  const CardOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Card(
              color: Colors.deepPurpleAccent,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                side: BorderSide(color: Colors.pinkAccent, width: 1),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Toplam Puan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 36,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "150",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
