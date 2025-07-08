import 'package:flutter/material.dart';

class RedPage extends StatefulWidget {
  const RedPage({super.key});
  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  late String name;

  @override
  void initState() {
    super.initState();
    name = "Yasin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Red Page"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            Text("Red Page", style: Theme.of(context).textTheme.headlineLarge),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/yellowPage");
              },
              child: Text("Sarı Sayfaya Git"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/greenPage", arguments: name);
              },
              child: Text("Yeşil Sayfaya Git"),
            ),
          ],
        ),
      ),
    );
  }
}
