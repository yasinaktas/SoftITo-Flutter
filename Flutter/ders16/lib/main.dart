import 'package:ders16/widgets/expansion_tile_page.dart';
import 'package:ders16/widgets/liste_ornek.dart';
import 'package:ders16/widgets/pageview_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyProject());
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  List<Widget> sayfalar = [ListeOrnek(), ExpansionTilePage(), PageviewPage()];
  int bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tasarım Araçları"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
      ),
      body: sayfalar[bottomIndex],
    );
  }
}
