import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewKullanimi extends StatefulWidget {
  const WebviewKullanimi({super.key});

  @override
  State<WebviewKullanimi> createState() => _WebviewKullanimiState();
}

class _WebviewKullanimiState extends State<WebviewKullanimi> {
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
    );
  }
}
