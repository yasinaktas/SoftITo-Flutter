import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200
      ),
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400,width: 1),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
        ),
        child: Row(
          children: [
            SizedBox(width: 12,),
            Icon(Icons.search,color: Colors.pinkAccent,size: 20,),
            SizedBox(width: 8,),
            Text("Araba, telefon, bisiklet ve daha fazlası...",style: TextStyle(color: Colors.black54,fontSize: 11,fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}