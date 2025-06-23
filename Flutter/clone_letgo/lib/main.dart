import 'package:clone_letgo/custom_app_bar.dart';
import 'package:clone_letgo/custom_horizontal_category_item.dart';
import 'package:clone_letgo/custom_icon_button.dart';
import 'package:clone_letgo/custom_long_card.dart';
import 'package:clone_letgo/custom_search_bar.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.white,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.home_filled,color: Colors.pinkAccent,),
                Text("Ana Sayfa",style: TextStyle(fontSize: 12,color: Colors.pinkAccent),)
              ],
            ),
            Column(
              children: [
                Icon(Icons.chat_rounded),
                Text("Sohbet",style: TextStyle(fontSize: 12),)
              ],
            ),
            Column(
              children: [
                Icon(Icons.camera_alt),
                Text("Sat",style: TextStyle(fontSize: 12),)
              ],
            ),
            Column(
              children: [
                Icon(Icons.apps_rounded),
                Text("İlanlarım",style: TextStyle(fontSize: 12),)
              ],
            ),
            Column(
              children: [
                Icon(Icons.person_pin),
                Text("Hesap",style: TextStyle(fontSize: 12),)
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CustomAppBar(),
          CustomSearchBar(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.local_taxi_rounded, backgroundColor: Colors.blue, iconColor: Colors.white),name: "Araba",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.smartphone, backgroundColor: Colors.deepPurpleAccent, iconColor: Colors.white),name: "Telefon",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.laptop, backgroundColor: Colors.teal, iconColor: Colors.white),name: "Elektronik",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.chair, backgroundColor: Colors.orangeAccent, iconColor: Colors.white),name: "Ev & Yaşam",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.motorcycle, backgroundColor: Colors.deepOrangeAccent, iconColor: Colors.white),name: "Motosiklet",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.checkroom, backgroundColor: Colors.pinkAccent, iconColor: Colors.white),name: "Giyim & Aksesuar",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.spa, backgroundColor: Colors.purple, iconColor: Colors.white),name: "Kişisel Bakım & Kozmatik",),
                CategoryItem(customIconButton: CustomIconButton(iconData: Icons.bedroom_baby, backgroundColor: Colors.lightBlue, iconColor: Colors.white),name: "Anne & Bebek & Oyuncak",),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network("https://static.semrush.com/blog/uploads/media/f3/54/f3546348629b2d5575bf7999ad728997/15c11316a53703ff88f8a1a5ce491908/jnhQgQkpMA--ZspcpR-V048UJ6XALdr6blbJOy9KZnHQLZl631NMOp5W9_wKOwkXI2y-lbs15l0I0wzwjSKEs5pzGCFMCbqpxmgKFYtHHyQhxH-zF39ZbKhP-X0ZeTEX83Y0xj0U6KTd0zKdPlLlACYmnsdfsoTETs8D54ANe59vjPjW5UVrB7H-arfUzg.jpeg",fit: BoxFit.cover,)
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SizedBox(width: 16,),
                    Text("Sepete Ekle, Güvenle Kapına Gelsin!",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87,fontSize: 13,letterSpacing: 0),),
                    Expanded(child: Container()),
                    Container(
                      height: 24,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text("Tümünü Gör",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                    ),
                    SizedBox(width: 16,),
                  ],
                ),
                SizedBox(height: 12,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: [
                      SizedBox(width: 8,),
                      CustomLongCard(imageName: "esya1.jpg",price: "20000 TL",description: "OTURMA ODASI",),
                      CustomLongCard(imageName: "esya2.webp",price: "25000 TL",description: "ÇALIŞMA ODASI",),
                      CustomLongCard(imageName: "esya3.jpeg",price: "10000 TL",description: "MİSAFİR ODASI",),
                      CustomLongCard(imageName: "esya1.jpg",price: "20000 TL",description: "OTURMA ODASI",)
                    ],
                  ),
                ),
                SizedBox(height: 12,),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

