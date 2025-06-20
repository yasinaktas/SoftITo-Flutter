import 'dart:io';

//lexical variable scope
void main(List<String> args) {
  /*
 Immutable Sınıf Oluşturma:
 Biz bunlar immutable data sınıfları diyoruz.
 immuttable değişmez anlamına geliyor.
 flutter da mesela intenetten haberleri çekiyorsak haberler adında bir model(sınıf) oluşturucaz. Bunların değişmez olması hem performans açısından hemde güvenlik açısından önemli.

 Şimdi gelin bir örnek ile açıklayalım Student adında bir sınıf oluşturuyorum:

 class Student{
  
}

normalde bunun içerisine değişkenleri nasıl oluşturuyordum:
int id
String isim; şeklinde.

Sonra kurucu oluşturup bu verileri oradan alıyorduk:

 Student(this.id, this.isim);

 Burdaki sıkıntı şu :

  Student bilal = Student(1, "Bilal");
  bilal.id = 17;

  ben bu id yi değiştirebiliyorum.Ben bunu yapamam gerekiyor. program bilmeli ki bu öğrenci id si 1 adı Bilal olan bir öğrenci. Bu bir kere atanacak bir daha değiştirilememesi gerekiyor. 

  Biz ne öğrenmiştik final kavramını öğrenmiştik biz değişkenlerimizi eğer bir model oluşturuyorsak final ile değişken tanımlamalıyız. Şu değişikliği yapıyorum:

   final int id;
  final String isim;

  Ben bunu yapınca artık şu kod kızıyor:

   Student bilal = Student(1, "Bilal");
  bilal.id = 17;//hata çünkü artık bunun değeri bir kere alınır bir daha farklı değer alamaz. 

  Student bilal = Student(1, "Bilal");
  Student bilal2 = Student(1, "Bilal");
  if (bilal == bilal2) {
    print("eşit");
  } else {
    print("eşit değil");
  }

  Sonuç eşit değil çıkacak çünkü bunlara aynı değeri atasakta bunlar farklı nesneler o yüzden farklı alanları refere ederler. 

  Ama ben bir nesneyi değiştirmek istiyorsam şu şekilde değiştirebilirim çünkü bu direk değer atamak değil de ona aslında var olan kutusundaki değeri değiştirmek ya da yeni bir kutuyu göstermek oluyor. Yani ben değişkene ulaşıp değerini değiştirmeye engel oldum ama kurucu metodu ile değer göndermek hala serbest

  bilal = Student(6, "bilal3"); //hata vermez

  eğer bir nesne aynı değerlere sahipse niye iki tane kutu oluştursun ki bellekte boşuna yer kaplıyor eğer aynı değelere sahipse tek kutu olsun amacımız da bu zaten.

  Bunun için bu kurucudan değer alma durumunu da kontrol etmemiz lazım bunun için kurucu metodu şu şekilde değiştiriyoruz:

   const Student(this.id, this.isim);

   Bunu yaptığımda yetmiyor sonra sınıf tanımlarkende eğer aynı değerler geliyorsa başlarına const konmalıdır:

  const Student bilal = Student(1, "Bilal");
  const Student bilal2 = Student(1, "Bilal");

  hatta bunların artık herşeyleri aynıdır. Yani aynı içerikli nesne oluşturuluyorsa artık bunlar aslında aynı kutuyu gösteriyor yani içerik kontrol edildi ve aynı olduğu için artık bu nesneler aynı yeri refere ediyor.

  Birde bunun farklı tanımlama yolu da var bunu da görebilirsiniz:

   final Student bilal2 = const Student(1, "Bilal");

   Başka bir tanımlama şeklinde:

   var bilal3 = const Student(1, "Bilal");

  Kod:

  class Student {
  final int id;
  final String isim;
  //const olmadan
  const Student(this.id, this.isim);
}

Main:

const Student bilal = Student(1, "Bilal");
  const Student bilal2 = Student(1, "Bilal");
  var bilal3 = const Student(1, "Bilal");

  if (bilal2 == bilal3) {
    print("eşit");
  } else {
    print("eşit değil");
  }

  Lambda : İsimsiz fonksiyon kavramını öğrenelim. Dartta her fonksiyon aslında bir nesnedir.

  Öncelikle normal bir fonksiyon tanımlayalım:
  Burda ne var geri dönüş değeri var (void) ismi var (sayilariTopla) birde neyi var parametreleri var(a ve b)
  //Normal fonksiyon
  void sayilariTopla(int a, int b) {
  int toplam = a + b;
  print(toplam);

  peki biz bunları isimlendirmeden yani ismi olmadan da birebir aynısını oluşturabiliriz:

   (int a, int b) {
    int toplam = a + b;
    print(toplam);
  };

  ama bunu bir değişkene atamamız gerekiyor. 

  var fonksiyon1 = (int a, int b) {
    int toplam = a + b;
    print(toplam);
  };

  bir veri türü var adı var ama bu nesneye biz bir değer atamadıkta fonksiyon atadık. Eğer üzerine gelirsek fonksiyon1 artık Function türünde bir sınıf aslında. 

   Function fonksiyon1 = (int a, int b) {
    int toplam = a + b;
    print(toplam);
  };

  Çünkü artık bu da o türden bir nesnedir.Peki biz bunu nasıl çağırıcaz?

  print(fonksiyon1);
  Ben şu şekilde çağırırsam bana bu bir iki tane parametre alan null döndüren bir fonksiyondur der.


  Şu şekilde de çağırırsam bir hata alırım çünkü parametreyi vermedim.
  fonksiyon1();

  Doğru çağrılma yöntemi şudur: fonksiyon1(5,8);
  ekrana 13 yazar

  Peki normal fonksiyondan farkı nedir. Eğer biz parametreleri vermesek bu fonksiyon bize bağırırdık parametrelerim nerde diye ama bu arkadaş bu hatayı compiler ederken değil run time çalışma zamanında fırlattı.

  Bu fonksiyon return eden bir fonksiyon olmamasına rağmen ben bunu bir değişkene atayabildim normalde değer döndürmeyen fonksiyonları bir değişkene atayamayız ama bunları atayabiliyoruz. Bunun başka bir güzelliğide bir fonksiyonu başka bir fonksiyona değer olarak atayabileceğiz.

  Demek ki isimi olmayan fonksiyon nasıl oluşturuluyormuş ad kısmını siliyoruz diğer yerler aynı.

  Genel kod:

   Function fonksiyon1 = (int a, int b) {
    int toplam = a + b;
    print(toplam);
  };

  fonksiyon1(8, 9);

  Başka bir örnek aşağıdaki fonksiyonu oluşturalım:

   (int s) => s * 2;

   Şuda diğer bir tanımlaması: 

   (int s2) {
    return s2 * 2;
  };

  isimsiz bir fonksiyonu kullanabilmek için mutlaka bir değişkene atamalıyız:

   var fonksiyon2 = (int s) => s * 2;

  var fonksiyon3 = (int s2) {
    return s2 * 2;
  };

  Bunu çağırırken şu şekilde çağırıyoruz:

  fonksiyon2();//hata alırız çünkü bu return eden bir isimsiz fonksiyon olduğu için mutlaka bana parametre ver diye bağırır şu şekilde düzeltiyoruz:

   print(fonksiyon2(5)); çalıştırdığımızda ekranda 10 yazacaktır

   Eğer var ile çağırıyorsanız sizden parametre ister hata verir ama Function yazarsanız çalışma anında hata verir.

  Function f1 = (int a, int b) {
    double bolum = a / b;
    print(bolum);
  };

  f1();//hata yok

   var f1 = (int a, int b) {
    double bolum = a / b;
    print(bolum);
  };

  f1();//hata var


var f2 = (String name) => "Merhaba $name";
  var sonuc = f2("Bilal");
  print(sonuc);

  Sonuç olarak bir fonksiyonu değişkene atayarak kullanmak istiyorsam isimsiz fonksiyon kullanırım. 


  Higher Order Funciton Kavramı: Bir fonksiyonu parametre olarak alan veya geriye fonksiyon döndüren fonksiyonlardır. 
  Her ikisi de yapabilir.

  Dart Nesne yönelimli programlama dili olmasına rağmen bazen fonksiyonel programlamanında özelliklerini taşır.

  Örnek yapalım daha iyi tanıyalım:

  Bir tanede liste tanımlayalım main içerisine:

  List<int> liste = [1, 2, 3];

  listenin daha öğrenmedik ama forEach diye bir metodu vardır. Kısaca bahsetmek gerekirse for in gibi çalışır o listenin içindeki elemanları dolaşır. bu fonksiyon tanımladığımızda içerisine bir fonksiyon ister işte bu higher order functions çünkü parametre olarak bir fonksiyon alıyor:

  List<int> liste = [1, 2, 3, 4]; 
  liste.forEach((int element) {
    print("Element $element")
  });

  Sonuc: Element 1 ... şeklinde

  bu fonksiyon başka bir fonksiyonu parametre aldığı için örneğimizdir.

  Tabi bu illa isimsiz fonksiyon olmak zorunda değildir. Şimdi de o örneği yapalım Aşağıdaki fonksiyonu oluşturuyorum bu foreach in içine aldığı fonksiyonun aynısını yazıyorum:

  void callback(int element) {
  print("Element $element");
}

ve foreach içerisinde bunu çağırıyorum:

 List<int> liste = [1, 2, 3, 4];
  liste.forEach(callback);

  çalıştırdığımızda çalıştı güzel. 

  Hoca biz niye fonksiyonu adı ile çağırdık fonksiyon çağırmak için () parantez kullanmamız gerekmiyor muydu? hayır çünkü bu fonksiyonu çalıştıran foreach fonksiyonu yani aslında callback artık bir fonksiyon gibi değil parametre gibi çalışıyor. foreach gidiyor çağrıldığı yerde paramatre olarak callback kullanıyor kullanırken zaten o bunu çağırmış oluyor.



 */

  /*
  List<int> liste = [1, 2, 3, 4];
  liste.forEach((int element) {
    print("Element $element");
  });

  Yani aslında foreach kodlarının içerisinde bir yerde callback() diyip opnu çağırıyor ama bizim gördüğümüz kısımda bu bir parametre olduğu için callback fonksiyonlar parametre gibi gönderilir.

  Genel kod:

  void callback(int element) {
  print("Element $element");
}

Main içi:

List<int> liste = [1, 2, 3, 4];
  liste.forEach(callback);

  Hadi gelin kendi foreach yapımızı yazalım:
  Öncelilke bunu normal fonksiyon olarak yazalım:

  void kendiForEachYapimiz(List<dynamic> liste) {
  for (int i = 0; i < liste.length; i++) {
    print("Eleman: ${liste[i]}");
  }
}

  sonra main de çağıralım:

  List<int> listem = [1, 2, 3];
  kendiForEachYapimiz(listem);

  ekrana sonucu güzelce bastırdı. sonra fonksiyonun 
  içerisini şu şekilde değiştiriyorum:

  void kendiForEachYapimiz(List<dynamic> liste, Function callback) {
  for (int i = 0; i < liste.length; i++) {
    callback(liste[i]);//değişen kısım
  }
}

fonksiyon parametresi aldığı için artık kendiForEachYapimiz adlı fonksiyonumuz artık higher order function dur. sonra bu çağırdığımız callback fonksiyonu oluşturalım:

void callback(dynamic element) {
  print("Eleman: $element");
}

sonra artık main de bana kızıyor ikinci parametre olarak bana fonksiyon verd diyor maindeki çağırmayı şöyle değiştiriyoruz:

kendiForEachYapimiz(listem, callback);

çalıştırdığımızda yine çalışıyor.
Genel kod:
void kendiForEachYapimiz(List<dynamic> liste, Function callback) {
  for (int i = 0; i < liste.length; i++) {
    callback(i, liste[i]);
  }
}

void callback(int i, dynamic element) {
  print("${i + 1}.eleman: $element");
}

Main:
 List<int> listem = [9,18,25,69];
  kendiForEachYapimiz(listem, callback);
}

Örnek: Kullanıcı sonsuz döngü içerisinde sayı girsin bu sayıları alıp listeye kaydedelim yazdırma işlemini de bir callback ile yaptıralım:

callback: eğer bir fonksiyon kendi başına çağrılmıyorsa bir fonksiyona parametre olarak gönderiliyorsa buna denir.

Main:

  sayilariTopla(f, 15, 35);

void sayilariTopla(Function f, int a, int b) {
  int toplam = a + b;
  f(toplam);
}
//callback fonksiyon
void f(int deger) {
  print("Sayıların toplam $deger");
}

Lexical Closure

Closure özel bir fonksiyondur, closure ile bir üst kapsamdaki değişkenlerin değerlerini değiştirebiliriz.

Bir değişkene sadece o metod içinde kullanabilmeye lexical scope yani kapsam alanı. ben metodADegiskenine sadece metodA içerisinde kullanabilirim aynı şey b içinde geçerli.

Ama main in kapsamı daha geniş olduğu için ve bu metodlarda main içerisinde olduğu için maindegiskenine bu metodlar ulaşabilir.

Örneğin bu bir geriye değer döndürmeyen fonksiyondur:

void topla(){
  
}

//bu topla fonksiyonu geriye ismi olmayan (lambda) bir fonksiyon döndürüyor aldığı değeri iki ile çarpıp return ediyor

//Geriye bir fonksiyon döndüren Higher Order Funciton
Function topla() {
  return (int deger) => deger * 2;
}

Kullanım:

  var d = topla();
  print(d);//bu o isimsiz metodu çağrıyor o yüzden ekrana metodun kendisi yazıyor

  metoda direk ulaşmak için:

  yani biz d ile bir fonskiyona ulaştık d bir fonksiyondur. Eğer d yi çalıştırmak istiyorsak yine onu çağırmamız lazım o bir return eden değer olduğu için değişkene atadık

  var d = topla();
  var sonuc = d(5);
  print(sonuc);

  Demek ki biz bir fonskiyon ile başka bir fonksiyonu döndürebiliriz. burdan yani alttaki fonksiyonu üstteki fonksiyon sayesinde kullanabildik.

  şimdi closure olayına bakalım:

  //Geriye bir fonksiyon döndüren Higher Order Funciton
Function topla(int eleman) {
  return (int deger) => eleman * deger; //closure
}

String adimiSoyle() {
  return "Selam";
}

//bu topla fonksiyonu geriye ismi olmayan (lambda) bir fonksiyon döndürüyor aldığı değeri iki ile çarpıp return ediyor

//eğer dışarıdaki fonksiyon içerideki fonksiyona bağlanıyorsa o içerideki fonksiyon closure dir.


Main:

  var dondurulenFonksiyon = topla(3);
  var sonuc = dondurulenFonksiyon(4);
  print(sonuc);

  Closure ın asıl amacı kapsam dışında olan bir metodun değişkeni ya da parametresine ulaşmak için kullanılır. Çünkü iki metodun kapsamaları farklı olduğu için ulaşmak normalde mümkün değildir. Ama closure ile mümkündür. Ama ulaşmak istediğimiz metod higher order function olmak zorundadır yani fonksiyon döndürmelidir.
  ve closure isimsiz fonksiyon kullanımı geneldir.  Bir örnek daha aşağıda:

  Function adimiSoyle(String ad) {
  return (String deger) => "$deger $ad";
}

var isimsizFonk = adimiSoyle("Bilal");
  var sonuc = isimsizFonk("Selam");
  print(sonuc);

Örnekler:


Function adimiSoyle(String ad) {
  return (String deger) => "$deger $ad";
}

Function carp(int eleman) {
  return (int sayi) => sayi * eleman;
}

//Geriye bir fonksiyon döndüren Higher Order Funciton
Function topla(int eleman) {
  return (int deger) => eleman * deger; //closure
}

var isimsizFonk = adimiSoyle("Bilal");
  var sonuc = isimsizFonk("Selam");
  print(sonuc);
  */

}

//Saat 14:07 Uğur yok

