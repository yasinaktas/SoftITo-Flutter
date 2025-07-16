import 'package:flutter/material.dart';

class LocalApiIslemleri extends StatefulWidget {
  const LocalApiIslemleri({super.key});

  @override
  State<LocalApiIslemleri> createState() => _LocalApiIslemleriState();
}

class _LocalApiIslemleriState extends State<LocalApiIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Local API"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
      ),
    );
  }
}
