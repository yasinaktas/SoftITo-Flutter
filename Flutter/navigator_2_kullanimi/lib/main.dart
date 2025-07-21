import 'package:flutter/material.dart';
import 'package:navigator_2_kullanimi/models/dessert.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Dessert? selectedDessert;
  List<Dessert> desserts = [
    Dessert(
      name: "Cupcake",
      description: "A delicios cupcake",
      imageUrl:
          "https://iasbh.tmgrup.com.tr/a9d88e/1200/627/0/166/1151/768?u=https://isbh.tmgrup.com.tr/sbh/2020/02/28/nefis-lezzetiyle-cupcake-tarifi-cupcake-nasil-yapilir-1582890516954.jpg",
    ),
    Dessert(
      name: "Donut",
      description: "A delicios donut",
      imageUrl:
          "https://cdn.britannica.com/38/230838-050-D0173E79/doughnuts-donuts.jpg",
    ),
    Dessert(
      name: "Eclair",
      description: "A delicios eclair",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGFuZNBN4GaG8-AjTLX014jmjto3mCaOXpqA&s",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Candy Shop",
      home: Navigator(
        pages: const [
          MaterialPage(
            key: ValueKey("DessertsPage"),
            child: Scaffold(
              body: Center(child: Text("Welcome to the Candy Shop!")),
            ),
          ),
        ],
        onDidRemovePage: (page) {},
      ),
    );
  }
}
