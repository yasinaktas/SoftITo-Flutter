import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewPage extends StatefulWidget {
  const MyWebViewPage({super.key});

  @override
  State<MyWebViewPage> createState() => _MyWebViewPageState();
}

class _MyWebViewPageState extends State<MyWebViewPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.youtube.com/"));
  }

  @override
  Widget build(BuildContext context) {
    Color backcolor = Color(0xff001026);
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview Kullanımı"),
        backgroundColor: backcolor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}