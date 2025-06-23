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
      home: MyPage(),
    );
  }
}

// Sayfalar arası geçiş
// Geçiş Türü, Geçiş Yönü, Gelinen Yer (bulunduğumuz yer her zaman context), Gidilen Yer
// İleri gitmek: Navigator.push(bulunduğun sayfa, rota) =>
/*
  Navigator.push(context, MaterialPageRoute(builder:(context) => SayfaA()));

  context'i MaterialApp'den almıyoruz, Scaffold'lardan alıyoruz
*/

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ekran Geçişi"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Veri"
              ),
            ),
            FloatingActionButton(
              onPressed: (){},
              tooltip: "FAB",
              child: Icon(Icons.ac_unit_outlined),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("FAB 1 Basıldı");
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çalışma"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
      ),
      
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SayfaA();
  }
}

class SayfaA extends StatelessWidget {
  const SayfaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Text("SayfaB'ye git"))
          ],
        ),
      ),
    );
  }
}

class SayfaB extends StatelessWidget {
  const SayfaB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa A"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  String ad = "";
  TextEditingController tf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: tf,
              obscureText: false,
              maxLength: 24,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                hintText: "Deneme",
                label: Text("Dış Bilgi Yazısı"),
                labelStyle: TextStyle(color: Colors.green),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.red,width: 1),
                   borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red,width: 1),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                ad = tf.text;
              });
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              elevation: 4,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.lightBlueAccent,width: 2)
              )
            ), 
            child: Text("Gönder",style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 20,),
          Text("Alınan veri: $ad",style: TextStyle(fontSize: 24),),
        ],
      ),
    );
  }
}