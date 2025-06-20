import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  /*
  Abstract sınıf ve metodlar:

  -Eğer sınıf ve kalıtım kavramlarını iyi öğrendiyseniz sizin için sıkıntı olmayacaktır.
  -Abstract: soyut sınıf anlamına gelir. Sınıflar arasında soyutlama yapmak için kullanılır.
  -Abstract sınıflardan nesne üretilemez. Abstract sınıflarda normal ve Abstract metodlar olur
  -Abstract metodlar alt sınıflarca override edilmek zorundadır.
  -Bir sınıfta bir tane Abstract metod varsa o sınıf mutlaka Abstract sınıf olarak tanımlanmalıdır.
  -En büyük sorun şu ben bunu niye kullanıyorum ya sınıf oluştururum niye abstract sınıf oluşturayım ki? çok mantıksız diyeceksiniz. Ama mantığı oturduğunda neden kullanmanız gerektiğini anlayacaksınız. 

  -Örnek: Benim Kare diye bir sınıfım var, Dikdörtgen diye bir sınıfım ve daire diye bir sınıfım var. 
  --Bunların hepsi geometrik şekil mi? bunların hepsinin alanı ve çevresi var mı? 
  --Normal şartlarda bizim aklımıza ne gelir kalıtım GeometrikSekil adında bir sınıf oluştururuz ve diğerlerini bundan kalıtım yaptırırız dimi?
  --Yani biz sınıfımız abstract yaparsak gövdesi olmayan metodlar oluşturabiliriz sonra kalıtım alan sınıflarda bu metodlar implement ederek içini istediğimiz alan işlemler ile doldurabiliriz. 

  Abstract için bir alt sınıflar için ortak olmalı (Kalıtım) 
  iki bu çağrılan metodun içeriği hepsi için farklı olmalı (override)
  bu metodun çağrılması gerekli olmalı(zorunlu)

  Geometrik şekil dediğimiz soyut sınıftır çünkü sadece rehber görevi görecek yani taslak yani bu sınıf asla bir yerde çağrılmayacak. 

  Şimdi gelin bunu koda dökelim:

  1)Sekil adında bir üst sınıf oluşturduk:

  class Sekil{}

  2)Kare ev dikdörtgen adında bir alt sınıf oluşturduk ve Sekilden kalıtım aldırdık

  class Kare extends Sekil{}

  class Dikdortgen extends Sekil{}

  3)her şeklin alanı ve çevresi olacağı için şekil sınıfı içerisine alanHesapla ve cevreHesapla adında iki metod yazdık:

  class Sekil{

    double alanHesapla(){
      return 
    }

    double cevreHesapla(){

    }
}

ben return kısmına ne yazıcam a*a mı a*b mi? ben bilmiyorum. O zaman metodu mu sileyim? olmaz çünkü her şeklin alan ve çevre hesaplaması yapılması ZORUNLU. ve her şeklin alan ve çevre hesaplama işlemği farklı (override) ve her sınıf bu metodları kullanabilmeli (Kalıtım)

Kare ve dikdörtgen somut sınıflardır. Somut sınıf bir sınıftan nesne üretebiliyorsan o somuttur yani o sınıfı direk kullanıyorsan somuttur

Kare k1 = Kare(); bunu yapabiliyorsan somuttur. Ama soyut sınıflar sadece bir taslak olduğu için yukarıdaki nesne çağırma işlemini asla yapamazlar. 

Biz şekil sınıfını şu şekilde düzenleyip:

class Sekil {
  double alanHesapla() {
    return 0;
  }

  double cevreHesapla() {
    return 0;
  }
}

Kare ve dikdört içerisinde de override ederek işlem yapabiliriz. Çok doğru. Bunun iki kötü durumu var 1 ben karenin alanını hesaplayan metodu override etmezsem adam ne girerse girsin sonuç hep 0 döner. 
Yukarıdaki işlemi yaptın ben dikkat ederim hocam dedin. Ama bir mantık hatası da var yazılımda mantık hataları önemli. 

Sekil sekil = Sekil();
  sekil.alanHesapla()

  ben yukarıdaki gibi bir nesne asla oluşturmucam çünkü hangi şeklin alanının çağırıyorum ben? İşte eğer bir sınıftan mantık olarak nesne oluşturulmayacaksa o sınıfı soyut yani Abstract sınıf olarak tanımlamalıyız. bu şuna benziyor ben kalıtım yapmadan dolu kod yazarak işimi görür müyüm? evet. ben hiç fonksiyon kullanmadan kodumu yazar mıyım? evet. ben hiç hazır metodları kullanmadan üslü sayı sonucunu bulabilir miyim? evet peki biz iyi bir programcı nasıl olur demiştik?

  1)Az kod yazacak
  2)Kod tekrarı yapmayacak
  3)OOP kurallarına uygun kod yazacak yani düzenli anlaşılabilir yönetilebilir kod.
  4)SOLİD : herkes kendi işini yapacak.(her sınıf ya da her fonksiyon kendi işini yapacak). Eğer kod tekrarı varsa o kodda fonsksiyon kullanmak zorundasın. İhtiyaç olmayan şeyler olmamalı.
  5)iyi bir yazılımcı mantık çerçevesi içinde düzgün bir algoritma kurarak kod yazmalı.  

  Ben bu fonksiyonların içini dolduramıyorum bu sınıftan nesne oluşturmama gerek yok o zaman Sekil sınıfını abstract yapıcam:

  abstract class Sekil {}
  bu sınıftan hiç nesne oluşturmayacağımız için böyle yaptık aynı zamanda metodların içini de dolduramadığımız için ve ilk anlatırken bahsetmiştim eğer abstract metod oluşturacaksanız o sınıfta abstract olmalı demiştim bu yüzden sınıfı bu şekilde düzenledik.

  abstract class Sekil {}

  Daha sonra bu metodların kendi sınıflarında kendilerine özgü ve zorunlu olarak doldurulmaları gerektiği için metodlarıda abstract yapıyoruz:

 double alanHesapla();

 double cevreHesapla();


  metodların başına abstract yazmanıza gerek yoktur çünkü zaten bir metodun gövdesi yoksa direk alt sınıftan çağrılması gerekir zorunludur. 

  abstract sınıflarun içerisinde normal fonksiyonlarda olabilir. yani gövdesiz metodlar dışında normal method da yazılabilir


  abstract class Sekil {
  double alanHesapla();

  double cevreHesapla();

  void selamVer() {
    print("Selam");
    }
  }

  Daha sonra kare bize bağırmaya başlıyor çünkü üst sınıfınde iki tane doldurulmayı bekleyen metod var. Bizden sınıfın üzerine tıklayınca çıkan ampül de create missing overrides tıklayarak metodları otomatik oluşturuyoruz. Bu olay önceden öğrendiğimiz metodları ezmek oluyor:


  Sonra bu metodların içini kare ve dikdörtgen için doldurmalıyız. bu yüzden bu sınıfların içi şu şekilde değişti:

  Kare:

  class Kare extends Sekil {
  double kenarUzunluk;

  Kare(this.kenarUzunluk);

  @override
  double alanHesapla() {
    double alan = kenarUzunluk * kenarUzunluk;
    return alan;
  }

  Dikdörtgen:

class Dikdortgen extends Sekil {
  double en, boy;
  Dikdortgen({this.en = 1, this.boy = 1});
  @override
  double alanHesapla() {
    double alan = en * boy;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = (en + boy) * 2;
    return cevre;
  }
}

Daha sonra main içerisinde bu sınıflara ait nesneler oluşturduk. İki sınıf arasındaki parametre alma farkı çeşitlilik olsun diye.


  print("Şekillerin Alan ve Çevrelerini hesaplama Uygulamasına hoşgeldiniz");
  Dikdortgen d1 = Dikdortgen(en: 12, boy: 18);
  print(
    "eni: ${d1.en} boyu: ${d1.boy} olan dikdörtgenin alanı: ${d1.alanHesapla()} ve çevresi: ${d1.cevreHesapla()}",
  );

  Genel kod:

  abstract class Sekil {

  double alanHesapla();
  double cevreHesapla();
  void selamVer() {
    print("Selam");
  }
}

class Kare extends Sekil {
  double kenarUzunluk;

  Kare(this.kenarUzunluk);

  @override
  double alanHesapla() {
    double alan = kenarUzunluk * kenarUzunluk;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = 4 * kenarUzunluk;
    return cevre;
  }
}

class Dikdortgen extends Sekil {
  double en, boy;
  Dikdortgen({this.en = 1, this.boy = 1});
  @override
  double alanHesapla() {
    double alan = en * boy;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = (en + boy) * 2;
    return cevre;
  }
}

Main içi:

  print("Şekillerin Alan ve Çevrelerini hesaplama Uygulamasına hoşgeldiniz");
  Dikdortgen d1 = Dikdortgen(en: 12, boy: 18);
  print(
    "eni: ${d1.en} boyu: ${d1.boy} olan dikdörtgenin alanı: ${d1.alanHesapla()} ve çevresi: ${d1.cevreHesapla()}",
  );

  //Bir tane şekil sınıfı olsun bu sınıf abstract olsun bu sınıftan 3 tane şekil türesin (Paralelkenar, eşkanar üçgen ve daire). Üst sınıfta alan ve çevre adından iki tane gövdesiz metod olsun. Bu soruda kullanıcıdan seçim yapmasını isteyin 1 ise şu.. (sonsuz döngü) aldığınız değerleri kullanın ekrana alan ve çevresini yazdırın. Ayrıca sizlerden şunu istiyorum ekrana yazdıran metod üst sınıfta gövdeli bir metod olsun alt sınıflarda override edin .(kenar * kenar * sqrt(3))/4

  Main:
  bilgiAl();

  kod:

  void bilgiAl() {
  while (true) {
    stdout.write(
      "Lütfen hangi şeklin alan ve çevre hesaplamasını yapacaksınız seçiniz: Daire için 1 Eşkenar üçgen için 2 Eşkenar dörtgen için 3 çıkış yapmak için herhangi bir tuşa basınız: ",
    );
    String? secim = stdin.readLineSync();
    if (secim == "1") {
      stdout.write("Lütfen yarıçap uzunluğunu giriniz: ");
      double yariCap = double.parse(stdin.readLineSync()!);
      Daire d = Daire(yariCap: yariCap);
      d.alanVeCevreBilgisiniVer();
    } else if (secim == "2") {
      stdout.write("Lütfen eşkenar üçgenin kenar uzunluğunu giriniz: ");
      double kenar = double.parse(stdin.readLineSync()!);
      EskenarUcgen eu = EskenarUcgen(kenar: kenar);
      eu.alanVeCevreBilgisiniVer();
    } else if (secim == "3") {
      stdout.write("Lütfen eşkenar dörtgenin kenar uzunluğunu giriniz: ");
      double kenar = double.parse(stdin.readLineSync()!);
      stdout.write(
        "Lütfen şimdi de eşkenar dörtgenin yükseklik uzunluğunu giriniz: ",
      );
      double yukseklik = double.parse(stdin.readLineSync()!);
      EskenarDortgen ed = EskenarDortgen(kenar: kenar, yukseklik: yukseklik);
      ed.alanVeCevreBilgisiniVer();
    } else {
      break;
    }
  }


  abstract class Sekil {
  //sekil sınıfı başlangıç
  double alanHesapla();
  double cevreHesapla();

  void bilgiVer() {
    print(
      "ben bir şekilim alan çevre bilgisi veremem beni override etmeleri lazım zorunlu isem gövdem olmamalı zorundalı değilsem sadece kullanılacaksam override edilmeliyim",
    );
  }

  void alanVeCevreBilgisiniVer();
} //sekil sınıfı bitiş

class EskenarDortgen extends Sekil {
  double kenar, yukseklik;
  EskenarDortgen({required this.kenar, required this.yukseklik});
  @override
  double alanHesapla() {
    double alan = kenar * yukseklik;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = 4 * kenar;
    return cevre;
  }

  @override
  void bilgiVer() {
    print("Ben kenar uzunluğu $kenar olan bir eşkenar dörtgenim");
  }

  @override
  void alanVeCevreBilgisiniVer() {
    double cevre = cevreHesapla();
    double alan = alanHesapla();
    print(
      "Kenar uzunluğu $kenar ve yüksekliği $yukseklik olan eşkenar dörgenin çevresi: $cevre ve alanı: $alan'dir",
    );
  }
}

class Daire extends Sekil {
  final _pi = 3.14; //final sabit yani değer değiştirelemez.
  double yariCap;
  Daire({required this.yariCap});
  @override
  double alanHesapla() {
    double alan = _pi * yariCap * yariCap;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = 2 * _pi * yariCap;
    return cevre;
  }

  @override
  void bilgiVer() {
    print("Ben yarı çap uzunluğu : $yariCap olan bir daireyim");
  }

  @override
  void alanVeCevreBilgisiniVer() {
    print(
      "yarıçap uzunluğu $yariCap olan dairenin alanı: ${alanHesapla()} ve çevresi: ${cevreHesapla()} ' dir",
    );
  }
}

class EskenarUcgen extends Sekil {
  double kenar;
  EskenarUcgen({required this.kenar});
  @override
  double alanHesapla() {
    double alan = (kenar * kenar * sqrt(3)) / 4;
    return alan;
  }

  @override
  double cevreHesapla() {
    double cevre = 3 * kenar;
    return cevre;
  }

  @override
  void bilgiVer() {
    print("Ben kenar uzunluğu $kenar olan bir eşkenar üçgenim");
  }

  @override
  void alanVeCevreBilgisiniVer() {
    double alan = alanHesapla();
    double cevre = cevreHesapla();
    print(
      "Kenar uzunluğu $kenar olan eşkenar üçgenin alanı: $alan ve çevresi $cevre' dir",
    );
  }
}

Uygulama Özeti:


Sekil sınıfı artık soyut(abstract) bir sınıf olduğu için ondan nesne üretemeyiz alttaki kod hata verir:

 Sekil sekil = Sekil();

 Ama eğer Sekil i bir yer de kullanalım derseniz kalıtım açısındna kullanabilirsiniz:

  Sekil daire = Daire(yariCap: 5);
  daire.bilgiVer();//ben bir daireyim der.

  Yukarıdaki uygulamada yaptıklarımızı özetlersek.
  1)Once Sekil adından bir sınıf oluşturduk. Bu sınıfın kendine başına bir işe yaramadığını anlayıp bunun soyut yani abstract sınıf olması gerektiğine karar verdik. 
  2)her şeklin bir alan ve cevre hesaplama işlevi olduğunu düşündüğümü için iki tane gövdesi olmayan fonskiyon tanımladık.
  3)bir tanede gövdesi olan bilgiVer adlı void bir metod yaptık. Bunu soyut sınıflarda gövdesi olan metodta tanımlabildiğini göstermek için yaptık. Sonra ekrana alan ve cevre bilgisi tüm şekiller vermeli diye gövdesi olamayan cevreAlangoster adlı metodu oluşturduk. Bu şekilde Sekil sınıfımız tamamlandı.
  4)Daha sonra Sekis sınıfından kalıtım alan EskenarUcgen, EskenarDortgen ve Daire adlı sınıf oluşturduk. Bu sınıflar soyut bir sınıftan kalıtım aldıkları için gövdesi olmayan o tanımladığımız üç fonskiyonu override etmek zorunda kaldı.
  5)o şekillerin geometri alanından alan ve cevre formülleri ile işlemleri yaptık. Ama önemli olan bu metotlar değer döndüren return döndüren metodlar.
  6)Daha sonra bilgiAl metodunda kullanıcıdan bir seçim yapmasını istedik yaptığı secime göre o şeklin ihtiyacı olan bilgiyi girdi ve o sınıfın kurucu metodunun istediği bilgi ile eşleştirip hesaplamalarını yaptırdık. 

  soyut sınıfları bir veri türü olarak kullanabilirsiniz sadece nesne oluşturamazsınız:

  List<Sekil> tumSekiller = [];
  Daire d1 = Daire(yariCap: 5);
  tumSekiller.add(d1);
  Sekil d = Daire(yariCap: 5);


  //mesela siz flutter ile bir mobil uygulama yapıyorsunuz. sonra veritabanı olarak firebase kullanmış olabilirsiniz. sonra ben bunu domain (mysql) a taşıcam o zaman ne yapmanız lazım firebase kullandığınız her yeri değiştirmeniz gerekir.
//Peki ben bu sınıfı niye soyut yaptım. Çünkü şöyle düşündüm eğer ben bu fonksiyonlar içini doldursaydım daha sonra veritabanı değişikliği yaparsam herşeyi değiştirmem gerekiyordu. ben bunu soyut yaptım ki eğer firebase den domaine geçersek sıkıntı çekmeyelim tek bir yeri değiştircez her yer artık domain veritabanına entegre olmuş olacak


  */
  Veritabani db = FirebaseDB();
  db.userSave();
  db.userDelete();
  userGuncelle(db);
}

void userGuncelle(Veritabani veritabani) {
  veritabani.userUpdate();
}

abstract class Veritabani {
  void userSave();
  void userUpdate();
  void userDelete();
}
/*
class OrcaleDB extends Veritabani {
  @override
  void userDelete() {
    print("Oracle db den veri silindi");
  }

  @override
  void userSave() {
    print("Oracle db ye veri eklendi");
  }

  @override
  void userUpdate() {
    print("Oracle db deki veri güncellendi");
  }
}
*/
class FirebaseDB extends Veritabani {
  @override
  void userDelete() {
    print("Firebase veritabanından veri silindi");
  }

  @override
  void userSave() {
    print("Firebase veritabanına veri eklendi");
  }

  @override
  void userUpdate() {
    print("Firebase veritabanındaki veri güncellendi");
  }
}

//09:00 - 11:00 (2 saat)
//11:20 - 12:50 (1 saat 30dk)
//13:50 - 16:00 (2 saat 10dk)
//16:15 - 18:35 (2 saat 20dk)
