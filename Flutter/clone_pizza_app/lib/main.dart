import 'package:clone_pizza_app/home_screen.dart';
import 'package:clone_pizza_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  List<String> languages = [
    "English",
    "Turkish",
    "German",
    "Spanish",
    "French",
    "Arabic",
  ];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          spacing: 8,
          children: [
            SizedBox(width: 4),
            SizedBox(width: 20, child: Image.asset("images/logo.png")),
            Text(
              "Ovenly",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
              underline: Container(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff868686),
                size: 32,
              ),
              borderRadius: BorderRadius.circular(12),
              value: selectedLanguage,
              items: languages
                  .map<DropdownMenuItem>(
                    (languageStr) => DropdownMenuItem(
                      value: languageStr,
                      child: Text(
                        languageStr,
                        style: TextStyle(color: Color(0xff868686)),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (language) {
                setState(() {
                  selectedLanguage = language;
                });
              },
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: HomeScreen(),
    );
  }
}
