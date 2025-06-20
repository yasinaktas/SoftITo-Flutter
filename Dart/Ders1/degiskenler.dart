import 'dart:io';

void main(List<String> args) {
  String name = "Yasin";
  String surname = "Aktaş";
  String birthCity = "İstanbul";
  String home = "İstanbul Bahçelievler";
  String birthday = "24 Şubat 1998";
  bool isMarried = false;
  double height = 1.75;
  print(
    "Merhaba benim adım $name soyadım $surname. $birthday $birthCity doğumluyum. $home'de yaşıyorum. Evlilik durumum $isMarried. Boyum $height metre.",
  );

  int sayi1 = 17;
  int sayi2 = 18;
  print("$sayi1 + $sayi2 = ${sayi1 + sayi2}");

  print(
    "Bir metinde alt satıra geçmek için \n kullanılır. İki kelime arasında boşluk eklemek için ise \t kullanılır.",
  );

  var kenar1, kenar2, kenar3;
  kenar1 = 17;
  kenar2 = 9;
  kenar3 = 10;
  var cevre = kenar1 + kenar2 + kenar3;

  print(
    "Kenar uzunlukları $kenar1, $kenar2 ve $kenar3 olan bir üçgenin çevresi: $cevre'dır.",
  );

  var h = 12;
  var a = 15;
  var alan = (h * a) / 2;
  print("Tabanı $a, yüksekliği $h olan bir üçgenin alanı: $alan'dır.");

  var r = 6;
  final pi = 3.14;
  var daireAlan = pi * r * r;
  print("Yarıçapı $r olan bir dairenin alanı: $daireAlan'dır.");

  var m = 10;
  var v = 8;
  var ek = (m * v * v) / 2;
  print("Kütlesi $m, hızı $v olan bir cismin kinetik enerjisi: $ek'dir.");

  var b = 17;
  b -= 7;
  b *= 2;
  b += 8;
  print(b);

  int i = 42;
  double j = i.toDouble();
  print(j);

  double d = 42.75;
  int e = d.toInt();
  print(e);

  String str1 = "42";
  String str2 = "42.25";
  int value1 = int.parse(str1);
  double value2 = double.parse(str2);
  print("Value1: $value1 Value2: $value2");

  int year = 2025;

  stdout.write("Lütfen doğum yılınızı giriniz: ");
  String? birthyear = stdin.readLineSync();
  print("Yaşınız: ${year - int.parse(birthyear!)}");

  stdout.write("Lütfen üst kenarı giriniz: ");
  String? ustStr = stdin.readLineSync();
  int ust = int.parse(ustStr!);
  stdout.write("Lütfen alt kenarı giriniz: ");
  String? altStr = stdin.readLineSync();
  int alt = int.parse(altStr!);
  stdout.write("Lütfen dik kenarı giriniz: ");
  String? dikStr = stdin.readLineSync();
  int dik = int.parse(dikStr!);
  double yamukAlan = ((ust + alt) / 2) * dik;
  stdout.write(
    "Üst kenarı $ust, alt kenarı $alt ve dik kenarı $dik olan yamukun alanı: $yamukAlan'dır.",
  );

  
}
