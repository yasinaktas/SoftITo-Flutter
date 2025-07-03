import 'package:clone_pizza_app/verification_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagesList = ["pizza.jpg", "y1.png", "y2.png", "y3.png"];
  int selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Spacer(),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset("images/${imagesList[selectedImageIndex]}"),
          ),
          SizedBox(height: 24),
          Text(
            "Welcome to Ovenly",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Your favorite pizzas, freshly baked and delivered to your doorstep with love and care!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              for (int i = 0; i < imagesList.length; i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedImageIndex = i;
                    });
                  },
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedImageIndex == i
                          ? Color(0xffB55638)
                          : Color(0xffD9D9D9),
                    ),
                  ),
                ),
            ],
          ),
          Spacer(),
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
                          builder: (context) => VerificationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Log in",
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
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF8F8F8),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Sign me up",
                      style: TextStyle(
                        color: Color(0xffB55638),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
