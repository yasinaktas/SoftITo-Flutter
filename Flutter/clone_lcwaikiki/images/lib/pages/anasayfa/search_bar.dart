import 'package:flutter/material.dart';

class AnasayfaSearchBar extends StatelessWidget {
  final double height;
  const AnasayfaSearchBar({super.key, this.height = 44});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 12,
                children: [
                  SizedBox(),
                  Image.asset("images/icons/search.png", width: 16, height: 16),
                  Expanded(
                    child: Text(
                      "Ürün, kategori, marka ara",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Image.asset(
                    "images/icons/microphone.png",
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                  Image.asset(
                    "images/icons/barcode.png",
                    width: 16,
                    height: 16,
                    color: Colors.black,
                  ),
                  Image.asset(
                    "images/icons/camera.png",
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          Container(
            height: height,
            width: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 237, 250),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              "images/icons/profile.png",
              width: 24,
              height: 24,
              color: const Color.fromARGB(255, 0, 65, 163),
            ),
          ),
        ],
      ),
    );
  }
}
