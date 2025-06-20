import 'dart:io';

void main(List<String> args) {
  /*int a = 5;
  int b = 3;
  print(a < b);
  print(a >= b);

  var name1 = "yasin";
  var name2 = "kader";
  print(name1 == name2);

  bool state1 = 12 > 5;
  bool state2 = 17 <= 19;
  print(state1 || state2);

  stdout.write("Hangi sayı büyüktür oyununa hoşgeldiniz!");
  stdout.write("Lütfen işlem yapılacak sayıyı giriniz: ");
  int number1 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen karşılaştırılacak sayıyı giriniz: ");
  int number2 = int.parse(stdin.readLineSync()!);
  print(number1 > number2);

  stdout.write("Lütfen işlem yapılacak sayıyı giriniz: ");
  int number3 = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen karşılaştırılacak sayıyı giriniz: ");
  int number4 = int.parse(stdin.readLineSync()!);
  print(
    "Girdiğiniz $number3 sayısının 2 katının 5 fazlası olan ${number3 * 2 + 5}, $number4 sayısından büyük müdür? ${number3 * 2 + 5 > number4}",
  );

  stdout.write("Lütfen yaşınızı giriniz: ");
  int age = int.parse(stdin.readLineSync()!);
  if (age > 18) {
    print("Ehliyet başurusu yapabilirsiniz!");
  } else {
    print("Ehliyet almak için yaşınız erken!");
  }

  stdout.write("Lütfen adınızı giriniz:\n");
  String name = stdin.readLineSync()!;
  stdout.write(
    "Sevgili $name lütfen cinsiyetiniz Erkek ise E, Kadın ise K harfiniz giriniz:\n",
  );
  String gender = stdin.readLineSync()!;
  if (gender == "E") {
    print("Oyunumuza hoşgeldiniz $name Bey!\n");
  } else if (gender == "K") {
    print("Oyunumuza hoşgeldiniz $name Hanım!\n");
  }
  stdout.write("Lütfen birinci sayıyı giriniz: ");
  String? numberOneText = stdin.readLineSync();
  double numberOne = double.parse(numberOneText!);
  stdout.write("Lütfen ikinci sayıyı giriniz: ");
  String? numberTwoText = stdin.readLineSync();
  double numberTwo = double.parse(numberTwoText!);
  bool result = (numberOne * 2 + 5) > numberTwo;
  if (result) {
    print(
      "Sayı $numberOne'ın 2 katının 5 fazlası olan ${numberOne * 2 + 5} sayısı $numberTwo'dan büyüktür",
    );
  } else {
    print(
      "Sayı $numberOne'ın 2 katının 5 fazlası olan ${numberOne * 2 + 5} sayısı $numberTwo'dan küçüktür veya eşittir",
    );
  }

  String adminName = "softito";
  String pass = "123456";
  stdout.write("Lütfen sistem yöneticisi kullanıcı adını yazınız: ");
  String userName = stdin.readLineSync()!;
  stdout.write("Lütfen sistem yöneticisi parolanızı giriniz: ");
  String userPass = stdin.readLineSync()!;
  if (userName == adminName && userPass == pass) {
    print("Hoşgeldiniz $userName");
  } else {
    print("Kullanıcı adı yanlış!");
  }*/

  /*stdout.write("Lütfen sayı giriniz: ");
  String numberStr = stdin.readLineSync()!;
  int number = int.parse(numberStr);
  if (number % 2 == 0) {
    print("Girilen sayı $number, çifttir.");
  } else {
    print("Girilen sayı $number, tektir.");
  }*/

  /*stdout.write("Lütfen sayı giriniz: ");
  String numberStr = stdin.readLineSync()!;
  int number = int.parse(numberStr);
  if (number > 0) {
    print("$number sayısı pozitiftir!");
  } else if (number < 0) {
    print("$number sayısı negatiftir!");
  } else {
    print("$number sayısı sıfırdır!");
  }*/

  stdout.write("Lütfen birinci sayıyı giriniz: ");
  String? numberOneText = stdin.readLineSync();
  double numberOne = double.parse(numberOneText!);
  stdout.write("Lütfen ikinci sayıyı giriniz: ");
  String? numberTwoText = stdin.readLineSync();
  double numberTwo = double.parse(numberTwoText!);
  stdout.write(
    "Toplama için 1\nÇıkarma için 2\nÇarpma için 3\nBölme için 4\nMod alma için 5\ntuşuna basınız: ",
  );
  int secim = int.parse(stdin.readLineSync()!);
  if (secim == 1) {
    print("$numberOne + $numberTwo = ${numberOne + numberTwo}");
  } else if (secim == 2) {
    print("$numberOne - $numberTwo = ${numberOne - numberTwo}");
  } else if (secim == 3) {
    print("$numberOne * $numberTwo = ${numberOne * numberTwo}");
  } else if (secim == 4) {
    print("$numberOne / $numberTwo = ${numberOne / numberTwo}");
  } else if (secim == 5) {
    print("$numberOne % $numberTwo = ${numberOne % numberTwo}");
  } else {
    print("Hatalı giriş yaptınız!");
  }
}
