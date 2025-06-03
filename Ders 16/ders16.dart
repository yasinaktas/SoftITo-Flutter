void main(List<String> args) {
  /*
  -Dart dilinde interfaceler özellik anlamına gelir abstract tanımlanmadan interface tanımlanamaz. tanımlama şekli:

  abstract interface class Ucabilenler{
    void ucmak();
  } 
  -İnterface bir sınıfa implements keyword ü ile eklenir. interface içersindeki metodlar implement edilen sınıfta çağrılmak zorundadır. 

  -Interfaceler sayesinde ortak özelliği olan ancak kalıtımsal olarak alakalı olmayan sınıfları bir çatı altında toplayabiliriz ve özellikler eklenebilir.
  -Interfaceler sayesinde dart dilinde olmayan çoklu kalıtım sağlanabilir. Bir sınıf birden fazla sınıfı implements diyerek gerçekleştirebilecek.

  Örnek Kare hem bir dörtgendir hemde çokgendir hemde düzgün çokgendir.
  -Dörgenlerin iç açıları toplamı 360 dır bilgisine sahiptir.
  -Aynı zamanda kenarları doğrusal kapalı ve en az üç kenar sahip olmalıdır şartlarını
  -Düzgün çokgenlerin iç açıları eşittir(90) ve tüm kenarları eşittir şartını da sağlıyor. 

  Şimdi bir örnek yapalım: Ben bir hayvan sınıfı oluşturdum 

abstract class Hayvan {
  void fly();
  void run();
  void bark();
}
içerisine gövdesi olmayan ucma koşma ve havlama metodları oluşturdum. 

Ama her hayvan uçmak zorunda mı? ya da her hayvan koşabiliyor mu ya da havlayabiliyor mu?

Mesela bir kuş sınıfı oluşturup extends edelim:

class Kus extends Hayvan{
  @override
  void bark() {
    // TODO: implement bark
  }

  @override
  void fly() {
    // TODO: implement fly
  }

  @override
  void run() {
    // TODO: implement run
  }

}

kuş uçar ama diğer iki fonksiyonu gerçekleştiremez.



class Kopek extends Hayvan{
  @override
  void bark() {
    // TODO: implement bark
  }

  @override
  void fly() {
    // TODO: implement fly
  }

  @override
  void run() {
    // TODO: implement run
  }

}
 Köpek havlar ve koşar ama uçamaz. yani bu iki hayvan bu üç metodu yapmaya zorlanıyor ama boş metodlar kalıyor eğer boş kalacaksa o zaman zorunlu olmasının ne anlamı var.

 yani böyle bir durum varsa özelliklerimizi farklı sınıflara aktararak gereksiz kodlamalardan kullanabiliriz.

 Bu yüzden artık hayvan diye bir sınıf yapmak yerine bunları daha aza indirgeyen sınıflar oluşturcaz:


//Uçabilen
abstract interface class Ucabilenler {
  void fly();
}
//havlayabilen
abstract interface class Havlayabilenler {
  void bark();
}
//koşabilen
abstract interface class Kosabilenler {
  void run();
}

 adlı üç tane sınıf oluşturuyorum artık daha özel sınıflarımız oldu. Şimdi başka sınıflar oluşturup bu sınıflardan extends edebiliriz:

class Kopek extends Havlayabilenler{
  @override
  void bark() {
    // TODO: implement bark
  }

}

Köpek sınıfı havlayabildiği için Havlayabilenler sınıfından kalıtım aldık ama köpekler koşadabilir ama biz iki sınıfı aynı anda extends edemiyoruz dartta bu yüzden başka bir çözüm bulmalıyız. bu yüzden artık eğer iki sınıf birden miraz almak istiyorsanız extends yerine implements keyword ü kullanmalısınız. Artık extends değil de implements kullandığımız için buna kalıtım değilde interface işlemi diyoruz:


abstract class Hayvan {
  void yemekYe();
}

abstract interface class Ucabilenler {
  void ucmak();
}

abstract interface class Havlayabilenler {
  void havlamak();
}

abstract interface class Yuzebilenler {
  void yuzmek();
}

//Üçünüde çağırmak zorundayız. ama bu mantıksız köpek uçmazki
class Kopek extends Hayvan implements Havlayabilenler, Yuzebilenler {
  @override
  void yemekYe() {
    print("Ben kemik yemeyi severim");
  }

  @override
  void havlamak() {
    print("Ben havlarım");
  }

  @override
  void yuzmek() {
    print("Köpek yüzme stili ile");
  }
}

class Balik extends Hayvan implements Yuzebilenler {
  @override
  void yemekYe() {
    print("Yosun yemeyi severim");
  }

  @override
  void yuzmek() {
    print("Her türlü yüzmeye sahip");
  }
}

abstract class EnemyCharacter {
  void yemekYe();
  void canBilgisi();
}
abstract interface class AtesEdebilenler {
  void atesEt();
}
class Zombiler extends EnemyCharacter implements AtesEdebilenler {
  @override
  void canBilgisi() {}
  @override
  void yemekYe() {}
  @override
  void atesEt() {
    print("Silah ile ateş animasyonunu oynat");
  }
}
class LavCanavari extends EnemyCharacter implements AtesEdebilenler {
  @override
  void canBilgisi() {}
  @override
  void yemekYe() { }
  @override
  void atesEt() {
    print("Lav silahı ile ortalığı yakma animasyonu");
  }
}
class Yarasalar extends EnemyCharacter {
  @override
  void canBilgisi() { }
  @override
  void yemekYe() {}
}


  interface ile kalıtım arasındaki fark:
  Kalıtım demek bir sınıfın tüm özelliklerini zorunlu yada zorunsuz alt sınıfa aktarmak demektir. 
  abstract sınıf ise alt sınıf ile kalıtım bağı vardır ama normal sınıftan farklı içerisine gövdesiz yani zorunlu metodlarda barındırabilir.

  Özetlemek gerekirse eğer bir sınıftan nesne oluşturmayacaksanız yani saçma ise (Örnek Hayvan ya da Araç) ve alt sınıfların illa tanımlamak zorunda olduğu metodlar varsa abstract yapmalısınız. 

  interface nedir? abstract sınıf gibi davranan ama aslında sadece özellik paylaşmak için kullanılan yapılardır. interfaceler kalıtım özelliği aramazlar. Interface bir den fazla implement olabilir.

  interfaceler sadece metodları değil değişkenleri de implement eder abstract sınıflardan bir farkı daha 

  -interfaceler de gövdesi olan metod tanımlanmaz.o yüzden this kavramı yoktur. kurucu metodu yoktur aslında interfaceler sınıf değildir. sınıfın bir türüdür.

  -interfaceler veri türü olabilir mi olamaz çünkü interfacerler de abstract olduğu için nesne üretilemez. bunların veri türü olabileceği liste ya da değişkenler tanımlanamaz. 

  */
}

abstract class Omurgali {
  int kemikSayisi = 0;
  void hareketEt();
}

abstract interface class Ucabilenler {
  void ucmak();
}

abstract interface class Kosabilenler {
  void kos();
}

abstract interface class Yuzebilenler {
  void yuz();
}

class Kopek extends Omurgali implements Ucabilenler {
  @override
  void hareketEt() {
    kemikSayisi = 120;
  }

  @override
  void ucmak() {}
}
