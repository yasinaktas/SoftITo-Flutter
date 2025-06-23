import 'package:flutter/material.dart';

class DrowDownButtonKullanimi extends StatefulWidget {
  const DrowDownButtonKullanimi({super.key});

  @override
  State<DrowDownButtonKullanimi> createState() =>
      _DrowDownButtonKullanimiState();
}

class _DrowDownButtonKullanimiState extends State<DrowDownButtonKullanimi> {
  Color appBarBgColor = Color(0xff001026);
  late List<String> ulkelerListe;
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListe = [
      "Türkiye",
      "İngiltere",
      "Fransa",
      "Almanya",
      "Hollanda",
      "İspanya",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Button Kullanımı"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: appBarBgColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton(
                underline: Container(),
                value: secilenUlke,
                items: ulkelerListe.map<DropdownMenuItem<String>>((
                  String value,
                ) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      "Ülke: $value",
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  );
                }).toList(),
                onChanged: (String? gelenUlke) {
                  setState(() {
                    secilenUlke = gelenUlke!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
