import 'package:flutter/material.dart';

void main() {
  runApp(MyProject());
}

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyExamples(),
    );
  }
}

class MyExamples extends StatelessWidget {
  const MyExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Çalışma 3"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),
      ),
      body: Example11(),
    );
  }
}


// Widget istiyorsa Image.asset, Image.network
// Provider istiyorsa AsssetImage, NetworkImage
class Example11 extends StatelessWidget {
  const Example11({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CircleAvatar(
              radius: 66,
              child: Text("B",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/strange.png"),
            ),
          )
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String str;
  final Color color;
  final double size;
  final bool isBold;
  CustomText({
    this.color = Colors.black,
    this.isBold = false,
    required this.str,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(str,style: TextStyle(fontSize: size,color: color,fontWeight: isBold ? FontWeight.bold : FontWeight.normal),);
  }
}

class Example7 extends StatelessWidget {
  const Example7
({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: Image.network("https://www.dadaset.com/wp-content/uploads/2016/01/dadas-slide-4.jpg"),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange
                ),
                child: CustomText(str: "Beğen", size: 16,isBold: true,),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red
                ),
                child: CustomText(str: "Yorum Yap", size: 16,isBold: true,),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: CustomText(str: "Köfte", size: 20,color: Colors.red,isBold: true,)
              ),
              SizedBox(height: 2,),
              Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: CustomText(str: "Izgara üzerinde pişirime uygun", size: 16),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: CustomText(str: "8 Ağustos", size: 16),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerLeft,
                child: CustomText(str: "Köfte harcını hazırlamak için, soğanları rendeleyin ve maydanozları ince ince kıyın. İsterseniz, bir diş sarımsak da ekleyebilirsiniz. Soğan, maydanoz, kıyma, yumurta, zeytinyağı ve tuzu bir kaba alıp iyice yoğurun.", size: 16,)
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Example6 extends StatelessWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(48),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/1024px-Instagram_logo_2016.svg.png")
                ),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300,width: 1),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text("Kullanıcı adı",style: TextStyle(color: Colors.grey.shade400),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300,width: 1),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text("Şifre",style: TextStyle(color: Colors.grey.shade400),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          border: Border.all(color: Colors.grey.shade300,width: 1),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Text("Giriş Yap",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Şifreni mi unutttun?",style: TextStyle(color: Colors.black87),)
              ],
            ),
          ),
          Divider(height: 0,),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hesabın yok mu?"),
                SizedBox(width: 4,),
                Text("Kaydol",style: TextStyle(color: Colors.blue),)
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade400)),
              borderRadius: BorderRadius.circular(0)
            ),
          ),
          Expanded(child: Container()),
          Text("Uygulamayı indir.",style: TextStyle(fontSize: 16),),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRsP-EH-Fc-gjQMFgxj4g1pkFGVCK8Y2deHA&s"),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        Text("App Store'dan",style: TextStyle(fontSize: 16,color: Colors.white),),
                        Text("İndirin",style: TextStyle(fontSize: 12,color: Colors.white),),
                        Expanded(child: Container()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 16,),
              Container(
                height: 56,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      child: Image.network("https://cdn.freebiesupply.com/logos/large/2x/google-play-store-logo-png-transparent.png"),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        Text("Google Play",style: TextStyle(fontSize: 16,color: Colors.white),),
                        Text("'DEN ALIN",style: TextStyle(fontSize: 12,color: Colors.white),),
                        Expanded(child: Container()),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class Example5 extends StatelessWidget {
  const Example5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 135,
              width: 240,
              color: Colors.grey.shade100,
              child: Image.network("https://images2.alphacoders.com/901/901544.png",),
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Container(
              height: 135,
              width: 240,
              color: Colors.grey.shade100,
              child: Image.network("https://img1.wallspic.com/crops/8/8/8/0/7/170888/170888-anime-house-window-plant-building-3840x2160.jpg",),
            )
          ],
        )
      ],
    );
  }
}

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> myImages = [
      "hulk.jpg",
      "ironman.jpg",
      "orumcek.jpeg",
      "strange.png"
    ];
    final imageFolder = "images/";
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 200,
                child: Image.asset(imageFolder + myImages[0]),
              ))
            ],
          ),
          Divider(color: Colors.red,),
          Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 200,
                child: Image.asset(imageFolder + myImages[1]),
              ))
            ],
          ),
          Divider(color: Colors.red,),
          Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 200,
                child: Image.asset(imageFolder + myImages[2]),
              ))
            ],
          ),
          Divider(color: Colors.red,),
          Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 200,
                child: Image.asset(imageFolder + myImages[3]),
              ))
            ],
          ),
          Divider(color: Colors.red,)
        ],
      ),
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: const Text("Örnek 1"),
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                height: 180,
                child: const Text("Ben %30"),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                color: Colors.teal,
                height: 180,
                child: const Text("Ben %70"),
              ),
            )
          ],
        ),
        Divider(color: Colors.red,thickness: 4),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                height: 200,
                color: Colors.purple,
                child: const Text("Ben %20"),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                height: 200,
                color: Colors.redAccent,
                child: const Text("Ben %30"),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                height: 200,
                color: Colors.yellow,
                child: const Text("Ben %50"),
              ),
            )
          ],
        )
      ],
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 30),
          child: Align(child: Text("Telefon Listesi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.red),)),
        ),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
              child: Column(
                children: [
                  MyCard(name: "Yasin Aktaş",firstIcon: Icons.person,secondIcon: Icons.arrow_right_outlined,),
                  MyCard(name: "Yakup Aktaş",firstIcon: Icons.person_3,secondIcon: Icons.abc,),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String name;
  final IconData firstIcon;
  final IconData secondIcon;
  const MyCard({
    required this.name,
    required this.firstIcon,
    required this.secondIcon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blueGrey,width: 2),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade800,offset: Offset(4, 4),blurRadius: 4)
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(firstIcon,color: Colors.blueAccent,size: 56,),
                  ),
                  Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                  Icon(secondIcon,color: Colors.brown,size: 48,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


