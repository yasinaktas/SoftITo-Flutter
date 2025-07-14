import 'package:flutter/material.dart';

class ImageAndTabbarPage extends StatefulWidget {
  const ImageAndTabbarPage({super.key});

  @override
  State<ImageAndTabbarPage> createState() => _ImageAndTabbarPageState();
}

class _ImageAndTabbarPageState extends State<ImageAndTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resimler ve Tabbar"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/id/1011/800/400"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Ürün Başlığı",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                ),
              ),
            ),
            const TabBar(
              isScrollable: false,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: "Açıklama"),
                Tab(text: "Yorumlar"),
                Tab(text: "Detay"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Sayfa1")),
                  Center(child: Text("Sayfa2")),
                  Center(child: Text("Sayfa3")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
