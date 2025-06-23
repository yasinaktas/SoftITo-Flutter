import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  const CustomIconButton({
    super.key, 
    required this.iconData,
    required this.backgroundColor,
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor
      ),
      child: Icon(iconData,size: 18,color: iconColor,),
    );
  }
}