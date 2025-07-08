import 'package:flutter/material.dart';
import 'package:isimlendirilmis_routes/green_page.dart';
import 'package:isimlendirilmis_routes/hata_sayfasi.dart';
import 'package:isimlendirilmis_routes/red_page.dart';
import 'package:isimlendirilmis_routes/yellow_page.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => RedPage());
      case "/yellowPage":
        return MaterialPageRoute(builder: (context) => YellowPage());
      case "/greenPage":
        String name = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => GreenPage(ad: name));
      default:
        return MaterialPageRoute(builder: (context) => HataSayfasi());
    }
  }
}
