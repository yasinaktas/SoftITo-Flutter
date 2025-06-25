import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LetgoAppBar extends StatefulWidget {
  const LetgoAppBar({super.key});

  @override
  State<LetgoAppBar> createState() => _LetgoAppBarState();
}

class _LetgoAppBarState extends State<LetgoAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "letgo",
          style: GoogleFonts.lobster(color: Colors.pinkAccent),
        ),
        centerTitle: false,
        actions: [
          SizedBox(
            height: 28,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
              onPressed: () {},
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.place, color: Colors.pinkAccent, size: 16),
                  Text(
                    "İstanbul, Bağcılar",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.pinkAccent,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          CustomIconButton(iconData: Icons.shopping_cart, onClick: () {}),
          CustomIconButton(
            iconData: Icons.notifications_rounded,
            onClick: () {},
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onClick;
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onClick;
      },
      icon: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(iconData, size: 16),
      ),
    );
  }
}
