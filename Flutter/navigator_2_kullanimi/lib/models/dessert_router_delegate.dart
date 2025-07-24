import 'package:flutter/material.dart';
import 'package:navigator_2_kullanimi/models/dessert.dart';
import 'package:navigator_2_kullanimi/models/dessert_route_path.dart';

class DessertRouterDelegate extends RouterDelegate<DessertRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<DessertRoutePath> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey;

  @override
  Future<void> setNewRoutePath(DessertRoutePath configuration) {
    throw UnimplementedError();
  }

  Dessert? _selectedDessert;
  List<Dessert> desserts = [
    Dessert(
      name: "Cupcake",
      description: "A delicious cupcake",
      imageUrl:
          "https://iasbh.tmgrup.com.tr/a9d88e/1200/627/0/166/1151/768?u=https://isbh.tmgrup.com.tr/sbh/2020/02/28/nefis-lezzetiyle-cupcake-tarifi-cupcake-nasil-yapilir-1582890516954.jpg",
    ),
    Dessert(
      name: "Donut",
      description: "A delicious donut",
      imageUrl:
          "https://i.lezzet.com.tr/images-xxlarge-secondary/donut-nasil-ortaya-cikti-2ad6254e-92d9-4169-8463-25e2c41a140a",
    ),
    Dessert(
      name: "Eclair",
      description: "A delicious eclair",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGFuZNBN4GaG8-AjTLX014jmjto3mCaOXpqA&s",
    ),
  ];

  DessertRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  DessertRoutePath get currentConfiguration {
    if (_selectedDessert == null) {
      return DessertRoutePath.home();
    } else {
      return DessertRoutePath.details(_selectedDessert!);
    
}
