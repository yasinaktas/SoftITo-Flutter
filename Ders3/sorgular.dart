import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {
  // Kısa if (ternary) Flutter görsel nesneleri içinde sıkça kullanılır, iki durum varsa kullanılır
  /*int a = 0;
  a > 0
      ? print("Bu sayı pozitiftir")
      : a == 0
      ? print("Bu sayı sıfırdır")
      : print("Bu sayı negatiftir");

  String userNameAdmin = "admin";
  stdout.write("Kullanıcı adını giriniz:");
  String? userName = stdin.readLineSync();
  userName == userNameAdmin ? print("Hoşgeldiniz") : print("Hatalı giriş!");

  int x = 3;
  switch (x) {
    case 1:
      {
        print("Sayı 1");
      }
      break;
    case 2:
      {
        print("Sayı 2");
      }
      break;
    default:
      {
        print("Sayı 1 veya 2 değil");
      }
  }

  stdout.write("Lütfen doğduğunuz ayı giriniz: ");
  String month = stdin.readLineSync()!;
  if (month == "Aralık" || month == "Ocak" || month == "Şubat") {
    print("Siz Kış mevsiminde doğmuşsunuz");
  } else if (month == "Mart" || month == "Nisan" || month == "Mayıs") {
    print("Siz İlkbahar mevsiminde doğmuşsunuz");
  } else if (month == "Haziran" || month == "Temmuz" || month == "Ağustos") {
    print("Siz Yaz mevsiminde doğmuşsunuz");
  } else if (month == "Eylül" || month == "Ekim" || month == "Kasım") {
    print("Siz Sonbahar mevsiminde doğmuşsunuz");
  } else {
    print("Geçersiz ay girdiniz");
  }

  stdout.write("Lütfen birinci sayıyı giriniz: ");
  int sayi1 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen ikinci sayıyı giriniz: ");
  int sayi2 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen üçüncü sayıyı giriniz: ");
  int sayi3 = int.parse(stdin.readLineSync()!);
  if (sayi1 >= sayi2 && sayi1 >= sayi3) {
    print("En büyük sayı: $sayi1");
  } else if (sayi2 >= sayi1 && sayi2 >= sayi3) {
    print("En büyük sayı: $sayi2");
  } else {
    print("En büyük sayı: $sayi3");
  }

  stdout.write("Lütfen sıcaklığı giriniz: ");
  int sicaklik = int.parse(stdin.readLineSync()!);
  if (sicaklik <= 0) {
    print("Su şuanda katı halde bulunmaktadır");
  } else if (sicaklik > 0 && sicaklik <= 100) {
    print("Su şuanda sıvı halde bulunmaktadır");
  } else {
    print("Su şuanda gaz halde bulunmaktadır");
  }

  stdout.write("Lütfen birinci sayıyı giriniz: ");
  int sayi1 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen ikinci sayıyı giriniz: ");
  int sayi2 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen üçüncü sayıyı giriniz: ");
  int sayi3 = int.parse(stdin.readLineSync()!);
  double average = (sayi1 + sayi2 + sayi3) / 3;
  print("Ortalama: $average");

  if(average < 50){
    print("Sınıfta kaldınız");
  }else if(average >= 50 && average < 70){
    print("Orta derecede başarılı");
  }else if(average >= 70 && average < 85){
    print("İyi derecede başarılı");
  }else{
    print("Çok iyi derecede başarılı");
  }

  for (var i = 0; i <= 10; i++) {
    print(i);
  }

  for (var i = 0; i < 11; i++) {
    print(i);
  }

  for (var i = 0; i < 10; i += 1) {
    print(i);
  }

  for (var i = 0; i < 5; i = i + 1) {
    print("${i + 1}. Yasin <3 Kader");
  }

  for (var i = 0; i < 23; i += 2) {
    print(i);
  }

  for (var i = 1; i < 40; i += 2) {
    print(i);
  }

  var start = 5;
  var end = 12;
  for (var i = start; i < end; i++) {
    print(i);
  }

  stdout.write("Lütfen 1'den kaça kadar saydırılmasını istiyorsanız giriniz: ");
  var last = int.parse(stdin.readLineSync()!);
  for (var i = 1; i <= last; i++) {
    print(i);
  }

  stdout.write("Lütfen başlangıcı giriniz: ");
  int start = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen bitişi giriniz: ");
  int end = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen artışı giriniz: ");
  int inc = int.parse(stdin.readLineSync()!);
  for (var i = start; i < end; i += inc) {
    print(i);
  }

  int sayac = 1;
  while (sayac <= 4) {
    print(sayac);
    sayac++;
  }

  var sayac = 0;
  while (sayac < 10) {
    if (sayac == 3) {
      break;
    }
    print(sayac);
    sayac++;
  }

  for (var i = 0; i < 10; i++) {
    if (i == 4) {
      continue;
    }
    print(i);
  }

  while (true) {
    print(
      "Hoşgeldiniz! Devam etmek için 'E' tuşuna basınız, çıkmak için Q' tuşuna basınız'",
    );
    String? value = stdin.readLineSync();
    if (value == "E" || value == "e") {
      print("Lütfen adınızı giriniz: ");
      String? name = stdin.readLineSync();
      print("Lütfen soyadınızıe giriniz: ");
      String? surname = stdin.readLineSync();
      print("Hoşgeldiniz $name $surname");
    } else if (value == "Q" || value == "q") {
      break;
    }
  }

  while (true) {
    print(
      "Hoşgeldiniz! Devam etmek için 'A' tuşuna basınız, çıkmak için Q' tuşuna basınız'",
    );
    String? value = stdin.readLineSync();
    if (value == "A" || value == "a") {
      print("Lütfen fiyatı giriniz: ");
      double fiyat = double.parse(stdin.readLineSync()!);
      print("Lütfen KDV oranını giriniz: ");
      double kdv = double.parse(stdin.readLineSync()!);
      print(
        "$fiyat'lı ürünün, $kdv oranlı son fiyatı ${(fiyat * (kdv + 100)) / 100}'dür.",
      );
    } else if (value == "Q" || value == "q") {
      break;
    } else {
      print("Hatalı tuşlama");
    }
  }

  while (true) {
    print("Birinci sayıyı giriniz: ");
    int sayi1 = int.parse(stdin.readLineSync()!);
    print("İkinci sayıyı giriniz: ");
    int sayi2 = int.parse(stdin.readLineSync()!);
    var result = 0;
    for (int i = sayi1; i <= sayi2; i++) {
      result += i;
    }
    print(result);
  }*/

  for (int i = int.parse('a'); i < int.parse('z'); i++) {
    print(i);
  }
}
