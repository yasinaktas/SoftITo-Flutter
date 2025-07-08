import 'package:flutter/material.dart';
import 'package:isimlendirilmis_routes/red_page.dart';
import 'package:isimlendirilmis_routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*routes: {
        "/": (context) => RedPage(),
        "/greenPage": (context) => GreenPage(),
        "/yellowPage": (context) => YellowPage(),
      },*/
      /*onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => HataSayfasi());
      },*/
      onGenerateRoute: RouteGenerator.generate,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: RedPage(),
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

   onGenerate Route:
   Yine MaterialApp içerisinde bulunur.
   onGenerateRoute adında bir parametresi vardır.
   Bunun önceki konudan farkı sadece sayfa açma işlemi değil aynı zamanda veri aktarımı yapmak içinde kullanılabildiği için daha fazla işimize yarar.
   Ben MaterialApp içini dolurmak istemiyorum.
   O yüzden farklı bir dosya oluşturup bu işlemi tanımlayıp MaterialApp'de çağıracağım.

   Öncelikle route_generator.dart dosyası oluşturalım.

   class RouteGenerator {
    static Route<dynamic>? generate(RouteSettings settings) {
      switch (settings.name) {
        case "/":
          return MaterialPageRoute(builder: (context) => RedPage());
        case "/yellowPage":
          return MaterialPageRoute(builder: (context) => YellowPage());
        case "/greenPage":
          return MaterialPageRoute(builder: (context) => GreenPage());
        default:
          return MaterialPageRoute(builder: (context) => HataSayfasi());
      }
    }
  }

 OnGenerateRoute ile kurucu yardımıyla veri gönderme:
 1) Sayfaya gidecek olan butonun olduğu sayfada veri oluşturulur.
 2) Verinin gideceği sayfada kurucusunda alınacak veri için hazırlık yapılır.
 3) Rota yönetiminin olduğu sayfada (route_generator) veri verinin gideceği sayfaya gönderilir.
    String name = settings.arguments as String;
    return MaterialPAgeRoute(builder: (context) => GreenPage(ad: name));
 4) Anasayfadaki veriyi gönderen butona şu yazılır:
    Navigator.of(context).pushNamed("/greenPage",arguments: name);
 Sonuç olarak veri gönderimi tamamlanır.

 */
