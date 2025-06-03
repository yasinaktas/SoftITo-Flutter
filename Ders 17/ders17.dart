void main(List<String> args) {
  /*
  Static metod ve değişkenler:

  -Sınıflarımızda nesne üretmenden bazı değişkenlere ve metodlara erişmek isteyebiliriz. Burada karşımıza static kavramı çıkar.
  -Static kullanarak nesne değil sınıf değişkenleri ve metodlarına ulaşabiliriz.
  -Bir sınıfta tanımlanan metod ve değişkenlere erişirken mutlaka nesne üretmemiz gerekirdi. Ama biz bunları static tanımlarsak artık nesne üretmeden bu değerlere erişebilir ve kullanabiliriz. Artık nesnelerin değil sınıfın method ve değişkenlerine direk ulaşırız.
  -Static metotlar içinden nesneye özgü alanlara erişilmezken, nesneye özgü metod içinden static metotlara erişebiliriz.

  Örnek: Biz sınıfları oluştururken kurucu metod oluştururuz ve kullanıcıdan verileri alırız klasik yöntem:

  Kod:

  class Matematik {
  //instance variable(nesne değişkenleri)
  int birinciSayi = 0;
  int ikinciSayi = 0;

  Matematik(this.birinciSayi, this.ikinciSayi);

  //nesne metodları
  void topla() {
    print("toplam: $birinciSayi + $ikinciSayi = ${birinciSayi + ikinciSayi}");
  }

  //nesne metodları
  void cikar() {
    print("Çıkarım: $birinciSayi - $ikinciSayi = ${birinciSayi - ikinciSayi}");
  }
}

Main:
Matematik m1 = Matematik(15,20);
m1.topla(); //35
m1.cikar(); //-5

ben bu sınıf içerisine myPi adında bir değişken tanımlıyorum:

class Matematik {
  //instance variable(nesne değişkenleri)
  int birinciSayi = 0;
  int ikinciSayi = 0;
  double myPi = 3.14;
  }

  şimdi bu myPi değişkeninin toplama ile alakası yok çıkarma ile de alakası da yok birinci sayı ve ikinci sayı ile de alakası yok o zaman ben bu değişkeni çağırmak için niye m1 nesnesi üreteyim ki? Mantıksız. O yüzden ben bu değişkeni static olarak tanımlarım yani bu değişkenia artık nesne değişkeni değil de sınıf değişkeni yapmış olurum.

    static double myPi = 3.14;

     artık bu değişkenin çağrılmak için nesne oluşturulmasına gerek yok artık direk çağrılabilir.

     print(Matematik.myPi);

     Her nesne bellekte bir yer oluşturur ve orayı referans gösterir. ve bu kutucuğun içerisinde o nesneye ait değişken ya da metodlar olur. 

     static değişken ise ram de bir yer oluşturur kullanılmak için bir nesneye ihtiyacı yoktur direk sınıf yardımı ile çağrılabilir.

     Benim metodun adı bilgisini almam için sayı bir ve sayı ikiye ihtyacım yok ki. kullanıcıdan bunları niye istiyeyim. o yüzden bu metodu static yapmam lazım.

      static void sinifAdiSoyle() {
    print("Ben matematik sınıfıyım");
  }

   Matematik.sinifAdiSoyle();

   şeklinde çağırırım

   -static metod ya da değişkenlere nesne yardımı ile ulaşamazsınız yani
   m1.sinifaAdiSoyle() derseniz hata alırsınız.

   ben sınıfta şöyle bir değişken oluşturuyorum:

    int toplamIslemSayisi = 0;

    Bunun amacı bu sınıfta topla ya da cikar çağrıldık.a artacak yani topla ve cikar metodlarında şu kodu ekledim:

    toplamIslemSayisi++;

    haliyle ne kadar çağrılırsa artması gerekiyor:

     Matematik m1 = Matematik(15, 20);
  m1.topla();
  m1.cikar();
  m1.topla();
  m1.cikar();

 print("Toplam işlem sayisi: ${m1.toplamIslemSayisi}");

  şunu yaptığım için ekranda 4 yazmalı ama ben buna ulaşmak için m1 ya da m2 nesnesi ile ulaşmalıyım şuan için. Şuan ekrana 4 yazıyor sorun yok ama ben alttaki kodu eklediğimde yine 4 yazıyor sıkıntı

    Matematik m2 = Matematik(35, 50);
  m2.topla();
  m2.cikar();

  çünkü bu değişken sınıf değil nesne değişkeni yani m1 den çağırdığımız için sadece m1 in topla ve cikarmasını sayıyor 

  eğer yukarıdaki print i m2 ile yazarsak:

   print("Toplam işlem sayisi: ${m2.toplamIslemSayisi}");

   ben metodları iki kere çağırdığım için ekrana 2 yazacaktır.

   Çünkü bunlar nesne değişkeni bu değişkeni sınıf değişkeni yapmak gerekiyor. Çünkü static değişkenler nesneye bağlı olmadığı için sıfırlanmayacak. static değişkenler silinmez program kapatılana kadar. 

   O yüzden biz bunu static yapmalıyız. o zaman kodu şu şekilde değiştirip deniyoruz:


   static int toplamIslemSayisi = 0;

   print kısmınıda şu şekilde değiştirdiğimde sonucu 6 yan doğru olanı gördüm:

   print("Toplam işlem sayisi: ${Matematik.toplamIslemSayisi}");

  Benim bu değişkenim nesne değil sınıf değişkeni olduğu için artık nesne hareketlerini değil sınıf hareketlerini takip ediyor o yüzden herşeye hakim


  benim nesne değişkenlerim CIA yani sadece ABD de deki işlemlere ulaşabiliyor ama sınıf değişkeni FBI yani dünya daki her olaya el atabiliyor. CIA ABD dışına çıktığında siliniyor FBI ise sürekli var oluyor bu yüzde ram açısından dikkat edilmesi gereken bir durum olduğu için static yaparken mantıklı düşünmeliyiz her değişkeni static yapmamalısınız mantık önemli. 

  Kurallar

  static metod içerisinde nesne değişkenine ulaşamazsınız. static metod içerisinde sadece static değişkenleri çağırabilirsiniz:

  class Matematik {
  //instance variable(nesne değişkenleri)
  int birinciSayi = 0;
  int ikinciSayi = 0;
  static int toplamIslemSayisi = 0;

 static void sinifAdiSoyle() {
    print("Ben matematik sınıfıyım");
    birinciSayi = 5;//hata ulaşamazsın
    toplamIslemSayisi = 5;//ulaşabilirsin
  }


  }

  normal bir metod yani nesne metodunun içerisinde static değişken ya da metodlara ulaşabilirim. Çünkü static olanlar kesindir vardır o yüzden hata alınmaz

  //nesne metodları
  void topla() {
    toplamIslemSayisi++;//sınıf değişkenine ulaşabilirim
    print("toplam: $birinciSayi + $ikinciSayi = ${birinciSayi + ikinciSayi}");
  }


 void cikar() {
    toplamIslemSayisi++;
    print("Çıkarım: $birinciSayi - $ikinciSayi = ${birinciSayi - ikinciSayi}");

    sinifAdiSoyle();//static metoda nesne metodu içerisinde ulaşabilirim
  }

  Static Genel Tekrar:

  1)static demek sınıf demektir. Yani nesneden bağımsız sınıfa ait anlamına gelir.
  2)Bir değişkenin ya da metodun static olması için başına static keyword ü eklenir

  static int healt = 0;
  static void atesEt(){
  }

  3)Bizler sınıf içerisine tanımlanmış normal değişkenlere ulaşmak için o sınıftan nesne oluşturmamız gerekiyor (Sınıf_adi nesne_adi = Sinif_adi);

  4)Ama bazı durumlarda benim nesne oluşturmadan metod ya da değişkenleri çağırma ihtiyacım olabilir. hocam niye olsun ki? Çünkü biz nesne oluştururken yüzde 99 kullanıcıdan veri alırız yani kurucu metodunda veri alma işlemi vardır. O yüzden bana bazen kullanıcıdan veri almak değil o sınıftaki değişken ya da metoda direk ulaşmak isteyebilirim işte bu yüzden static var.

  5)Static değişken ya da metodlar sınıf içerisinde oluştuğu için program kapatılana kadar silinmezler yani her yerden ulaşılabilir ve kullanılabilirdir ve bu değişkenler sınıf içerisindeki her hareketi takipm ettiği için biz bunları çağırdığımızda sınıf içerisinde görevlendirdiğimiz her haberi bize verir. Yukarıdaki m1.toplamDeğişken ifadesinin bize sadece m1 ile ilgili bilgiyi vermesi gibi ama ben tüm değişkenleri saymasını istiyordum m2 ya da m3 ile oluşan değişkenleri bana vermedi. Ama ben bu değişkeni static yaptığım an her nesne de oluşan değişkeni bana verdi.

  6)Örnek mesela ben canSayisini genel kod dosyasında ihyacım var ama ekrana sağ üste canSayisi nı da yazdırmalıyımm Normal kod dosyası bana atesEt ol gibi metodları kontrol ettiğim kod dosyası iken canvas dosyası sadece user interface yani tasarım ile ilgi bir kod dosyası. Can başlangıçta 100 olduğu için tasarım dosyasında nesne oluşturursam sıfırdan oluşacağı için ekranda yüz yazar. ama benim yaralandığım bir durum oldu için aslında benim canım 70 ama orda nesneyi sıfırdan oluşturduğu için 100 gelir. işte an değişkenini static tanımlamalıyız nesne oluşturma ihtiyacım olmasın yani değişken sıfırlanmasın ekranda 70 yazsın.

  Yada sepet örneğinde olduğu gibi sepete ürünleri ekledim ana sayfaya döndüğümde sağ üst köşede sepet iconun üzerinde sepetürün sayısını yazdırmak istiyorsam eğer nesne değişkeni yaptıysam ana sayfaya geçtiğimde sıfırlanır çünkü nesneyi baştan oluşturmalıyım ki kullanayım ama ben sepeti ekle dosyasında static yaptıysam her yerde o içindeki veri geleceği için sepet 3 yazar.


  -----------------------------------------------------------
  Immutaable Kavramı(Değişmez):

  Değişmez anlamına gelir. Dart dilinde bu yapı finale ve const kavramları ile sağlanır. 

  Bir örnek oluşturursak ben aşağıdaki değişkeni değiştirebilirim:
  var ad = "Bilal";
  ad = "Ahmet";

  Ben var str; Sınıftada bir alan oluşuyor içi boş. Ben buna Bilal dediğim an o kutu doluyor. Ama dikkat ad değil ad in işaret ettiği yani refere ettiği kutucuk doluyor Bilal ile. sonra ben ad ı çağırdığımda bu kutu reeferans edildiği için ekrana Bilal yazıyor. Ama ben bunu değiştirip ad = "Ahmet" dediğim an yeni bir kutu oluşuyor içerisinde Ahmet var bu sefer artık ad değişkeni o yeni kutuyu refere ediyor. Bilal yazan kutu da darttaki çöp toplaycı sistemi tarafından siliniyor.

  final:

  tanımlanırken değişken tipi yazılmadan tanımlanabilir:

  final city = "İstanbul";

  her türlü değişken tipi verilerek tanımlanabilir:

  final int yas = 17;
  final String adim = "Bilal";
  final double maas = 27.5;
  final bool isMArried = false;

  ama var ile tanımlanamaz:

  final var name = "Süleyman";

  final ın diğer bir özelliği tanımladığın değer değiştirilemez bu değişken içerisindeki veri sürekli bu değişkende taşınacak.

   final double myPi = 3.14;
   myPi = 3;//hata

   final gibi const de sabit değişken oluşturmaya yarar. Ama biz dartta daha çok const değil final kullanıyoruz:

  const String sirketBaslik = "Karademir Company";
  sirketBaslik = "Ahmet Company";

  Eğer bellek dostu bir kod yazmak istiyorsanız bu değişken tanımlama şekileri önemli eğer bir değişken sürekli aynı değeri taşıyacaksa bunları sabit olarak tanımlamak bellek açısından iyi olacaktır. 



  //final ile const un hangisini nerede ne ne zaman kullanacağımızı bilmek için : final değerleri run time yani çağırdıktan sonra yani ekrana bişeylerde geldikten sonra oluşturulur. yani ramdeki yeri çalışacağı an oluşturulur. Ama const değişkeni o değişkeni tanımladığınız anda ramde oluşturulur. Yani mesela bizim final tanımladığımız değişken butona basılırsa çağrılıyor ramda ama const butona basılsa da basılmasa da ram de yerini ayarlamıştır. yani final daha performanslıdır.

  const sayi = 5; //compile time
  final sayi2 = 7;//run time yani çalışma zamanında

   final tarih = DateTime.now();//uygulama çalıştıktan sonra çağırabilir.Bu çağırabilir
  const tarih2 = DateTime.now();//Yahu daha uygulama çalışmadı ben sınıfıma gidip o bilgiyi alamadım ki alabilmem için uygulama çalışmalı o yüzden hata veriyor.

 

  final tarih = DateTime.now();//uygulama çalıştıktan sonra çağırabilir.Bu çağırabilir
  const tarih2 = DateTime.now();//Yahu daha uygulama çalışmadı ben sınıfıma gidip o bilgiyi alamadım ki alabilmem için uygulama çalışmalı o yüzden hata veriyor.

  Örnek internetten veri çekiyoruz. İnternetten veriyi ne zaman çekeriz uygulama çalışacaktır önce ekrana görüntü elemanları gelecek sonra internetten veri gelecektir. o yüzden bu tür değişkenler final ile tanımlanır.


   final liste = [1, 2, 3];
  final liste2 = [1, 2, 3];

  liste.add(5);
  liste.removeAt(3);
  //bir listeyi final atamak demek içine veri eklenmeyecek anlamına gelmiyor. Burdaki final ın amacı bu listeye yeni bir liste değer ataması yapılamaz. 

  //liste = liste2; bunu yapamazsınız. yoksa ekleme silme güncellem işlemlerini yapabilirsiniz içinde değiştirmek ile yeni bir değer atamak aynı şey değildir.


  final liste = [1, 2, 3];
  final liste2 = [1, 2, 3];

  eşit mi kontrolü yaparsak eşit değildir çünkü çalışma anında çalıştığı için çalıştıktan bu kontrolü sağlayabilir ve değişme ihtimali var diye eşit değil der


    const liste = [1, 2];
  const liste2 = [1, 2];

  if (liste2 == liste) {
    print("Eşit");
  }else{
    print("Eşit değil");
  }

  Sonuç eşit çıkar çünkü daha uygulama çalışmadan baktığı için eşit olduğunu anlar.
  Diğer bir fark artık bu liste compile zamanında oluşturulduğu için çalışma zamanında içeriği bile değiştirilemez.

   const liste = [1, 2];
   const liste2 = [1, 2];
   liste.add(7);//Hata

   */

  const liste = [1, 2];
  const liste2 = [1, 2];
  liste.add(7);//Hata

  if (liste2 == liste) {
    print("Eşit");
  } else {
    print("Eşit değil");
  }
}
