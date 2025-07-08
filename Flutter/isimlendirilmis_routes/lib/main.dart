import 'package:flutter/material.dart';
import 'package:isimlendirilmis_routes/green_page.dart';
import 'package:isimlendirilmis_routes/hata_sayfasi.dart';
import 'package:isimlendirilmis_routes/red_page.dart';
import 'package:isimlendirilmis_routes/yellow_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => RedPage(),
        "/greenPage": (context) => GreenPage(),
        "/yellowPage": (context) => YellowPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => HataSayfasi());
      },
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: RedPage(),
    );
  }
}

/**
 * MaterialApp projenin bel kemiği olduğunu daha önce söylemiştik. 
 * Bunu ispatlamanın en güzel örneği rotalardır. 
 * MaterialPageRoute sınıfı MaterialApp olmadan çalışmaz.
 * 
 * Ben rotalara niye ihtiyaç duyarım? 
 * Ben her sayfa geçişinde MaterialPageRoute sınıfını çağırıyor muyum? 
 * Bu performans açısından iyi değil. 
 * Bu yüzden rotaları kullanmak daha performanslıdır.
 * 
 * Rota kullanmanın iki yolu vardır. 
 * Bir tanesi standart olan diğeri gelişmiş olan.
 * 
 * Aralarındaki fark biri sadece sayfa geçişini sağlar.
 * 
 * Diğeri ise hem sayfa geçişini hem de veri aktarımını sağlar ama daha karmaşıktır.
 * 
 * Rotaları tanımlamak için MaterialApp içerisindeki routes parametresi kullanılır ve bizden bir map ister içine rota ister.
 * 
 * Eğer ana rotayı tanımlamak istersek / işareti ile tanımlarız:
 * Eğer bunu yapıyorsak diğer rotaların başına / işareti mutlaka konulmalıdır.
 * Ayrıca bu kök dizini kullanılacaksa artık MaterialApp içinde home parametresi kullanılmamalıdır.
 * Eğer bu rotada yanlış bir yol varsa çalışan özel bir parametre vardır.
 * Bu da MaterialApp parametresidir:
 * onUnknownRoute: (settings) {
      return MaterialPageRoute(builder: (context) => HataSayfasi());
   },
 */
