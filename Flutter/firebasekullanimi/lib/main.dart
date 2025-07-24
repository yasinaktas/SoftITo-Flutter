import 'package:flutter/material.dart';

// Bundle adlarını com.name.projectname şeklinde hem android hem ios değiştirilmeli, ilk iş!

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}


// terminal
// dart pub global activate flutterfire_cli