import 'package:flutter/material.dart';

class FutureBuilderListeleme extends StatefulWidget {
  const FutureBuilderListeleme({super.key});

  @override
  State<FutureBuilderListeleme> createState() => _FutureBuilderListelemeState();
}

class _FutureBuilderListelemeState extends State<FutureBuilderListeleme> {
  Future<List<String>> verileriGetir() async {
    List<String> ulkeler = [
      "Türkiye",
      "Almanya",
      "Japonya",
      "Güney Kore",
      "Simgapur",
      "Azerbaycan",
    ];
    return ulkeler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder Listeleme"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: verileriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> ulkeListesi = snapshot.data!;
            return ListView.builder(
              itemCount: ulkeListesi.length,
              itemBuilder: (context, index) {
                String ulke = ulkeListesi[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 55,
                      child: Row(children: [Text(ulke)]),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
