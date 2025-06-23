import 'package:clone_letgo/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 12,),
          Text("letgo",style: GoogleFonts.lobster(
            color: Colors.pinkAccent,
            fontSize: 24
          ),),
          Expanded(child: Container()),
          Container(
            height: 32,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade400,width: 1)
            ),
            child: Row(
              spacing: 8,
              children: [
                Icon(Icons.place,size: 16,color: Colors.pinkAccent,),
                Text("İstanbul, Bağcılar",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 12),),
                Icon(Icons.keyboard_arrow_down,size: 16,color: Colors.pinkAccent,)
              ],
            ),
          ),
          SizedBox(width: 16,),
          CustomIconButton(iconData: Icons.shopping_cart,backgroundColor: Colors.grey.shade100,iconColor: Colors.black,),
          SizedBox(width: 16,),
          CustomIconButton(iconData: Icons.notifications_rounded,backgroundColor: Colors.grey.shade100,iconColor: Colors.black,),
          SizedBox(width: 12,)
        ],
      ),
    );
  }
}