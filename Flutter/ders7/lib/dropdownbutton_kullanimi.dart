import 'package:flutter/material.dart';

class DropDownButtonKullanimi extends StatefulWidget {
  const DropDownButtonKullanimi({super.key});

  @override
  State<DropDownButtonKullanimi> createState() =>
      _DropDownButtonKullanimiState();
}

class _DropDownButtonKullanimiState extends State<DropDownButtonKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDownButton Kullanımı"),
        centerTitle: true,
        backgroundColor: Color(0xff001026),
        foregroundColor: Colors.white,
      ),
    );
  }
}
