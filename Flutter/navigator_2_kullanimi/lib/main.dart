import 'package:flutter/material.dart';
import 'package:navigator_2_kullanimi/dessert_details_screen.dart';
import 'package:navigator_2_kullanimi/dessert_list_screen.dart';
import 'package:navigator_2_kullanimi/models/dessert.dart';
import 'package:navigator_2_kullanimi/unknown_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Dessert? _selectedDessert;
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
          "https://i.lezzet.com.tr/images-xxlarge-secondary/donut-nasil-ortaya-cikti-2ad6254e-92d9-4169-8463-25e2c41a140a",
    ),
    Dessert(
      name: "Eclair",
      description: "A delicios eclair",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGFuZNBN4GaG8-AjTLX014jmjto3mCaOXpqA&s",
    ),
  ];
  bool show404 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Candy Shop",
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey("DessertsPage"),
            child: DessertListScreen(
              desserts: desserts,
              onTapped: _handleDessertTapped,
            ),
          ),
          if (_selectedDessert != null)
            MaterialPage(
              key: ValueKey(_selectedDessert),
              child: DessertDetailsScreen(dessert: _selectedDessert!),
            ),
          if (show404)
            const MaterialPage(
              key: ValueKey("UnknownPage"),
              child: UnknownScreen(),
            ),
        ],
        onDidRemovePage: (page) {},
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            _selectedDessert = null;
            show404 = false;
          });
          return true;
        },
      ),
    );
  }

  void _handleDessertTapped(Dessert dessert) {
    setState(() {
      _selectedDessert = dessert;
    });
  }
}
