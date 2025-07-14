import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*
 * - Bu proje MVVM'in temelinin anlaşılması için oluşturulmuştur.
 * - Ana sayfada todo listesi gösterilecektir ve bir buton ile todo ekleme sayfasına yönlendirilecektir.
 * - Todo ekleme sayfasında kullanıcıdan todo bilgisi alınacak ve listeye eklenecektir.
 */

/*
 * 
 */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
