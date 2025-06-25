import 'package:flutter/material.dart';
import 'package:yemekler/models/yemek.dart';
import 'package:yemekler/views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String mainUrl = "images/";
    List<Yemek> yemekler = [
      Yemek(
        name: "Izgara Köfte",
        desc:
            "Izgara köfte, Türk mutfağının en sevilen lezzetlerinden biridir. Öncelikle dana kıyması, ince doğranmış soğan, sarımsak, maydanoz, kimyon, karabiber ve tuz gibi baharatlarla birlikte yoğurulur. Kıymaya biraz bayat ekmek içi veya galeta unu eklenerek kıvamı dengelenir ve köfte harcı iyice homojen hale gelene kadar karıştırılır. Daha sonra bu harç, ceviz büyüklüğünde parçalar alınarak uzun yassı şekiller verilir ve önceden ısıtılmış ızgara veya mangalda pişirilir. Köftenin dışı güzelce kızarıp içi sulu kalacak şekilde pişirilmesi çok önemlidir. Yanında domates, biber ızgara veya pilav ile servis edilir.",
        imageUrl: "${mainUrl}y1.png",
        price: 350,
      ),
      Yemek(
        name: "Karışık Kebap",
        desc:
            "Karışık kebap, farklı et türlerinin bir arada sunulduğu zengin bir tabaktır. Kuzu şiş, adana kebap, kuzu ciğer gibi farklı parçalar kullanılır. Önce etler, özel baharatlar, yoğurt ve zeytinyağı ile marine edilir. Marine işlemi etin daha yumuşak ve lezzetli olmasını sağlar. Daha sonra etler, şişlere geçirilerek mangalda ya da fırında yüksek ateşte pişirilir. Pişerken etlerin dışı kızarır, içi ise yumuşak kalır. Karışık kebap, genellikle közlenmiş biber, domates, soğan ve sumaklı yeşilliklerle birlikte servis edilir. Yanında lavaş veya pilavla mükemmel gider.",
        imageUrl: "${mainUrl}y2.png",
        price: 1200,
      ),
      Yemek(
        name: "Kuzu Şiş",
        desc:
            "Kuzu şiş, kuzu etinin kemiksiz ve yağlı kısımlarından hazırlanır. Etler kuşbaşı doğranır ve sarımsak, yoğurt, zeytinyağı, tuz, karabiber, kırmızı toz biber gibi baharatlarla marine edilir. Marine edilmiş kuzu parçaları şişlere geçirilir ve mangalda pişirilir. Kuzu şişin en önemli kısmı, marine süresidir; en az birkaç saat hatta tercihen bir gece buzdolabında bekletilmesi gerekir. Pişerken etin dışı güzelce kızarıp, içi yumuşak kalır. Yanında közlenmiş sebzeler, pilav ya da bulgur pilavı ile servis edilir.",
        imageUrl: "${mainUrl}y3.png",
        price: 900,
      ),
      Yemek(
        name: "Sarma Ciğer",
        desc:
            "Sarma ciğer, dana ciğerinin ince ince doğranıp, baharatlarla harmanlanarak sarılmasıyla yapılır. Öncelikle ciğer küçük küçük doğranır, soğan, maydanoz, karabiber, kimyon ve pul biberle birlikte yoğurulur. Ardından bu harç, küçük lavaş ya da ince yufka parçalarına sarılır. Sarılan ciğerler, genellikle tavada az yağda veya ızgarada pişirilir. Sarma ciğerin içi yumuşak, dışı ise hafif çıtır olur. Yanında limon ve sumaklı soğanla servis edilir.",
        imageUrl: "${mainUrl}y4.png",
        price: 750,
      ),
      Yemek(
        name: "Tantuni",
        desc:
            "Tantuni, ince kıyılmış dana eti veya kuzu etiyle yapılır. Öncelikle etler, tereyağı veya margarinle çok hızlı ve yüksek ateşte kavrulur. Et pişerken üzerine domates, yeşil biber ve baharatlar eklenir. Tantuni, ince lavaş ekmeği içine konularak sunulur. Lavaşın içine konan tantuni etinin üzerine maydanoz, soğan ve limon sıkılır. Dışarıda özellikle Mersin bölgesinin meşhur lezzetidir. Acı sevenler için yanında biber turşusu da verilir.",
        imageUrl: "${mainUrl}y5.png",
        price: 450,
      ),
      Yemek(
        name: "İskender",
        desc:
            "İskender kebap, ince dilimlenmiş döner etinin yoğurt ve tereyağı sosu ile servis edildiği özel bir yemektir. Önce döner, özel baharatlarla hazırlanır ve döner ocağında pişirilir. Servis için döner, küçük küçük kesilir ve üzerine tereyağında kızdırılmış domates sosu gezdirilir. Altında ise tereyağlı pide dilimleri bulunur. Yanında yoğurt ile birlikte servis edilir. İskender, lezzet dengesinin çok iyi ayarlandığı, hem doyurucu hem hafif bir yemektir.",
        imageUrl: "${mainUrl}y6.png",
        price: 530,
      ),
      Yemek(
        name: "Mumbar",
        desc:
            "Mumbar, koyun bağırsaklarının temizlenip içinin baharatlı kıyma ile doldurulmasıyla hazırlanır. İç harç, kıyma, pirinç, soğan, maydanoz, karabiber, pul biber ve tuzdan oluşur. Bağırsaklar bu harçla doldurulur ve ağızları kapatılır. Daha sonra mumbar, bol su içinde haşlanır. Haşlandıktan sonra dilimlenip, kızartılarak ya da fırınlanarak servis edilir. Yanında salata ve limon dilimleriyle sunulur.",
        imageUrl: "${mainUrl}y7.png",
        price: 600,
      ),
      Yemek(
        name: "Kokoreç",
        desc:
            "Kokoreç, kuzu veya oğlak bağırsaklarının ince ince temizlenip, kuzu bağırsağı ve baharatlarla sarılmasıyla yapılır. Kokoreç şişe geçirilip mangalda yavaşça pişirilir. Pişerken sık sık çevrilir, böylece dışı çıtır, içi ise yumuşak olur. Pişen kokoreç, ince ince doğranır ve domates, yeşil biberle birlikte tavada kavrulur. Genellikle ekmek arası servis edilir. Baharat olarak kekik, pul biber, karabiber kullanılır.",
        imageUrl: "${mainUrl}y8.png",
        price: 280,
      ),
      Yemek(
        name: "Kuzu Tandır",
        desc:
            "Kuzu tandır, kuzu etinin uzun süre düşük ateşte pişirilerek hazırlanan geleneksel bir yemektir. Genellikle kuzu kol veya but kısmı kullanılır. Et önce yoğurt, sarımsak ve baharatlarla marine edilir. Ardından toprak veya demir bir kapta, kapalı şekilde düşük ısıda birkaç saat pişirilir. Et, kemikten kolaylıkla ayrılır ve yumuşacık olur. Yanında genellikle pilav, yoğurt ve közlenmiş sebzelerle servis edilir.",
        imageUrl: "${mainUrl}y9.png",
        price: 670,
      ),
      Yemek(
        name: "Lahmacun",
        desc:
            "Lahmacun, ince açılmış hamurun üzerine kıyma, domates, soğan, maydanoz, sarımsak, biber salçası ve çeşitli baharatların yayılmasıyla yapılır. Hazırlanan bu karışım hamurun üzerine ince bir tabaka halinde sürülür ve çok yüksek sıcaklıkta taş fırında birkaç dakika pişirilir. Lahmacunun hamuru çıtır çıtır olur ve üstündeki kıymalı harç baharatlı ve sulu kalır. Yanında bol maydanoz, soğan ve limonla servis edilir.",
        imageUrl: "${mainUrl}y10.png",
        price: 150,
      ),
      Yemek(
        name: "Karışık Pide",
        desc:
            "Karışık pide, farklı malzemelerin bir arada kullanıldığı zengin bir pidedir. Hamur açılır ve üzerine kıyma, sucuk, kaşar peyniri, biber, domates gibi malzemeler konulur. Bazı tariflerde yumurta da eklenir. Pide, taş fırında pişirilir ve hamuru çıtır çıtır olur. İçindeki peynirler eriyip, kıyma ve sebzeler pişince doyurucu ve lezzetli bir tabak ortaya çıkar. Genellikle yanında ayranla tüketilir.",
        imageUrl: "${mainUrl}y11.png",
        price: 340,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yemekler Listesi"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: YemekListesi(yemekler: yemekler),
      ),
    );
  }
}

class YemekListesi extends StatefulWidget {
  final List<Yemek> yemekler;
  const YemekListesi({super.key, required this.yemekler});

  @override
  State<YemekListesi> createState() => _YemekListesiState();
}

class _YemekListesiState extends State<YemekListesi> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.yemekler.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: YemekCard(yemek: widget.yemekler[i]),
        );
      },
    );
  }
}

class YemekCard extends StatefulWidget {
  final Yemek yemek;
  const YemekCard({super.key, required this.yemek});

  @override
  State<YemekCard> createState() => _YemekCardState();
}

class _YemekCardState extends State<YemekCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(yemek: widget.yemek),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.yemek.imageUrl),
        ),
        title: Text(widget.yemek.name),
        subtitle: Text("Fiyat: ${widget.yemek.price}₺"),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }
}
