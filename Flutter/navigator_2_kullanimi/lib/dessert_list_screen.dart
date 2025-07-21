import 'package:flutter/material.dart';
import 'package:navigator_2_kullanimi/models/dessert.dart';

class DessertListScreen extends StatelessWidget {
  final List<Dessert> desserts;
  final ValueChanged<Dessert> onTapped;
  const DessertListScreen({
    super.key,
    required this.desserts,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Desserts"),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          
        );
      }),
    );
  }
}
