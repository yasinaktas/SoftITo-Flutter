import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyInstagramProject());
}

class MyInstagramProject extends StatelessWidget {
  const MyInstagramProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Clone"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: MyStorySection(),
    );
  }
}

class MyStorySection extends StatelessWidget {
  const MyStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
      "https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BsYXlcLzBiN2Y0ZTliLWY1OWMtNDAyNC05ZjA2LWIzZGMxMjg1MGFiNy0xOTIwLTEwODAuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjo4Mjh9fX0=",
      "https://img.freepik.com/free-photo/happy-man-student-with-afro-hairdo-shows-white-teeth-being-good-mood-after-classes_273609-16608.jpg?semt=ais_hybrid&w=740",
      "https://img.freepik.com/fotos-gratis/retrato-de-homem-confiante-de-pele-escura-com-penteado-afro-encaracolado-tem-expressao-facial-calma_273609-8520.jpg?semt=ais_hybrid&w=740",
      "https://www.jamsadr.com/images/neutrals/person-donald-900x1080.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg",
      "https://cdn.nwe.io/files/x/8e/6b/8cb6f42edb3c84975e992f04e195.jpg",
      "https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&iar=0&w=600&hash=833D605FDB6AC3C2D2915F6BF8B4ADA4",
    ];
    List<int> randomNumber = [];
    Random r = Random();
    for (int i = 0; i < imgList.length; i++) {
      randomNumber.add(r.nextInt(imgList.length));
    }
    return Column(
      children: [
        Container(
          height: 100,
          //color: Colors.grey.shade100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Row(
                  children: [
                    for (int index in randomNumber)
                      Story(imgUrl: imgList[index]),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(),
        PostPage(),
      ],
    );
  }
}

class Story extends StatelessWidget {
  const Story({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          opacity: 1.0,
        ),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      color: Colors.green,
                      child: Image.asset("resimler/11.png", fit: BoxFit.cover),
                    ),
                    Container(
                      height: 65,
                      color: Colors.blue,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Icon(Icons.favorite_outline_rounded, size: 36),
                                SizedBox(width: 8),
                                Text(
                                  "55 bin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
