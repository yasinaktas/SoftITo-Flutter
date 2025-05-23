import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  //sayiBul();
  List<String> meyveler = <String>[];
  meyveler.add("Elma");
  meyveler.add("Armut");
  meyveler.add("Muz");
  String meyve = meyveler[1];
  print(meyve);
  print(meyveler.isEmpty);
  print(meyveler.length);
  print(meyveler.first);
  print(meyveler.last);
  print(meyveler.contains("Karpuz"));
  List<String> reversed = meyveler.reversed.toList();
  print(reversed);
}

void sayiBul() {
  stdout.write("Sayı bulma oyununa hoşgeldiniz!\n");
  int sayi = Random().nextInt(10);
  int hak = 3;
  while (true) {
    if (hak == 0) {
      stdout.write("Haklarınız bitti. Sayı: ${sayi}\n");
      break;
    }
    stdout.write("Bir sayı giriniz: ");
    int tahmin = int.parse(stdin.readLineSync()!);
    if (tahmin == sayi) {
      stdout.write("Tebrikler bildiniz. Sayı: ${sayi}\n");
      break;
    } else if (tahmin < sayi) {
      stdout.write("Tahmininiz küçük. Tekrar deneyin.\n");
      hak--;
    } else if (tahmin > sayi) {
      stdout.write("Tahmininiz büyük. Tekrar deneyin.\n");
      hak--;
    }
  }
}
