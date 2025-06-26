import 'package:ders12/detay_sayfasi.dart';
import 'package:flutter/material.dart';

class GridViewKullanimi extends StatelessWidget {
  const GridViewKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GridView Kullanımı"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Ornek2(),
    );
  }
}

class Ornek1 extends StatefulWidget {
  const Ornek1({super.key});

  @override
  State<Ornek1> createState() => _Ornek1State();
}

class _Ornek1State extends State<Ornek1> {
  List<String> yemekler = [
    "Yaprak Sarma",
    "Karnıyarık",
    "Izgara Kanat",
    "Çerkes Tavuğu",
    "Velibah",
    "Kabin",
    "Pasta Jıps",
    "Cağ Kebabı",
    "Mantı",
    "Madımak",
    "Hingel",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: yemekler.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1,
      ),
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(yemekler[index])],
        ),
      ),
    );
  }
}

class Ornek2 extends StatefulWidget {
  const Ornek2({super.key});

  @override
  State<Ornek2> createState() => _Ornek2State();
}

class _Ornek2State extends State<Ornek2> {
  /*Map<String, String> yemekler = {
    "Büryan": "buryan.png",
    "Izgara Köfte": "izgarakofte.png",
    "İskender": "iskender.png",
    "Karışık Kebap": "karisikkebap.png",
    "Kokoreç": "kokorec.png",
    "Kuzu Şiş": "kuzusis.png",
    "Lahmacun": "lahmacun.png",
    "Mumbar": "mumbar.png",
    "Pide": "pide.png",
    "Sarma Ciğer": "sarmaciğer.png",
    "Tantuni": "tantuni.png",
  };*/
  List<String> yemekler = [
    "Büryan",
    "Izgara Köfte",
    "İskender",
    "Karışık Kebap",
    "Kokoreç",
    "Kuzu Şiş",
    "Lahmacun",
    "Mumbar",
    "Pide",
    "Sarma Ciğer",
    "Tantuni",
  ];
  List<String> images = [
    "buryan.png",
    "y13.png",
    "y14.png",
    "y15.png",
    "y16.png",
    "y17.png",
    "y18.png",
    "y19.png",
    "y20.png",
    "y21.png",
    "y22.png",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: yemekler.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DetaySayfasi(
                    yemek: yemekler[index],
                    imagePath: "images/${images[index]}",
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                    blurRadius: 4,
                    color: Colors.grey.shade500,
                  ),
                ],
                image: DecorationImage(
                  opacity: 0.35,
                  image: AssetImage("images/${images[index]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                yemekler[index],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
