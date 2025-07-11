import 'package:flutter/material.dart';
import 'package:not_hesaplama_uygulamasi/models/ders.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (oAnkiHarf) => DropdownMenuItem(
            value: _harfiNotaCevir(oAnkiHarf),
            child: Text(oAnkiHarf),
          ),
        )
        .toList();
  }

  static List<double> _tumKrediler() {
    return List.generate(10, (index) => (index + 1));
  }

  static List<DropdownMenuItem<double>> dropDownKrediMenuBilgisi() {
    return _tumKrediler()
        .map(
          (oAnkiHarf) => DropdownMenuItem(
            value: oAnkiHarf,
            child: Text(oAnkiHarf.toInt().toString()),
          ),
        )
        .toList();
  }

  static List<Ders> tumEklenecekDersler = [];

  static dersEkle(Ders ders) {
    tumEklenecekDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var gelenDers in tumEklenecekDersler) {
      toplamNot += gelenDers.harfDegeri * gelenDers.krediDegeri;
      toplamKredi += gelenDers.krediDegeri;
    }

    return toplamNot / toplamKredi;
  }
}
