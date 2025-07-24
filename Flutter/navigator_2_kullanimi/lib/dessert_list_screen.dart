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
      appBar: AppBar(title: Text("All Desserts")),
      body: ListView.builder(
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          var des = desserts[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 72,
                height: 72,
                child: Image.network(des.imageUrl, fit: BoxFit.cover),
              ),
            ),
            title: Text(des.name),
            subtitle: Text(des.description),
            onTap: () {
              onTapped(des);
            },
          );
        },
      ),
    );
  }
}
