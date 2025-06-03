import 'dart:math';

import 'cemberdaire.dart';
import 'ogrenci.dart';

void main(List<String> args) {
  /*getter - setter :

   Musteri m1 = Musteri(123);

  Musteri m2 = Musteri(-199);

  //adam gitti eksi bir sayı girdi bu kabul edilemez. normalde bu zamana kadar öğrendiğimiz kontrollerden if yapabiliriz.Ama düşünün biz bu müşteriden 50 tane oluşturucaz. o zaman main içinde 50 kere bu kontrol olacak. nesne oluşuyor kontrolünü yapıyoruz. çünkü veriyi kurucu metod ile alıyoruz. ram de nesne oluşmuş oluyor ve bu kontrol için bir veri çalışması oluyor bu hem programımızı yorar hemde ram alanı açısından olumsuz bir durum. Biz bu nesne oluşturulmadan kontrolü yaparsak adamın girdiği müşteri numarası uygunsa o zaman veriyi döndür diyebiliriz ve bu sağlıklı olandır.

   //adamın müşteri numarasını değiştirebilmesi de sıkıntı eğer yetkisi yoksa değiştirme yapamaması gerekiyor bu da sıkıntı

  m2.musteriNo = 205;

  //Bu ulaşamamasını nasıl çözüyordum? bu değişkeni private yaparak. o zaman müşteri sınıfında şu değişikliği yapmalıyım:

  int? _musteriNo; //sınıf değişkeni
  //bu sınıftan nesne oluşturacak bir alanda mutlaka bu bilgi girilmeli
  Musteri(this._musteriNo);

  Artık değiştirilemez.

  setter metodun en önemli farkı tanımlanırken başına set keyword unu koyuyoruz. ikinci metottan farkı hem bunun bir setter yani değer atama metodu olduğunu anlamış oluyoruz hem de setterlar kontrol edilebilen metotlar olduğu için _ çizgi yani private metoda döndürmek zorunda değiliz. üçüncü olarak değer ataması değişken gibi yapılır yani ( buraya veri verilmez de) metod a = ile değer ataması yapılır.

   m1.musteriNoAta = 450;
}

getter: veriyi okumak için kullanılır. Getter metod gibi değildir yani () parantezleri yoktur yani parametre alamaz. mutlaka bir değer döndürmeli yani void olamaz. Amacı setter dan gelen veriyi okumaktır.

  String get musteriyiSoyle{
  return "Musteri no: $_musteriNo";
  }

  //Deneme amaçlı nesnemizi oluşturalım
  Musteri m1 = Musteri(120);
  //müsteri numarasını adam değiştirebilecek yani sadece kurucu metoda bağlı kalmayacak adam.
  m1.musteriNoAta = 750;
  String sonuc = m1.musteriNoSoyle;
  print(sonuc);
  //m1.bilgeriYazdir();


  //Ornek CemberDaire isimli bir sınıf oluşturucaz. Bu sınıfın yarıcap alan kurucusu olmalı. Ayrıca cevre ve alanını hesaplayan metotları olmalı (Pi sayısı 3,14 alalım kullanıcının pi sayısını kafasına göre girmesine izin vermicez)

  1)cemberDaire.dart adında bir dosya oluşturdum.
  2)O dosyanın içerisine aynı isimli bir sınıf oluşturdum:

  class CemberDaire {}

  3)Bu sınıf içerisine iki tane değişken oluşturdum:

  class CemberDaire {
  int _yariCap = 1;
  double _pi = 3.14; 
}

4)kullanıcı yarıçap ile direk muhattap olmasın ve ileride yapacağım 1 den kücük değer vermesine izin vermemek için de private yaptım

5)pi sayısını da private yapmamın nedeni asla değiştirilemez olması için yani adam buna ulaşıp kafasına göre c1.pi = 3; diyemesin

6)CemberDaire sınıfında bir kurucu metot oluşturduk:

  CemberDaire(this._yariCap);

  ama eğer veriyi bu şekilde alırsak adam main tarafında veriyi istediği gibi girebilir:

CemberDaire c1 = CemberDaire(-50);

bu bizim istemediğimiz bir durum

7)Yukarı durum yüzünden sınıfımız içerisinde set metodunu oluşturuyoruz:

 void set yariCapKontrol(int deger) {
    if (deger > 0) {
      _yariCap = deger;
    } else {
      _yariCap = 1;
    }
  }
  bu metod bize: Set ile yarıçapın sıfırdan büyük olup olmama durumunu kontrol ettik. Eğer 0 dan büyükse gelen değeri _yarıcap değişkenine verdik küçük ise varsayılan olarak _yarıcap değişkenini 1 yaptık bize kontrol sağladı ama biz bu set i hiçbir yerde kullanmadık. 

  8)Bu durumda kurucu metotu şu şekilde değiştireceğiz:

 CemberDaire(int yariCap) {
    yariCapKontrol = yariCap;
  }

  Bunu yaparak artık kullanıcı dire _yariCap a ulaşamıyor bana yariCap diye bir değer gönderiyor(satır 79) ve ben bunu set metotuna gönderiyor

  9)cevre ve alan hesaplamayla ilgili iki tane metot oluşturdum:



  //double döndüren bir cevreHesapla Metotu oluşturuyorum

  double cevreHesapla() {
    return 2 * _pi * _yariCap; //Çember çevre 2 pi r dir.
  }
  //double döndüren bir alan hesaplama Metotu oluşturuyorum
  double alanHesapla() {
    return _pi * _yariCap * _yariCap;//Çember alan pi r karedir
  }

  10)Başka bir sorunumuz main kısmında nesne_adi. dediğimiz an set metotumuz görünüyor. Görünmemeli çünkü set in görevi sınıf içerisinde asla dışarıdan çağrılmayacak onun göre kurucu metota gelen değerin kontrolünü yaparak private olan _yariCap değişkeninin değerini belirlemek. Bu yüzden setter metodunun başına _ koyarak private metot yapıyorum.

  void set _yariCapKontrol(int deger) { 

  hata almamak için kurucu metod içerisindeki yere de _ koydum

  11)Mainde bu fonksiyonları çağırıyoruz:

  Geçersiz değer için: 

  CemberDaire c1 = CemberDaire(-50);
  print("Alan: ${c1.alanHesapla()}");// pi * r *r = 3.14 * 1 * 1 = 3.14
  print("Çevre: ${c1.cevreHesapla()}");//2*pi*r = 2*3.14*1 = 6.28

  Geçerli bir değer için ise:

  CemberDaire c1 = CemberDaire(100);
  print("Alan: ${c1.alanHesapla()}"); // pi * r *r = 3.14 * 10 * 10 = 31400
  print("Çevre: ${c1.cevreHesapla()}"); //2*pi*r = 2*3.14*10 = 628



  Öğrenci isimli bir sınıf oluşturun. Bu sınıfta öğrencinin id si ve not değeri olsun. 100 elemanlı bir listede id ve not değerlerini rastgele oluşturarak bu öğrencileri saklayalım ve bu öğrencileri yazdıralım metot ile 

  1)Ogrenci adında bir dosya oluşturduk. bu dosya içerisine Ogrenci adlı bir sınıf ekledik. 

  class Ogrenci{
  
}

  2)Sonrada iki tane private değişken oluşturuyoruz: ilk değer ve ? koymadığım için bana kızacak ama sorun değil:
  int _id;
  int _notDegeri;

  3)Ben bunu isimlendirilmiş parametre ile yaparsam aşağıdaki kod çalışmaz çünkü isimlendirilmiş parametreler _ ile başlayamaz diyor program

    int _id;
  int _notDegeri;
  Ogrenci({this._id = 1, this._notDegeri});

  4)Ben _ kaldırıyorum:
  Ben bu örnekte daha çok diğer öğretilerimizi tekrar etmek amaçlı yapıcam.Aşağıdaki değişiklikleri yapıyorum:
  int id;
  int notDegeri;
  Ogrenci({this.id = 0, this.notDegeri = 0});

  5)Main de bir nesne oluşturup değerlerini veriyorum:

  Ogrenci ogr1 = Ogrenci(id: 12, notDegeri: 25);

  6)Bir tane tüm öğrenciler listesi adında bir liste oluşturdum bunun eleman sayısı 100 olduğu için sabit liste kullanıyorum ama bu liste öğrencileri tutacağı için türü Ogrenci olmalı bu yüzden içeriside Ogrenci ile dolmalı o yüzden varsayılan değerleri atamıştık

List<Ogrenci> tumOgrenciler = List.filled(100, Ogrenci());

7)Daha sonra bu Ogrencilerin içini rastgele dolduracağımız için bir fonksiyon oluşturuyoruz:

void ogrenciListesiniDoldur() {

}

8)Daha sonra bu listeyi doldurma görevi bu fonksiyonda olduğu için bu listeye erişebilmeliyiz ama şuan bu mümkün değil bu yüzden oluşturduğumuz fonksiyona bir liste parametresi veriyoruz:

void ogrenciListesiniDoldur(List<Ogrenci> liste) {
  
}

ve main içerisinde çağırırken mainde oluşturduğumuz tumOgrenciler listesini bu metota parametre olarak gönderiyoruz:

ogrenciListesiniDoldur(tumOgrenciler);

9)bu listeyi dolduran fonksiyon içerisini şu şekilde düzenliyoruz bir for ile 100 kez dönüp öğrenci id ve not değerini random ile alıyoruz:

void ogrenciListesiniDoldur(List<Ogrenci> liste) {
  for (int i = 0; i < liste.length; i++) {
    liste[i] = Ogrenci(
      id: Random().nextInt(1000),
      notDegeri: Random().nextInt(101),
    );
  }
}

10)Sonrada bu değerleri yazdırmak için main içerisine şu kodu yazıyoruz:


int sayac = 0;
  for (Ogrenci ogr in tumOgrenciler) {
    sayac++;
    print("****** $sayac.öğrenci ********");
    print("Öğrenci id: ${ogr.id} - öğrenci not: ${ogr.notDegeri}");
  }

  Eğer sadece ogr olarak yazdırmak istersek yani main:
 for (Ogrenci ogr in tumOgrenciler) {
    print(ogr);
  }
  İnstance of Ogrenci hatası alıyorduk. bu hatayı düzeltmek içimn her sınıfın kendine has toString metodu vardır. class içerisinde to yazdığınızda çıkan toString kısmına tıklarsanız şöyle bir hazır metod gelecektir:

   @override
  String toString() {
    // \TODO: implement toString
    return super.toString();
  }

  Bunun içerindeki \TODO ile başlayan yorum satırını siliyorum ve return içindeki yazıyı şöyle düzeltiyorum:

  return "ID: $id NotDeğeri: $notDegeri";

  çalıştırdığımda artık bu şekilde ekrana yazdığını görüyorum.




  Örnek:

  //Yukarıdaki örnekte şunları değiştir: Bu öğrenci sayısını 10 a düşürün ve bu 10 tane öğrencinin not ortalamasını ekrana yazdıracak şekilde düzenleyin. 
  Main:

  Ogrenci ogr1 = Ogrenci(id: 12, notDegeri: 25);
  List<Ogrenci> tumOgrenciler = List.filled(10, Ogrenci());

  ogrenciListesiniDoldur(tumOgrenciler);

  print("****** Öğrenci Listesi ******");
  for (Ogrenci ogr in tumOgrenciler) {
    print(ogr);
  }

  print("****** Öğrenci Ortalaması ******");
  ortalamaBul(tumOgrenciler);

  main dışı:

  void ortalamaBul(List<Ogrenci> ogrenciList) {
  double toplam = 0;
  for (Ogrenci ogr in ogrenciList) {
    toplam += ogr.notDegeri;
  }
  print("toplam deger : $toplam değeri : ${toplam / ogrenciList.length}");
}

void ogrenciListesiniDoldur(List<Ogrenci> liste) {
  for (int i = 0; i < liste.length; i++) {
    liste[i] = Ogrenci(
      id: Random().nextInt(1000),
      notDegeri: Random().nextInt(101),
    );
  }
}

    //Kullanıcılar sisteme ad-soyad, kullanıcı adı, mail ve şifreleri ile kayıt olsun.Özellikle kullanıcı adı, şifre ve mail boş kalmasın, ad-soyad kısmı 6 karakterden az olmasın ve tabi boş kalmasın. Kullanıcı bilgilerini doğru girdiyse bir listeye eklensin. ekranda giriş yapmak için 1' e şifreni unuttuysan 2 ye tıklayın desin.

    Eğer 1 e basarsa kullanıcı adı ve şifre alın. ve listede böyle bir kullanıcı varsa Hoşgeldiniz Bilal Karademir desin eğer 2 ye basarsa kullanıcıya mail adresinizi giriniz yazsın eğer mail adresi doğru ise kullanıcının karşısına şifresi yazılsın. 

    1 Kullanici adında sınıf oluştur.
    2 değişkenler oluştur hepsi private olsun
    3 kontrollere dıkkat et direk kurucudan alamazsın :)
    4 her işlem bir metod olsun.
    5 kontrol de set cagırmada get olduğunu unutma

  --------------- KALITIM -------------------------
  Daha iyi anlayın diye ayrı bir dosyada değil tek dosyada çalışıcam. 
  iki kullanıcı türümüz olacak normal kullanıcı ve admin kullanıcımızı olsun. 

  Normal kullanıcı sınıfı:

  class NormalUser {
  String email = "";
  String password = "";

  void girisYap() {
    print("Normal user giriş yaptım");
  }
}

Admin kullanıcı sınıfı:

class AdminUser {
  String email = "";
  String password = "";

  void girisYap() {
    print("Normal user giriş yaptım");
  }

  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı 20");
  }
}

değişkenler ve giriş yap metodumuz ortak olduğu için ve kod tekrarı olduğu için bu iki sınıfı User adlı bir sınıftan kalıtım aldırabiliriz. Öncelikle user adında bir sınıf oluşturup ortak özellikleri bu sınıfa taşıyalım:

User sınıfı:
class User {
  String email = "";
  String password = "";

  void girisYap() {
    print("Normal user giriş yaptım");
  }
}

  Daha sonra normal user sınıfındaki herşeyi silelim.

  admin user da ki kullanıcı sayısını veren metod hariç diğerlerini silelim.

  normal User sınıfına da has bir metod olması için davet et adında bir metotta tanımlayalım:

   void davetEt() {
    print("Normal ser arkadaşlarını davet etti");
  }


son durumda normal user ve admin user sınıfları şu şekildedir:


class NormalUser {
  void davetEt() {
    print("Normal ser arkadaşlarını davet etti");
  }
}

class AdminUser {
  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı 20");
  }
}

  Bu iki sınıfı kalıtım yaptığımız an o değişken ve metotları kullanabileceğiz. bir sınıfı başka bir sınıftan kalıtım yapabilmek için kalıtım almak isteyen alt sınıfı extends keyword ü eklenmelidir. yani son durumda admin user ve normal user sınıfları:


class NormalUser extends User{
  void davetEt() {
    print("Normal ser arkadaşlarını davet etti");
  }
}

class AdminUser extends User{
  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı 20");
  }
}

Bir tane de normal user dan türüyen bir sınıf daha oluşturduk:

class sadeceOkuyabilenNormalUser extends NormalUser {
  void sadeceOku() {
    print("ben sadece okuyabilirim");
  }
}

Eğer ben main de bir user oluşturursam haliyle mail ve diğer özelliklere ulaşırım hemde kendine has özelliklere ulaşırım: 

  NormalUser normal1 = NormalUser();
  normal1.davetEt();
  normal1.email = "bilal.karademir@hotmail.com";

  aynı şekilde diğerlerinde de ortak özelliklere ve 

  AdminUser admin1 = AdminUser();
  admin1.email = "admin@admin.com";
  admin1.toplamKullaniciSayisiniGoster();

   SadeceOkuyabilenNormalUser sadece1 = SadeceOkuyabilenNormalUser();
  sadece1.email = "sadece@sadece.com";
  sadece1.sadeceOku();


  NormalUser normal1 = NormalUser();
  normal1.girisYap(); 
  //sonuc : user giriş yaptı
  
  User ana sınıfımızda oluşturduğumuz giriş yap metodu ekrana user giriş yaptı yazdırıyor bu istediğimiz bir durum değil ben bunu normal user da farklı bir mesaj olarak vermek istiyorum. normal user giriş yaptı mesajı yayınlansın.

  Normal User sınıfına gelip gi yazdığınızda çıkan girisYap a tıklarsanız otomatik olarak size şu metodu oluşturacak:


   @override
  void girisYap() {
    // TODO: implement girisYap
    super.girisYap();
  }
  işte burda @override keyword şu demek bu metot üst sınıfta var sen bunu ezmek istiyorsun diye bana bilgi veriyor. Bende evet diyorum içini temizleyip istediğim yazıyı yazıyorum:

   @override
  void girisYap() {
    print("Normal user giriş yaptı");
  }

  Yani üst sınıfta tanımlı olan metodu değiştirmiş oldum.
   
   Eğer şimdi çağırırsak ekranda istediğimiz yazı yazacaktır.
   aynı zamanda sadece okuyabilenin bir üstü normalUser olduğu için artık bunun girişyap metodu etkilendi. tek kod ile.

  SadeceOkuyabilenNormalUser sadece1 = SadeceOkuyabilenNormalUser();
  sadece1.girisYap();

  Admin ve sadece sınıflarında override işlemini yaptım:

  class SadeceOkuyabilenNormalUser extends NormalUser {
  void sadeceOku() {
    print("ben sadece okuyabilirim");
  }

  @override
  void girisYap() {
    print("Sadece okuyabilen normal user giriş yaptı");
  }
}

class AdminUser extends User {
  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı 20");
  }

  @override
  void girisYap() {
    print("Admin user giriş yaptı");
  }
}

sonra çağırdığımızda ekrana kendilerine özgü mesaj geldiğini gördük:

  AdminUser admin1 = AdminUser();
  admin1.girisYap();
  SadeceOkuyabilenNormalUser sadece1 = SadeceOkuyabilenNormalUser();
  sadece1.girisYap();   


genel Kod:



class User {
  String email = "";
  String password = "";
  void girisYap() {
    print("user giriş yaptım");
  }
}

class NormalUser extends User {
  void davetEt() {
    print("Normal user arkadaşlarını davet etti");
  }

  @override
  void girisYap() {
    print("Normal user giriş yaptı");
  }
}

class SadeceOkuyabilenNormalUser extends NormalUser {
  void sadeceOku() {
    print("ben sadece okuyabilirim");
  }
  @override
  void girisYap() {
    print("Sadece okuyabilen normal user giriş yaptı");
  }
}

class AdminUser extends User {
  void toplamKullaniciSayisiniGoster() {
    print("Toplam kullanıcı sayısı 20");
  }

  @override
  void girisYap() {
    print("Admin user giriş yaptı");
  }
}

Main :

 AdminUser admin1 = AdminUser();
  admin1.girisYap();
  SadeceOkuyabilenNormalUser sadece1 = SadeceOkuyabilenNormalUser();
  sadece1.girisYap();

-----------------------------------------------
    Ana Sınıf
    en 4 tane ortak değişen ve en az iki tane ortak metot

    Alt Sınıf
    bunun kendine ait bir metodu olsun
    override

    Alt Sınıf 
    bunun kendine ait bir metodu olsun
    override
    */

 
}
