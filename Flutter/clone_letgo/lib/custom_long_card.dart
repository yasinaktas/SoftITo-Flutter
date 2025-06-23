import 'package:clone_letgo/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomLongCard extends StatelessWidget {
  final String imageName;
  final String price;
  final String description;
  const CustomLongCard({super.key,required this.imageName,required this.price,required this.description});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.42,
      height: width * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100,width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: width * 0.45,
            height: width * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              image: DecorationImage(image: AssetImage("resimler/$imageName"),fit: BoxFit.cover)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.flash_on,size: 14,),
                            SizedBox(width: 4,),
                            Text("Öne Çıkan",style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      CustomIconButton(iconData: Icons.favorite_outline_rounded, backgroundColor: Colors.white, iconColor: Colors.black)
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 4,),
                          Icon(Icons.verified,color: Colors.lightGreen,size: 20,),
                          SizedBox(width: 8,),
                          Text("Cüzdanım\nGüvende",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: width * 0.20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(price,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                      Expanded(child: Container()),
                      Container(
                        height: 20,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("12 taksit!",style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  SizedBox(height: 4,),
                  Align(alignment: Alignment.centerLeft,child:Text(description,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),)),
                  Expanded(child: Container()),
                  Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_rounded,color: Colors.white,size: 16,),
                        SizedBox(width: 8,),
                        Text("Sepete Ekle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}