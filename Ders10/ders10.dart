import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  /*
  Set ve Map'te index yoktur.

  Map<String, dynamic> map = {
    "name": "yasin",
    "age": 27,
    "isMarried": false,
    "height": 1.75,
  };

  Map<String, dynamic> araba = {
    "name": "BMW",
    "model": "X5",
    "year": 2020,
    "otomatikVites": false,
    "price": 50000,
    "yakitTürü": "Dizel",
  };

  for (String key in araba.keys) {
    print("$key: ${araba[key]}");
  }

  for (dynamic value in araba.values) {
    print(value);
  }

  for (var item in araba.entries) {
    print("${item.key}: ${item.value}");
  }

  if (araba.containsKey("name")) {
    print("Araba ismi: ${araba["name"]}");
  } else {
    print("Araba ismi bulunamadı.");
  }

  if (araba.containsKey("date")) {
    print("Araba tarihi: ${araba["date"]}");
  } else {
    print("Araba tarihi bulunamadı.");
  }

  Map<String, int> bestNumber = Map();
  bestNumber["yasin"] = 7;
  bestNumber["ahmet"] = 8;
  bestNumber["mehmet"] = 9;

  var set = <String>{};
  set.add("yasin");
  set.add("ahmet");
  set.add("mehmet");

  var set2 = <String>{};
  set2.add("ali");
  set2.add("ayse");
  set2.add("yasin");

  var mergeSet = <String>{};
  mergeSet = {...set, ...set2};

  print(mergeSet);

  List<int> numberOneList = List.filled(5, 0);
  List<int> numberTwoList = List.filled(5, 0);
  Random random = Random();
  numberOneList = makeList(random);
  print("Birinci listeden gelenler: $numberOneList");
  numberTwoList = makeList(random);
  print("İkinci listeden gelenler: $numberTwoList");
  Set<int> allList = {...numberOneList, ...numberTwoList};
  takeList(allList);*/

  getNumbersAndSum();
}

void getNumbersAndSum() {
  print("Pozitif sayı toplama programına hoş geldiniz.");
  List<int> numbers = [];
  while (true) {
    stdout.write("Lütfen pozitif bir sayı giriniz: ");
    String? input = stdin.readLineSync();
    int number = int.parse(input!);
    if (number <= 0) {
      print("Program Sonlandırılıyor...");
      break;
    } else {
      numbers.add(number);
    }
  }
  print("Girilen sayıların toplamı: ${sumList(numbers)}");
}

int sumList(List<int> numbers) {
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

List<int> makeList(Random random) {
  List<int> mayList = List.filled(5, 0);
  for (int i = 0; i < mayList.length; i++) {
    mayList[i] = random.nextInt(50);
  }
  return mayList;
}

void takeList(Set<int> list) {
  for (int item in list) {
    print(item);
  }
}
