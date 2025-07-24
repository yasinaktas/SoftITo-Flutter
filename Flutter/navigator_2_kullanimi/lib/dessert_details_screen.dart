import 'package:flutter/material.dart';
import 'package:navigator_2_kullanimi/models/dessert.dart';

class DessertDetailsScreen extends StatelessWidget {
  final Dessert dessert;
  const DessertDetailsScreen({super.key, required this.dessert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page for ${dessert.name}")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(dessert.imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              dessert.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(dessert.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
