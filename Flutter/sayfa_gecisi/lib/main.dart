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
      home: NormalPage(),
    );
  }
}

class NormalPage extends StatelessWidget {
  const NormalPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tfAd = TextEditingController();
    TextEditingController tfButce = TextEditingController();
    TextEditingController tfArttir = TextEditingController();
    TextEditingController tfAzalt = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Veri Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              TextField(
                controller: tfAd,
                decoration: InputDecoration(
                  label: Text("Ad Soyad"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  )
                ),
              ),
              TextField(
                controller: tfButce,
                decoration: InputDecoration(
                  label: Text("Bütçe"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  )
                ),
              ),
              TextField(
                controller: tfArttir,
                decoration: InputDecoration(
                  label: Text("Arttır"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  )
                ),
              ),
              TextField(
                controller: tfAzalt,
                decoration: InputDecoration(
                  label: Text("Azalt"),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                  )
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        String adSoyad = tfAd.text;
                        double butce = double.parse(tfButce.text);
                        double arttir = double.parse(tfArttir.text);
                        double azalt = double.parse(tfAzalt.text);
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context)=>ButcePage(
                              adSoyad: adSoyad, 
                              butce: butce, 
                              arttir: arttir, 
                              azalt: azalt
                            )
                          )
                        );
                      }, 
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                      child: Text("Gönder",style: TextStyle(color: Colors.white),),
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButcePage extends StatefulWidget {
  final String adSoyad;
  double butce;
  final double arttir;
  final double azalt;
  ButcePage({
    super.key,
    required this.adSoyad,
    required this.butce,
    required this.arttir,
    required this.azalt
  });

  @override
  State<ButcePage> createState() => _ButcePageState();
}

class _ButcePageState extends State<ButcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bütçe Sayfası"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text("Ad Soyad: ${widget.adSoyad}",style: TextStyle(fontSize: 20,color: Colors.black),),
              Text("Bütçe: ${widget.butce}",style: TextStyle(fontSize: 20,color: Colors.black),),
              Text("Arttır: ${widget.arttir}",style: TextStyle(fontSize: 20,color: Colors.black),),
              Text("Azalt: ${widget.azalt}",style: TextStyle(fontSize: 20,color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
