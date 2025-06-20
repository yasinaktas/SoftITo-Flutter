import 'dart:math';

void main(List<String> args) {
  /*
  List Sınıfının Kurucları ve Özellikleri:

  Konuya başlamadan önce Person ve Öğrenci adında iki sınıf oluşturduk. içerikleri şu şekilde:


  class Person {
  int id = 0;
  String isim = "";

  Person(this.id, this.isim);

  @override
  String toString() {
    return "id: $id ve isim: $isim";
  }
}

class Ogrenci extends Person {
  int alinanDersSayisi = 0;
  Ogrenci(id, isim, this.alinanDersSayisi) : super(id, isim);

  @override
  String toString() {
    return "id: $id ve isim: $isim ve alınan ders sayısı: $alinanDersSayisi";
  }
}
Bir liste oluşturuyorum bu liste Person türünden olmalıki oluşturduğum tüm nesneleri bu listeye değer olarak verebileyim:

  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  
  -List in de kendi kurucu metodları vardır. bunlardan birincisi [] işaret bu demek isimsiz yani çağrılmadan çalışan kurucu demektir. Biz kurucu metod niye oluştururduk veri almak için listenin veri alma şekli [] ile yapılır.

  -Birde isimlendirilmiş kurucu metodlarıda vardır. Bunlardan bir tanesi önceden öğrendiğimiz 

  a)List.filled mesela.

//int tutan liste ve filled isimlendirilmiş kurucu metottur.

    var liste1 = List.filled(5,0); 


    //Öğrenci tipinde veriler tutan bir liste. filled bir isimlendirilmiş kurucu metottur.

    var listeOgrenciler = List.filled(5, Ogrenci(0, "Belirsiz", 6));

    b)List.empty

    //List = []; boş liste tanımlar bu da isimlendirilmiş kurucu metottur

     var liste3 = List.empty();

    c)List.from

    //bir listeye list, map, set eklemek için kullanılır 

     var listeFrom = List.from(tumOgrenciler);

     d)List.of 

      //var listeOf = List<Ogrenci>.of(tumOgrenciler);//Bana türümü ver ve o türden veri ekle başka veri olmaz üst sınıf olsa da olmaz der.
      peki biz bu list.of u kullanıcam ama bu hatayı istemiyorum ne yaparım?
      var listeOf = List<Ogrenci>.of(tumOgrenciler.whereType()); 
      WhereType o listeyi gez türü istenene uyanı buraya ekle demek oluyor

      Örnek:

        
  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  var listeOf = List<Ogrenci>.of(tumOgrenciler.whereType());
  for (var e in listeOf) {
    print(e.isim);
  }

  //Daha çok kullanılan of olandır 

  e)List.generate:

 var listGenerate = List<int>.generate(5,(index) => index + 2); // listeyi oluştururken eleman sayısı alır ve index e müdahale edebiliriz yani filled ile generate arasındaki fark bundna her eleman müdahale edebiliyoruz
  print(listGenerate);

    var listGenerate = List<Ogrenci>.generate(5,(index) => Ogrenci(index, "$index", index * 2));
  print(listGenerate);


  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];

  var listGenerate = List<Person>.generate(5,(index) => Person(tumOgrenciler[index].id, tumOgrenciler[index].isim));
  print(listGenerate);

  e)List.unmodifiable : bu liste bir kez oluşur ve ekleme çıkar yapılamaz

  var degistirilemezListe = List<int>.unmodifiable([0, 2, 4]);
  degistirilemezListe.add(7);//hata alırsın

  Liste properties (Özellikleri)

  1)first: ilk elemanı verir
  2)Last: son elemanı verir
  3)isEmpty: eğer boş ise true döndürür.
  4)isNotEmpty: eğer boş değilse true döndürür.
  5)Length : listenin eleman sayısını verir
  6)reversed: Listeyi ters çevirir.


  print(tumOgrenciler.first.isim); //ahmet
  print(tumOgrenciler.last.isim); //Aydanur
  print(tumOgrenciler.length);
  var tersListe = tumOgrenciler.reversed;
  print(tersListe);
  print(tumOgrenciler.isEmpty); //false
  print(tumOgrenciler.isNotEmpty);//true


  List Metodları

  1)add : Listeye veri eklemek için kullanılır

  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  tumOgrenciler.add(Ogrenci(17, "Ali", 7));

  2)addAll: Bu bir listeye map set list eklemek için kullanılır

    List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  List<Person> tumOgrenciler2 = [
    Ogrenci(55, "Cansu", 8),
    Ogrenci(48, "Bayram", 12),
  ];
  tumOgrenciler.addAll(tumOgrenciler2);
  for (var e in tumOgrenciler) {
    print(e);
  }

  3)any: Bir higher order func türüdür içerisinde fonksiyona göre o eleman var mı yok mu kontrol eder.

    bool sonuc = tumOgrenciler.any((Person element) => element.isim == "Selma");
  print(sonuc);

  4)asMap = elemanlarınızı map olarak değiştirir.

    List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  Map<int, Person> myMap = tumOgrenciler.asMap();
  for (var a in myMap.entries) {
    print("Key: ${a.key} - Value: ${a.value.isim}");
  }

  //Bu index değerini key yaptı öğrenci içindeki verileri de value yazdı ben value içinde isimi getir de diyebilirim

  5)Contains: Bir listede o elemanın adı var mı ona bakar

  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  print(tumOgrenciler.contains(ogr1));

  Eğer isim bazında sorgulamak istersek:
    List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  List<String> ogrenciAdlari = [];
  for (var e in tumOgrenciler) {
    ogrenciAdlari.add(e.isim);
  }
  print(ogrenciAdlari.contains("Seyfi"));

  6)Clear : Listeyi tamamen temizle

  7)ElemenAt: Verdiğimiz index deki veriyi bize döndürür.

   List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  print(tumOgrenciler.elementAt(2));

  8)every: any gibi listeyi gezer şartı sağlaması durumunda true döndürür. higher order func bu da
every hepsini gezer ve hepsi sağlamalıdır.Any ise biri bile sağlasa yeterli bu yüzden any yi daha tekil sorgularda kullanmalısınız. 
any ise daha özel tekil şeyleri kontrol etmek için yapılıyor.

  9)firstWhere: şartı sağlayan ilk elemanı getirir.

    List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  var bulunanOgrenci = tumOgrenciler.firstWhere((element) => element.id == 1);
  print(bulunanOgrenci); //id si 1 olan osman ve aydanur var ama osman daha önce olduğu için onu getirecek

  10)map:bir listenin içerisindeki istediğimiz bir özelliğe erişip onu dönüştürürüz.(Iterable) 

   List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  var mapIterable = tumOgrenciler.map((Person p) => "${p.isim}");
  print(mapIterable);


  ama bu benim pek işime yaramaz bu hali ile çünkü bu bir iterable bunun elemanına ulaşamam ki ayrıca biz flutter de hep listelerle çalışcaz bize veri tabanından map gelecek biz o map i listeye çevirmek isticez. ya da bize liste gelecek (OOP)türünde biz onun sadece bir özelliği(ismini) almak isticez (map kullanıcaz)

  print(mapIterable[0]);//hata verir

  Örneğimize gelirsek iterable benim işime yaramıyor o yüzden bu metdoun sonuna toList diyeceğiz:

  List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  var mapIterable = tumOgrenciler.map((Person p) => "${p.isim}").toList();

   List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  List<String> myNameList = tumOgrenciler.map((Person p) => "${p.isim}").toList();
  print(myNameList[2]);

  Yani biz to list i çok kullanacağız.

    List<Person> tumOgrenciler = [ogr1, ogr2, ogr3, ogr4, ogr5];
  //Set e çevirmek istersen toSet kullanılır aynı id leri bi kere yazdı
  var bilinmeyen = tumOgrenciler.map((Person p) => "${p.id}").toSet();
  print(bilinmeyen);

  11)toList => Iterable(map, set) olan bir türü listeye döndürür.

  12)sort: Liste elemanlarını sıralar eğer sayı ise küçükten büyüğe String ise a dan z ye sıralama yapar.

   List<String> isimler = ["Ahmet", "Osman", "Canan", "Selim", "Kübra"];
  isimler.sort();
  print(isimler);
  List<int> sayilar = [7, 11, 1, 9, 56, 43, 80];
  sayilar.sort();
  print(sayilar);

  Objeleti sıralarken de şu şekilde sıralama yapılır:

   List<Person> tumOgrenciler = [ahmet, osman, begum, yusuf, aydanur];
  //Sen bu isimlerin  ismini değiştirsen bile yine sıralama yapmaz. Çünkü bunlar bire Person objesi adam sana dicek ki abi ben sıralamyı neye göre yapayım.
  //Büyükten küçüğe sıralıyor
  tumOgrenciler.sort((ogr1, ogr2) {
    if (ogr1.id < ogr2.id) {
      return 1;
    } else if (ogr1.id > ogr2.id) {
      return -1;
    } else {
      return 0;
    }
  });
  print(tumOgrenciler);
}

 //Küçükten büyüğe sıralıyor
  tumOgrenciler.sort((ogr1, ogr2) {
    if (ogr1.id < ogr2.id) {
      return -1;
    } else if (ogr1.id > ogr2.id) {
      return 1;
    } else {
      return 0;
    }
  });
  print(tumOgrenciler);

  Map Kurucuları ve Metodları:

  Map in amacı neydi key value değerleri taşıyarak listelerdi. Tanımlaması şu şekildeydi:

   Map<keyin_verituru, value_verituru> map_adi = {};
   Map<keyin_verituru, value_verituru> map_adi = Map();
    var map_ismi = {};

    Örnekler:

    Map<String, dynamic> map = Map();
    Map<String, dynamic> map2 = {};
    var map3 = {};

    Tanımlama:

    map[key] = value;

    Örnekler:

    map["id"] = 5;
    map["isim"] = "Yusuf";
    map["renk"] = "Mavi";

  Map Kurucuları:

  a)Standart olanı yukarıda tanımladığımız gibi:
   Map<String, dynamic> map = {};
   {} açtığın an kurucu metod çalışır

  değer atama:

    map["id"] = 5;
    map["isim"] = "Yusuf";
    map["renk"] = "Mavi";

    ya da :

     Map<String, dynamic> map = {"name": "Bilal","maas": 325.856};
      
      değer verirsin.

  b)from kurucusu:  yeni bir map oluşturur içine bir map değeri ister  

    //yeni map oluşturmuş oldum değerini de verdim
    var myMap = Map.from({'deger': 'yeni'});

  c)fromEntries: bir map i yeni bir map e aktarmak için kullanılır entries key value değerini taşıyan demektir 

   Map<String, dynamic> map = {};

  map["id"] = 5;
  map["isim"] = "Yusuf";
  map["renk"] = "Mavi";
  //yeni map oluşturmuş oldum değerini de verdim
  var mapFromEntries = Map.fromEntries(map.entries);
  print(mapFromEntries);

  d)Map.fromIterable: Map oluşurken bir liste ister. yani listeyi map e dönüştürür. key değerini ise value nin aynısı yaparak map e döndürür.

   var liste = [1, 2, 3, 4];
  var mapFromIterable = Map.fromIterable(liste);
  print(mapFromIterable);

 Örnek2:
  var liste = [1, 2, 3, 4];
  var mapFromIterable = Map<String, int>.fromIterable(
    liste,
    key: (item) {
      return "sayi$item";
    },
    value: (item) => item,
  );
  print(mapFromIterable);
}

Map Properties (Özellikleri)
*/

  Map<String, dynamic> map = {};
  Map<String, dynamic> map2 = Map();

  map["id"] = 5;
  map["isim"] = "Yusuf";
  map["renk"] = "Mavi";

  //yeni map oluşturmuş oldum değerini de verdim
  //var myMap = Map.from({'deger': 'yeni'});
  //var mapFromEntries = Map.fromEntries(map.entries);
  var liste = [1, 2, 3, 4];
  var mapFromIterable = Map<String, int>.fromIterable(
    liste,
    key: (item) {
      return "sayi$item";
    },
    value: (item) => item,
  );
  print(mapFromIterable);
}
