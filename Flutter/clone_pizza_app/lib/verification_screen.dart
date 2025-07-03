import 'package:clone_pizza_app/verify_number_screen.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Ovenly",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "We’ll send you a verification code to get started",
              style: TextStyle(
                color: Color(0xff868686),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Phone number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              spacing: 20,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Color(0xffF8F8F8)),
                  child: Row(
                    spacing: 8,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox(
                          height: 18,
                          child: Image.asset("images/country.png"),
                        ),
                      ),
                      Text(
                        "+65",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "9876XXXXX",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff868686),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB55638),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyNumberScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              spacing: 4,
              children: [
                Text(
                  "You agree to our",
                  style: TextStyle(
                    color: Color(0xff868686),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    color: Color(0xffB55638),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "&",
                  style: TextStyle(
                    color: Color(0xff868686),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Privacy Policy.",
                  style: TextStyle(
                    color: Color(0xffB55638),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
