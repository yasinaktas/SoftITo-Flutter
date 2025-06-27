import 'dart:math';

import 'package:ders13/models/yemek.dart';
import 'package:ders13/yemek_detay.dart';
import 'package:flutter/material.dart';

class FutureBuilderOzelListeleme extends StatefulWidget {
  const FutureBuilderOzelListeleme({super.key});

  @override
  State<FutureBuilderOzelListeleme> createState() =>
      _FutureBuilderOzelListelemeState();
}

class _FutureBuilderOzelListelemeState
    extends State<FutureBuilderOzelListeleme> {
  final String mainUrl = "images/";
  Future<List<Yemek>> yemekleriGetir() async {
    List<Yemek> yemekListesi = <Yemek>[
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Karnıyarık",
        yemekResimAdi: "${mainUrl}y1.png",
        yemekFiyat: 275,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Yaprak Sarması",
        yemekResimAdi: "${mainUrl}y2.png",
        yemekFiyat: 320,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Tavuk Sote",
        yemekResimAdi: "${mainUrl}y3.png",
        yemekFiyat: 275,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Izgara Kanat",
        yemekResimAdi: "${mainUrl}y4.png",
        yemekFiyat: 250,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Çerkes Tavuğu",
        yemekResimAdi: "${mainUrl}y5.png",
        yemekFiyat: 480,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Lahana Sarması",
        yemekResimAdi: "${mainUrl}y6.png",
        yemekFiyat: 140,
      ),
      Yemek(
        yemekId: Random().nextInt(999999999),
        yemekAdi: "Karışık Kebap",
        yemekResimAdi: "${mainUrl}y7.png",
        yemekFiyat: 900,
      ),
    ];
    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yemek Uygulaması Future"),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Yemek> yemekler = snapshot.data!;
            return ListView.builder(
              itemCount: yemekler.length,
              itemBuilder: (context, index) {
                Yemek yemek = yemekler[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return YemekDetaySayfasi(yemek: yemek);
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(yemek.yemekResimAdi),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  yemek.yemekAdi,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  yemek.yemekFiyat.toString(),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
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
