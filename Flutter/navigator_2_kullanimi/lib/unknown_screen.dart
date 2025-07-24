import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text("404 Not Found")),
        body: const Center(
          child: Text(
            "This page does not exist.",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
