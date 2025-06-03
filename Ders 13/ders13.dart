import 'dart:io';
import 'veritabani.dart';

void main(List<String> args) {
  /*
  OOP Tekrar:
  1)Hayattaki herşey nesneydi. programlamayı gerçek hayat ile ilişkilendiren bir pattern
  2)OOP için bilmemiz gereken en önemli konular class, fonksiyon, koleksiyonlar ve kurucu metodler
  3)sınıf: bizim veri taslağımız. Verileri içinde toplayıp yöntecğimiz ve işlemler yapacağımız (ekleme, silme listelemei güncelleme gibi) taslağımız.
  -Sınıf içerisine kendi değişkenlerini (property) alabilir kendi metodlarını oluşturabilir.
  -Sınıflar ileride dönemde öğreneceğimiz model kavramıdır. 
  -Sınıfları çağırırken şu şekilde çağırıyoruz:
  Sınıf_adı nesne_adı = sınıf_adı();
  -yukarıdaki çağırma şeklinden de anlayacağımız gibi sınıfı çağırmak demek ondan bir örnek yani bir nesne oluşturmak demektir.
  -nesne kavramını daha iyi anlamak istiyorsak şu örneği vermiştik:
  sınıf rbir abartman ise nesne o apartmandaki dairedir. Her dairenin özellikleri farklı ama özellik adları aynıdır.her dairenin su faturası, elektirik faturası, kişi sayısı, adresi var bunlar değişken ama değeri farklıdır bu da onları farklı nesne yapan şeydir.
  -Peki biz bir sınıftaki değişkene ya da metoda nasıl ulaşırız? nokta operatörü ile ulaşırız. nesne oluşturduktan sonra:
  nesne_adi.degisken_adi
  nesne_adi.metot_adi
  şeklinde ulaşırız.

  -Peki bizim sınıfımızdaki değişkenlere nasıl değer ataması yaparız:
    nesne_adi.degisken_adi = deger
  ama ya bizim 15 tane değişkenimiz varsa 15 satır boyunca değer mi vericez tabiki hayır. Bunun için başka bir yol kullanacağız. Bunun cevabu kurucu metot kavramıdır.

  Kurucu Metodlar: Bu kavram sınıftan bir nesne ürettiğimizde çalışan ilk metottut. Biz çağırmasakta çalışır. yani bir çağırma yöntemi yoktur.

  sınıf_adi nesne_adi = sınıf_adi() dediğimiz an arka planda çalışır.
  Peki biz bu kurucu metod ile veri nasıl alıcaz. Kurucu metotlar bulundukları sınıf ile aynı adı taşırlar

  class Ogrenci{
  
  //kurucu metot
  Ogrenci(){
  }
  
  }

  Biz bu metot ile değer almak istiyorsan parametre vermemiz gerekir. Önceden bildiğimiz gibi fonksiyonlar parametre alarak dışarıdan verileri alıp kullana bilirler

  Örnek bir kurucu yazmak istersek

  class Ogrenci{
  int? ogrNo;
  String? ogrAd;

  //kurucu metodun alacağı parametre sınıf içindeki değişken ile belirlenir bu örnekte 2 değişken olduğu için kurucu metotta iki değişken alacak

  Ogrenci(int ogrenciNo, String ogrenciAd){
  //daha sonra sınıf değişkeni bu kurucu metottan gelen parametreyi kendisine değer olarak almalı

  ogrNo = ogrenciNo;
  ogrAd = ogrenciAd;
  }
  }

  Bu şekilde sınıf içerisinde değişken kurucu metod ile doldurulur peki veri alma işlemi nasıl oluyor nesne ürettiğimiz an oluyor

  Ogrenci ogr1 = Ogrenci(ogrenciNo, ogrenciAd);

  peki farklı değişken mi kullanmak zorundayız tabiki hayır ama o zaman değişken ve parametre eşleşmesi sırasında sınıf değişkeni başına this eklemeliyiz. this bulunduğu sınıftaki değişkeni işaret eder:


  class Ogrenci{
  int? ogrNo;
  String? ogrAd;

  Ogrenci(int ogrenciNo, String ogrenciAd){

  this.ogrNo = ogrenciNo;
  this.ogrAd = ogrenciAd;
  }
  }

  peki hocam bunun daha kısa bir kullanımı var mı? evet süslü parantez kullanmadan direk this.ogrNo yu parametre olarak verebiliriz ve flutter de biz bunu kullanıcaz


  class Ogrenci{
  int? ogrNo;
  String? ogrAd;

  Ogrenci( this.ogrNo, this.ogrAd);

  }

  Peki hocam bu sınıf kavramı sadece bir taslak mı? hayır aslında sınıf ile biz kendi veri tipimizi oluşturmuş oluyoruz. Eski konulardan hatırlarsak Random r = Random() diye bir kod yazardık aslında bu kodda Random sınıfından r adında bir örnek yani nesne oluşturmak demektir. Artık bizimde Random gibi bir sınıfımız yani veri türümüz vardir.

  Biz nasıl int türünde verilerimizi listeye eklerken List<int> sayilar = [] diyorsak artık List<Ogrenci> ogrenciler = [] oluşturabileceğiz.

  peki biz bu listeye eklerken nasıl ekliyoruz
  List<Ogrenci> ogrenciler = [] 
  Ogrenci ogr1 = Ogrenci(1453,"Bilal");
  ogrenciler.add(ogr1);

  -hocam biz parametre gönderirken ben parametrelerin yerini karıştırabiliyorum. Biz bu parametreleri isimlendiremiyor muyuz? Tabiki isimlendiriyoruz. Kurucu metıt oluşturulurken parametre aldığımız yeri {} içine alırsak artık parametreleri o değişken adına göre isimlendirmiş oluruz.

  class Araba{
  int? modelYili;
  String? marka;

  Araba({this.modelYili, this.marka});
  
  }

  Araba araba1 = Araba(modelYili: 2015, marka : "Skoda");
  Araba araba2 = Araba(marka: "Toyota", modelYili: 2018);

  peki hocam bu şekilde parametreyi girmezsek hata vermiyor ben vs code un beni bu konuda uyarmasını istiyorum yani parametre isimli olsun ama girmekte zorunlu olsun nasıl yaparız: parametre tanımlanırken başına required demelisin. Ama bunun bir özelliği var hocam bazıları zorunlu bazılarız zorunlu olmasın diyemezsin birini zorunlu yaptıysan diğerini de yapmak zorundasın. 

  class Araba{
  int? modelYili;
  String? marka;

  Araba({ required this.modelYili,  required this.marka});
  
  }

  Hocam ben bazen nesne oluştururken bazı değişkenleri alıp bazen oluştururken de farklı değişkenleri almak istiyorum ama kurucu metot benden hepsini istiyor bunu nasıl çözerim? isimlendirilmiş kurucu metot kavramı ile

  class Sirket{
    int? vergiNo;
    int? butce;
    String? sirketYili;

    Gernel kurucu
    Sirket({this.vergiNo, this.butce, this.sirketYili});

    Sirket.sadeceYil({this.sirketYili});
    Sirket.vergiKurucu({this.vergiNo, this.butce});

    Çağırırken de 
    Sirket s1 = Sirket.sadeceYil(sirketYili : "2001");


  }

  Hocam biz bu kurucu metotlarda değer döndüremiyor muyuz? Döndürürüz bunun için factory kurucu metotlar vardır 

  factory Sirket.donduren(String sirketYili){
    if(sirketYili) > 1990{
      Sirket.sadeceYil(sirketYili)
    }
  }


//Stok Takip Uygulaması
//Urun adında bir sınıfım +
//Sınıf değişkenlerim : urunAd, urunFiyat, urunAdet, stoktaMi +
//sınıf içerisin kurucu metod ile alıcam +
//sınıf içerisinde ekle metodum +
//Listele metodum olacak +
//Sil +
//Güncelle metodum olacak +
//Arama metodum +
yapalım: 



  void geneIslemler() {
  print("***** Stok Takip Uygulamasına Hoş geldiniz *****");
  List<Urun> urunler = [];
  while (true) {
    stdout.write(
      "Ürün eklemek için 1 e Ürün listelemek için 2'ye ürün aramak için 3'e ürün güncellemek için 4'e ürün silmek için 5'e  çıkış yapmak için herhangi bir tuyşa basınız: ",
    );
    String secim = stdin.readLineSync()!;
    if (secim == "1") {
      bilgileriAlveEkle(urunler);
    } else if (secim == "2") {
      urunListele(urunler);
    } else if (secim == "3") {
      urunBulma(urunler);
    } else if (secim == "4") {
      urunGuncelle(urunler);
    } else if (secim == "5") {
      urunSilme(urunler);
    } else {
      break;
    }
  }
}

void urunGuncelle(List<Urun> urunler) {
  stdout.write("Lütfen güncellemek istediğiniz ürünün adınız yazınız: ");
  String urunAd = stdin.readLineSync()!;
  stdout.write("Lütfen ürünün yeni adınız yazınız: ");
  String yeniUrunAd = stdin.readLineSync()!;
  for (Urun u in urunler) {
    if (u.urunAd == urunAd) {
      u.urunAd = yeniUrunAd;
    }
  }
}

void urunSilme(List<Urun> urunler) {
  stdout.write("Lütfen silmek istediğiniz ürünün adınız yazınız: ");
  String urunAdi = stdin.readLineSync()!;
  for (Urun urun in urunler) {
    if (urun.urunAd == urunAdi) {
      urunler.remove(urun);
      break;
    }
  }
}

void urunBulma(List<Urun> urunler) {
  stdout.write("Lütfen aramak istediğiniz ürünün adınız yazınız: ");
  String urunAd = stdin.readLineSync()!;
  bool urunVarmi = false;
  for (Urun urun in urunler) {
    if (urun.urunAd == urunAd) {
      urunVarmi = true;
      break;
    }
  }
  if (urunVarmi) {
    print("Ürün var");
  } else {
    print("Ürün yok");
  }
}

void urunListele(List<Urun> urunler) {
  int sayac = 0;
  if (urunler.length == 0) {
    print("Henüz bir ürün eklemediniz");
  } else {
    for (Urun u in urunler) {
      sayac++;
      print("***** Eklenen $sayac. ürün: ******");
      u.urunListeleme();
    }
  }
}

void bilgileriAlveEkle(List<Urun> urunler) {
  stdout.write("Lütfen ürün adını giriniz: ");
  String? urunAd = stdin.readLineSync();
  stdout.write("Lütfen ürün adedini giriniz: ");
  int urunAdet = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen ürün fiyatını giriniz: ");
  double urunFiyat = double.parse(stdin.readLineSync()!);
  stdout.write("Lütfen ürün stokta mı bilgisini giriniz: ");
  String? urunStoktaBilgisi = stdin.readLineSync();
  bool urunStoktaMi;
  urunStoktaBilgisi == "Evet" ? urunStoktaMi = true : urunStoktaMi = false;
  Urun urun = Urun(
    urunAd: urunAd!,
    urunAdet: urunAdet,
    urunFiyat: urunFiyat,
    urunStoktaMi: urunStoktaMi,
  );
  urunler.add(urun);
}

class Urun {
  String? urunAd;
  int? urunAdet;
  double? urunFiyat;
  bool? urunStoktaMi;

  Urun({
    required this.urunAd,
    required this.urunAdet,
    required this.urunFiyat,
    required this.urunStoktaMi,
  });
  void urunListeleme() {
    String stokDurum = "";
    urunStoktaMi! ? stokDurum = "Var" : stokDurum = "Yok";
    print(
      "Ürün adı: $urunAd\nÜrün adet: $urunAdet\nÜrün fiyat: $urunFiyat\n Stok durumu : $stokDurum",
    );
  }
}

//Private Değişkenler ve Metotlar
1)private değişken ve fonksiyonlar: Bir sınıftaki değişken ve metotları bazen erişime kapatmak isteyebiliriz. Bu durumlarda _işareti ile bunları saklarız. 
private: aynı dosya içerisinde erişelebilip farklı dosyalar içerisinde erişilmemesini sağlar.

(Kapsülleme Encapsullation)
2)getter metotlar: sınıf değişkenlerini okumak için kullanılan özel bir fonksiyondur. Bu metotların amacı özellikle private yani dış dünyaya erişime kapatılmış değişkenlerin gerekli olduğu durumlarda okunmasını sağlamaktır.

3)setter metotlar: sınıf değişkenlerine veri atamak için kullanılır. Bu metotların amacı özellikle private yani dış dünyaya kapalı değişkenlere veri atamaktır. Ayrıca veri ataması yapılırken gerekli kontrollerin ve işlemlerin yapılmasıdır.

-Kafamızdaki sorun şu ben niye private değişken tanımlıyorum ki?

Örnek:


 //buranın amacı veritabanına başarılı bir şekilde girmek
  VeriTabaniIslemleri db = VeriTabaniIslemleri();
  bool sonuc = db.baglan();
  if (sonuc) {
    print("Bağlandım");
  } else {
    print("hatalı bağlantı");
  }

class VeriTabaniIslemleri {
  //Veri tabanına bağlanmak için gerekenler

  String kullaniciAdi = "bilal";
  String sifre = "123456";

  bool baglan() {
    if (kullaniciAdi == "bilal" && sifre == "123456") {
      //başarılı giriş
      return true;
    } else {
      //başarısız giriş
      return false;
    }
  }
}

-burdaki sıkıntı bu adamın amacı sadece baglan fonksiyonunu kullandırmak. veritabanından gelen kullaniciAdi ve  sifre değişkeni ile işi yok. Biz bu iki değişkeni dış dünyaya kapatmalıyız. Çünkü bu adam kullanıcı adlarını çekebilir değiştirebilir herşey yapabilir. Bu istenen bir durum değildir. İşte bu gibi sebepler yüzünden bu iki değişkeni gizlemeliyiz bunun içinde _ kullanıcaz:

_ koymamıza rağmen hala ulaşabiliyoruz. Bunun nedeni şudur.eğer çağırdığınız yer ile sınıfımız aynı yerde ise farklı yerlere taşımalıyız. Yani veritabani.dart diye bir dosya oluştururum ve sınıf yapısını onun içine taşırım:

veritabani.dart:

  //Veri tabanına bağlanmak için gerekenler

  String _kullaniciAdi = "bilal";
  String _sifre = "123456";

  bool baglan() {
    if (_kullaniciAdi == "bilal" && _sifre == "123456") {
      //başarılı giriş
      return true;
    } else {
      //başarısız giriş
      return false;
    }
  }
}

ders13.dart:

Main içerisi:

  //buranın amacı veritabanına başarılı bir şekilde girmek
  VeriTabaniIslemleri db = VeriTabaniIslemleri();
  bool sonuc = db.baglan();
  
  if (sonuc) {
    print("Bağlandım");
  } else {
    print("hatalı bağlantı");
  }

  ama main hata verecek o yüzden nesne oluşturduğumuz yere tıklayıp ampül tıklayarak veritabani.dart dosyasını import etmemiz gerekir. 

  Sonuç olarak main de db.kullaniciAdi yazdığımızda artık gelmediğini görebilirsiniz. 

  private metodlar: Bazı metodlar sadece bulunduğu sınıfta çalışmalıdır. Diğer dosyalardan ulaşılmasına gerek yoktur. Böyle durumlarda private yapılır. Örneğin internet kontrolü sağlayan bir metodun sadece bağlan metoduna veri göndermesi durumunda diğer dosyalardan erişilmesine gerek yoktur.


  class VeriTabaniIslemleri {
  //Veri tabanına bağlanmak için gerekenler

  String _kullaniciAdi = "bilal";
  String _sifre = "123456";

  bool baglan() {
    if (_internetVarmi()) {
      if (_kullaniciAdi == "bilal" && _sifre == "123456") {
        //başarılı giriş
        return true;
      } else {
        //başarısız giriş
        return false;
      }
    } else {
      return false;
    }
  }
  //private metot
  bool _internetVarmi() {
    bool baglanti = Random().nextBool();
    if (baglanti) {
      //true, false
      return true;
    } else {
      return false;
    }
  }
}

//Kimden neyi saklıyoruz. 1 kullanım kolaylığı 2 kötü niyetli insanlar için private kullanılır (get- set) 3 bug olma durumunda önemli olan sorun çıkması felakete neden olacak bilgileri saklamak

//Eğer isimlendirilmiş bir kurucu metod tanımlıyorsanız standart kurucu metodunu tanımlamalısınız
  */
  //buranın amacı veritabanına başarılı bir şekilde girmek
  VeriTabaniIslemleri db = VeriTabaniIslemleri();
  bool sonuc = db.baglan();
  if (sonuc) {
    print("Bağlandım");
  } else {
    print("hatalı bağlantı");
  }

  /*
  Çarşamba
***********************
  1)getter - setter
  2)OOP ile ilegili karma soruları çözücez
  3)Kalıtım
  4)Polimorfizm

  Perşembe
  ************
  1)Abstract sınıflar
  2)interface
  3)Static metod ve değişkenler
  4)final ve const
  5)Immutable sınıfları

  Cuma
  ***********
  1)Lambda
  2)Higher Order Fonksiyon
  3)Lexical Closure
  4)List sınıfını kullanmak
  5)Map metodlarını

  Pazartesi
  Hata Yönetimi

  Salı 
  Asenkron progralama

  Çarşamba
  Null Safety
  Genel bir örnek
  
  Kurs The End


  */
}
