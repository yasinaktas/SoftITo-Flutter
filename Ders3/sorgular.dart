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
  }*/

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
}
