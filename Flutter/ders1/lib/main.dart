import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ornek()
    );
  }
}

class Ornek extends StatelessWidget {
  const Ornek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align Example"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        
        children: [
          MaviKare(),
          SizedBox(height: 25,),
          KirmiziKare(),
          SizedBox(height: 25,),
          MyText("Yasin")
        ],
      )
    );
  }
}

class MaviKare extends StatelessWidget {
  const MaviKare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: 100,
    );
  }
}

class KirmiziKare extends StatelessWidget {
  const KirmiziKare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 120,
      height: 120,
    );
  }
}

class MyText extends StatelessWidget {
  final String str;
  MyText(this.str);

  @override
  Widget build(BuildContext context) {
    return Text(str);
  }
}

  /*

  Expanded Örnek 3
  Row(
        children: [
          Expanded(
            child: Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              width: 250,
              height: 250,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 50,)
        ],
  )

  Expanded Örnek 2
  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.amber,
              height: 120,
              width: 120,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              height: 120,
              width: 120,
            ),
          )
        ],
  )

  Expanded Örnek 1
  Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
          )
        ],
  )



  Padding Örnek
  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 250,
          width: 250,
          color: Colors.purple,
        ),
  )



  Spacer Örnek
  Column(
        children: [
          Container(
            width: 140,
            height: 140,
            color: Colors.black12,
          ),
          Spacer(),
          Container(
            width: 100,
            height: 100,
            color: Colors.brown,
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.black54,
          )
        ],
  )

  SizedBox Örnek 2
  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
            SizedBox(
              height: 200,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.brown,
            )
          ],
        ),
  )

  SizedBox Örnek 1
  Column(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Colors.redAccent,
              ),
              SizedBox(width: 25),
              Container(
                height: 60,
                width: 60,
                color: Colors.blueAccent,
              ),
            ],
          ),
          SizedBox(height: 30,),
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
          )
        ],
  )
  
  Align Örnek 1
  Container(
        width: 160,
        height: 160,
        color: Colors.red,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text("Yazı")
        ),
  ),
  
  Align Örnek 2
  Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 160,
          height: 160,
          color: Colors.red,
          child: Text("Yazı"),
        ),
  ),
  
  
  Align Örnek 4
  Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 320,
          height: 500,
          color: Colors.yellow,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 160,
              height: 160,
              color: Colors.red,
              child: Text("Yazı"),
            ),
          ),
        ),
  ),

  Align Örnek 5
  Container(
        height: 300,
        width: 300,
        color: Colors.deepPurpleAccent,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              color: Colors.yellow.shade400,
              child: Align(child: Text("Yazı 1"),alignment: Alignment.topRight,)
            ),
            Container(
              height: 150,
              width: 300,
              color: Colors.yellow.shade200,
              child: Align(child: Text("Yazı 2"),alignment: Alignment.bottomLeft,)
            ),
          ],
        ),
  )

  Align Örnek 6
  Container(
        height: 300,
        width: 300,
        color: Colors.teal,
        child: Align(
          alignment: Alignment(-0.5, 0.5),
          child: Text("Yazı",style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),)
        ),
  )








  
  
  Scaffold Ders1Son() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Nested Column Row"),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade400,
                child: Text("Container Yan 1"),
                alignment: Alignment.center,
              ),
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade300,
                child: Text("Container Yan 2"),
                alignment: Alignment.center,
              ),
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade200,
                child: Text("Container Yan 3"),
                alignment: Alignment.center,
              )
            ],
          ),
          Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade500,
                child: Text("Container Orta 1"),
                alignment: Alignment.center,
          ),
          Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade600,
                child: Text("Container Orta 2"),
                alignment: Alignment.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade100,
                child: Text("Container Merdiven 1",textAlign: TextAlign.center),
                alignment: Alignment.center,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade200,
                child: Text("Container Merdiven 2",textAlign: TextAlign.center),
                alignment: Alignment.center,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 130,
                height: 130,
                color: Colors.orange.shade300,
                child: Text("Container Merdiven 3",textAlign: TextAlign.center),
                alignment: Alignment.center,
              )
            ],
          )
        ],
      ),
    );
  }

  Scaffold NetworkImageExample() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Example"),
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: 450,
          height: 450,
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: Text("yasin"),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: NetworkImage("https://www.bigcattr.com/idea/ft/16/myassets/blogs/blog-33.jpeg?revision=1736030732")
                    ,fit: BoxFit.cover
                  )
                ),
              ),
            ],
          ),
        ),
      );
  }

  Stack StackExample() {
    return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 350,
            height: 350,
            color: Colors.orange,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          )
        ],
      );
  }

  Scaffold ColumnRowExample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Row Column Example"),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey.shade300,
        width: 400,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.amber.shade100,
              child: Center(child: Text("Container 1")),
            ),
            Container(
              width: 100,
              height: 200,
              color: Colors.amber.shade200,
              child: Center(child: Text("Container 2")),
            ),
        
          ],
        ),
      ),
    );
  }

  Scaffold AlignmentAndCenterExample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.amber,
          child: Center(child: Container(child: Text("Deneme"),color: Colors.blue,)),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  Scaffold MySecondExample() {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First Word"),
        foregroundColor: Colors.green,
        backgroundColor: Colors.orange.shade300,
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        height: 350,
        child: Text("Sivas Suşehri"),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.only(topRight: Radius.circular(400),bottomLeft: Radius.circular(400)),
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(20, -20),blurRadius: 20)]
        ),
        margin: EdgeInsets.only(top:50,left: 20),
        padding: EdgeInsets.all(30),
      ),
    );
  }

  Scaffold MyFirstExample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Softito Dersleri"),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Container(
        child: Text("Yasin Aktaş" * 5),
        width: 200,
        height: 200,
        margin: EdgeInsets.only(top: 50,left: 36), // isimlendirilmiş constructor
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(color:Colors.blue,width: 2,),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(100))
        ),
      ),
    );
  }
}

class MyProjectHomework extends StatelessWidget {
  const MyProjectHomework
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Örnek 1"),
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Text("Container 1"),
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                    alignment: Alignment.topRight,
                    child: Text("Container 2"),
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              alignment: Alignment.center,
              child: Text("Container 3"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                border: Border.symmetric(horizontal: BorderSide(color: Colors.red,width: 10))
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 4"),
              padding: EdgeInsets.all(10),
            ),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border(top: BorderSide(color: Colors.yellow,width: 8),bottom: BorderSide(color: Colors.green,width: 8),left: BorderSide(color: Colors.black,width: 8),right: BorderSide(color: Colors.black,width: 8))
              ),
              alignment: Alignment.center,
              child: Text("Container 5"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red,width: 10),
                borderRadius: BorderRadius.circular(16)
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 6"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red,width: 10),
                borderRadius: BorderRadius.circular(16)
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 6"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red,width: 10),
                borderRadius: BorderRadius.circular(16)
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 6"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red,width: 10),
                borderRadius: BorderRadius.circular(16)
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 6"),
            ),
            Container(
              width: 150,
              height: 100,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red,width: 10),
                borderRadius: BorderRadius.circular(16)
              ),
              alignment: Alignment.topCenter,
              child: Text("Container 6"),
            )
          ],
        ),
      ),
    );
  }
}

class MyThirdExample extends StatelessWidget {
  const MyThirdExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon Kullanımı"),
        backgroundColor: Colors.orange.shade400,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        height: 350,
        margin: EdgeInsets.all(36),
        decoration: BoxDecoration(
          color: Colors.brown,
          border: Border.all(color: Colors.blue,width: 10),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(20, 20),blurRadius: 10)]
        ),
        child: Icon(Icons.person,size: 100,color: Colors.green,),
      ),
    );
  }
}
*/