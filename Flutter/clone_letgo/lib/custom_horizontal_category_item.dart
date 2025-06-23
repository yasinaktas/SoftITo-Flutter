import 'package:clone_letgo/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CustomIconButton customIconButton;
  final String name;
  const CategoryItem({
    super.key,
    required this.customIconButton,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
      child: Column(
        children: [
          customIconButton,
          SizedBox(height: 8,),
          Text(name,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: Colors.black54),maxLines: 1,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}