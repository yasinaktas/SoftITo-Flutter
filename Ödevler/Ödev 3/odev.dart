import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  /*
  1)Kullanıcıdan bir başlangıç bir de bitiş değeri alıp o aralıkta (veriler dahil)  random 5 sayı üretip listeye ekleyin. Listedeki sayıları tek ve çift olarak ekrana çıktısını alın. (fonksiyon kullan)
   2)Kullanıcıdan beş tane sayı alın. Bu sayıları Set de saklayın ve sayıların toplamını ekrana yazdırın

   3)Kullanıcıdan beş tane sayı alın Bu sayıları Set de saklayın ve sayıların toplamını ekrana yazdırın. kullanıcının kaç tane aynı sayı girdiğini bulup ekrana iki kere aynı sayı girdiniz sayıların toplamı : şu yazsın 

   4)ikinci el bir oto takip uygulaması. Burda marka model yıl, km istiyorum. Bunları map e ekleyeceksiniz(Kullanıcı girecek kullanıcı çıkış yapana kadar girmeye devam edebilecek). Kullanıcıya seçenek sunun nasıl sıralayalım ? yıl aynı yıl olanları getirecek marka derse aynı markaları getirecek şeklinde ekrana yazdıracaksınız

  */

  questionOne();
  questionTwo();
  questionThree();
}

List<int> getNumbersFromUser(Random random, int count) {
  List<int> numbers = List.filled(count, 0);
  stdout.write("Lütfen başlangıç değerini giriniz: ");
  int start = int.parse(stdin.readLineSync()!);
  stdout.write("Lütfen bitiş değerini giriniz: ");
  int end = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < count; i++) {
    numbers[i] = random.nextInt(end - start + 1) + start;
  }
  return numbers;
}

void printEvenAndOddNumbers(List<int> numbers, bool isEven) {
  if (isEven) {
    print("Çift Sayılar:");
  } else {
    print("Tek Sayılar:");
  }
  for (int number in numbers) {
    if ((number % 2 == 0 && isEven == true) ||
        (number % 2 != 0 && isEven == false)) {
      print(number);
    }
  }
}

Set<int> getNumbers(int count) {
  Set<int> numbers = {};
  for (int i = 0; i < count; i++) {
    stdout.write("Lütfen ${i + 1}. sayıyı giriniz: ");
    int number = int.parse(stdin.readLineSync()!);
    numbers.add(number);
  }
  return numbers;
}

int calculateSum(Set<int> numbers) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

void questionOne() {
  Random random = Random();
  List<int> numbers = getNumbersFromUser(random, 5);
  printEvenAndOddNumbers(numbers, true);
  printEvenAndOddNumbers(numbers, false);
}

void questionTwo() {
  Set<int> numbers = getNumbers(5);
  int sum = calculateSum(numbers);
  print("Sayıların toplamı: $sum");
}

void questionThree() {
  Set<int> numbers = getNumbers(5);
  int sum = calculateSum(numbers);
  print(
    "${5 - numbers.length} kere aynı sayı girdiniz. Sayıların toplamı: $sum",
  );
}
