void main(List<String> args) {
  //Bu ödev fonksiyon kullanmadan yapılacak
  
  //Kullanıcıdan üç tane sayı alacaksınız. Kullanıcının girdiği bilgilere göre üçgenin çeşidini yazacaksınız. (Örn 3 7 9 çeşitkenar, 5 5 9 ikizkenar 9 9 9  eşkenar diyecek)
  while(true){
    stdout.write("1. sayıyı giriniz: ");
    int sayi1 = int.parse(stdin.readLineSync()!);
    stdout.write("2. sayıyı giriniz: ");
    int sayi2 = int.parse(stdin.readLineSync()!);
    stdout.write("3. sayıyı giriniz: ");
    int sayi3 = int.parse(stdin.readLineSync()!);
    if(sayi1 == sayi2 && sayi2 == sayi3){
      print("Eşkenar üçgen");
    }else if(sayi1 == sayi2 || sayi2 == sayi3 || sayi1 == sayi3){
      print("İkizkenar üçgen");
    }else{
      print("Çeşitkenar üçgen");
    }
  }
  
  
  //kullanıcının girdiği kenar sayısına göre düzgün çokgenin aşağıdakiler hangisini yapmak istiyorsunuz dicek? 1- iç açı toplamı, 2- bir iç açısı ve 3 -bir dış açısını bulan program(Bilgi iç açı toplamı (kenar sayısı - 2) * 180, bir iç açısı ((kenar sayısı - 2)*180)/n, bir dış açısı 360/n
  while(true){
    stdout.write("Kenar sayısını giriniz: ");
    int kenarSayisi = int.parse(stdin.readLineSync()!);
    stdout.write("Aşağıdakilerden hangisini yapmak istiyorsunuz?\n1- iç açı toplamı\n2- bir iç açısı\n3 -bir dış açısı\nSeçiminiz: ");
    int secim = int.parse(stdin.readLineSync()!);
    if(secim == 1){
      print("İç açı toplamı: ${kenarSayisi * 180}");
    }else if(secim == 2){
      print("Bir iç açısı: ${(kenarSayisi - 2) * 180 / kenarSayisi}");
    }else if(secim == 3){
      print("Bir dış açısı: ${360 / kenarSayisi}");
    }
  }
  
  
  //kullanıcıdan iki tane sayı isteyeceksiniz. biri başlangıç biri bitiş değeri. 1- 3 ile bölünen için 2- 4 ile bölünenler 3- 5 ile bölünenler.
  while(true){
    stdout.write("Başlangıç değerini giriniz: ");
    int baslangic = int.parse(stdin.readLineSync()!);
    stdout.write("Bitiş değerini giriniz: ");
    int bitis = int.parse(stdin.readLineSync()!);
    for(int i = baslangic; i <= bitis; i++){
      if(i % 3 == 0 && i % 4 != 0 && i % 5 != 0){
        print(i);
      }
    }
  }

  //kullanıcıdan iki tane sayı isteyeceksiniz  biri başlangıç biri bitiş değeri. 3 ile bölünüp 4 ile bölünmeyenler yazdırın.(3 - 6 - 9 - 15 -18 -21 ...)
  while(true){
    stdout.write("Başlangıç değerini giriniz: ");
    int baslangic = int.parse(stdin.readLineSync()!);
    stdout.write("Bitiş değerini giriniz: ");
    int bitis = int.parse(stdin.readLineSync()!);
    for(int i = baslangic; i <= bitis; i++){
      if(i % 3 == 0 && i % 4 != 0){
        print(i);
      }
    }
  }
  //1 den 20 ye kadar faktöriyeli 1000 den büyük olanları ekrana yazdırın.
  while(true){
    for(int i = 1; i <= 20; i++){
      int faktoriyel = 1;
      for(int j = 1; j <= i; j++){
        faktoriyel *= j;
      }
      if(faktoriyel > 1000){
        print(i);
      }
    }
  }

}