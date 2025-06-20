import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  // var intValue = Random.nextInt(10) 0 <= intValue < sayi

  /*var intValue = Random().nextInt(20) + 10;
  print(intValue);

  var doubleValue = Random().nextDouble() * 256;
  print(doubleValue);

  var boolValue = Random().nextBool();
  print(boolValue);

  var r = Random();
  var total = 0;
  for (int i = 0; i < 5; i++) {
    total += r.nextInt(24) + 1;
  }
  print("Gelen sayıların toplamı ${total}'dır.");

  int ciftSayi = 0, tekSayi = 0;
  var r = Random();
  for (var i = 1; i <= 6; i++) {
    int sayi = r.nextInt(100);
    print(sayi);
    if (sayi % 2 == 0) {
      ciftSayi++;
    } else {
      tekSayi++;
    }
  }
  print(
    "Gelen sayılardan $ciftSayi tanes çift sayı, $tekSayi tanesi tek sayıdır.",
  );

  var biggerOrEqualTwenty = 0;
  var r = Random();
  for (int i = 0; i < 5; i++) {
    int sayi = r.nextInt(40);
    print(sayi);
    if (sayi >= 20) {
      biggerOrEqualTwenty++;
    }
  }
  print(
    "Girilen sayılardan $biggerOrEqualTwenty tanesi 20'den büyük veya eşittir.",
  );

  double x = 6.8;
  print(x.ceil());
  print(x.floor());

  print(pow(2, 4));

  print("Lütfen girmek istediğiniz sayı adedini giriniz: ");
  int count = int.parse(stdin.readLineSync()!);
  print("Maksimum kaça kadar sayı üretmek istediğinizi giriniz: ");
  int max = int.parse(stdin.readLineSync()!);
  int total = 0;
  var r = Random();
  for (int i = 0; i < count; i++) {
    int num = r.nextInt(max) + 1;
    print("${i + 1}. Sayı: $num");
    total += num;
  }
  print("Gelen sayıların toplamı: $total");

  stdout.write("Lütfen sınır değer giriniz: ");
  int limit = int.parse(stdin.readLineSync()!);
  var r = Random();
  int num1 = r.nextInt(limit);
  int num2 = r.nextInt(limit);
  num1 > num2 ? print("$num1 > $num2") : print("$num1 <= $num2");*/

  stdout.write("Lütfen bir sınır giriniz: ");
  int limit = int.parse(stdin.readLineSync()!);
  var r = Random();
  stdout.write("Lütfen adet giriniz: ");
  int count = int.parse(stdin.readLineSync()!);
  double total = 0;
  for (int i = 0; i < count; i++) {
    int num = r.nextInt(limit) + 1;
    print("$num");
    total += num;
  }
  print("Girilen sayıların ortalaması: ${total / count}");
}
