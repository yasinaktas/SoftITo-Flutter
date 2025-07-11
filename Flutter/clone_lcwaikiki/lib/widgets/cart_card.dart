import 'package:flutter/material.dart';

class SepetCard extends StatelessWidget {
  const SepetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          Image.asset(
            "images/urun/urun1_1.webp",
            width: 80,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LC Waikiki",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 4),
              Text(
                "Şort-Erkek",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                "Beden: M / Gri Melanj",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Icon(Icons.delete_outline, size: 14),
                    Text("1"),
                    Icon(Icons.add, size: 14),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.favorite_outline),
              Spacer(),
              Text(
                "399 TL",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
