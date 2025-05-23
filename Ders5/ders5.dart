import 'dart:io';

void main(List<String> args) {
  /*selamVer();

  print(merhabaYaz("Yasin"));*/

  genelIslemler();
}

/*void selamVer() {
  print("Merhaba SoftITo");
}

void ikiSayiTopla(int sayi1, int sayi2) {
  print(sayi1 + sayi2);
}

String merhabaYaz(String name) => "Merhaba $name";

void genelIslemler() {
  while (true) {
    stdout.write("Lütfen kullanıcı adınızı giriniz: ");
    String? userName = stdin.readLineSync()!;
    stdout.write("Lütfen şifrenizi giriniz: ");
    String? pass = stdin.readLineSync()!;
    print(girisKontrol(userName, pass));
  }
}

String girisKontrol(String userName, String pass) =>
    userName == "admin" && pass == "123456"
        ? "Giriş Başarılı"
        : "Giriş Başarısız";*/

void genelIslemler() {
  while (true) {
    stdout.write("Lütfen kullanıcı adınızı giriniz: ");
    String? userName = stdin.readLineSync();
    stdout.write("Lütfen şifrenizi giriniz: ");
    String? pass = stdin.readLineSync();
    bool isEnter = girisKontrol(userName!, pass!);
    anasayfa(isEnter, userName);
  }
}

bool girisKontrol(String userName, String pass) =>
    userName == "admin" && pass == "123456" ? true : false;

void anasayfa(bool girisDogrumu, String userName) {
  if (girisDogrumu) {
    stdout.write(
      "Bankacılık işlemleri için 1'e, Kredi Kartı işlemleri için 2'ye basınız: ",
    );
    String? secim = stdin.readLineSync();
    if (secim == "1") {
      bankacilikIslemleri(userName);
    } else if (secim == "2") {
      krediKartiIslemleri(userName);
    }
  } else {
    print("Hatalı giriş!");
  }
}

void bankacilikIslemleri(String userName) {
  print("Bankacılık işlemlerine hoşgeldiniz $userName ");
  stdout.write(
    "Hangi işlemi yapmak istiyorusunuz: Para yatırmak için 1'e, Havale yapmak için 2'ye, Kredi çekmek için 3'e basınız: ",
  );
  String? secim = stdin.readLineSync();
  if (secim == "1") {
    print("Para yatırma işlemi: ");
  } else if (secim == "2") {
    print("Havale işlemi: ");
  } else if (secim == "3") {
    print("Kredi çekme işlemi: ");
  }
}

void krediKartiIslemleri(String userName) {
  print("Kredi Kartı işlemlerine hoşgeldiniz $userName ");
  stdout.write(
    "Hangi işlemi yapmak istiyorsunuz?: Borç ödeme için 1'e, Şifre değiştirmek için 2'ye, Yeni kart talep etmek için 3'e, Limit yükseltmek için 4'e basınız: ",
  );
  String? secim = stdin.readLineSync();
  if (secim == "1") {
    print("Borcunuz ödendi.");
  } else if (secim == "2") {
    print("Şifreniz değiştirildi.");
  } else if (secim == "3") {
    print("Yeni kartınız gönderildi.");
  } else if (secim == "4") {
    print("Limitiniz yükseltildi.");
  } else {
    print("Lütfen geçerli bir seçim yapınız!");
  }
}
