import 'dart:io';

void main(List<String> args) {
  stdout.write("Lütfen birinci sayıyı giriniz: ");
  String? firstStr = stdin.readLineSync();
  double first = double.parse(firstStr!);
  stdout.write("Lütfen ikinci sayıyı giriniz: ");
  String? secondStr = stdin.readLineSync();
  double second = double.parse(secondStr!);
  stdout.write(
    "Girdiğiniz birinci sayı ${first.toInt()}} ve ikinci sayı ${second.toInt()}'ın toplamı ${(first + second).toInt()} olacaktır.",
  );
}
