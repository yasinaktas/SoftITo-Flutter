import 'pages/anasayfa.dart';
import 'package:flutter/material.dart';

import 'pages/kategoriler.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HostPage(),
      color: Colors.white,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Arka plan rengi beyaz
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar arka plan rengi beyaz
          foregroundColor: Colors.black, // AppBar metin rengi siyah
          elevation: 0, // AppBar gölgesi kaldırıldı
        ),
      ),
    );
  }
}

/*
 * Scaffold yapısı kullanır
 * Bottom Navigation Bar ve ilgili sayfaları barındırır
 * Bottom Navigation Bar Custom Widget olarak tasarlanmıştır
 * App Bar'ı yoktur
 * Bottom Navigation Bar elemanları:
 * - Ana Sayfa
 * - Kategoriler
 * - Kategoriler Yuvarlak Butonu (Bottom Modal Sheet)
 * - Sepetim (Login olunmadıysa Login sayfasına yönlendirir)
 * - Favoriler (Badge var)
 */
class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  final List<Widget> _pages = [
    Anasayfa(),
    Kategoriler(),
    Anasayfa(),
    Kategoriler(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        onCenterButtonPressed: (selected) {
          setState(() {
            if (selected) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    padding: EdgeInsets.all(16),
                    child: Text("Deneme"),
                  );
                },
              );
            }
          });
        },
      ),
    );
  }
}
