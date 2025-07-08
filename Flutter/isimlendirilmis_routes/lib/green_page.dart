import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  final String ad;
  const GreenPage({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Green Page"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              "Green Page",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Benim adım: $ad",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
