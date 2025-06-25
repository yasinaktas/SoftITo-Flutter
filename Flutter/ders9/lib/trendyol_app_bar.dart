import 'package:flutter/material.dart';

class TrendyolAppBar extends StatefulWidget {
  const TrendyolAppBar({super.key});

  @override
  State<TrendyolAppBar> createState() => _TrendyolAppBarState();
}

class _TrendyolAppBarState extends State<TrendyolAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox(
          height: 44,
          child: Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.search, color: Colors.deepOrangeAccent, size: 20),
                  Expanded(
                    child: Text(
                      "Marka, ürün veya kategori ara",
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined, size: 20),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Icon(Icons.mail_outline),
          SizedBox(width: 12),
          Icon(Icons.notifications_outlined),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
