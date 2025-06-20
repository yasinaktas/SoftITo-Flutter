  //sonsuz döngü şeklinde kullanıcıdan 3 sayı alın büyük olanı ekrana yazdırın. q ya basana kadar işlem sürekli istensin
  while(true){
    print("1. sayıyı girin: ");
    int sayi1 = int.parse(stdin.readLineSync()!);
    print("2. sayıyı girin: ");
    int sayi2 = int.parse(stdin.readLineSync()!);
    print("3. sayıyı girin: ");
    int sayi3 = int.parse(stdin.readLineSync()!);
    if(sayi1>sayi2 && sayi1>sayi3){
      print("en büyük sayı $sayi1");
    }else if(sayi2>sayi1 && sayi2>sayi3){
      print("en büyük sayı $sayi2");
    }else{
      print("en büyük sayı $sayi3");
    }
    print("Çıkmak için q ya basın: ");
    String? secim = stdin.readLineSync();
    if(secim=="q"){
      break;
    }
  }
  //sonsuz döngü şeklinde kullanıcan iki sayı alın ve bu sayıları toplatın.
  while(true){
    print("1. sayıyı girin: ");
    int sayi1 = int.parse(stdin.readLineSync()!);
    print("2. sayıyı girin: ");
    int sayi2 = int.parse(stdin.readLineSync()!);
    print("toplam: ${sayi1+sayi2}");
    print("Çıkmak için q ya basın: ");
    String? secim = stdin.readLineSync();
    if(secim=="q"){
      break;
    }
  }
  //sonsuz döngü şeklinde işlem seçimi yapılabilip seçime göre girilen sayıları işleme sokan program.
  while(true){
    print("1. sayıyı girin: ");
    double sayi1 = double.parse(stdin.readLineSync()!);
    print("2. sayıyı girin: ");
    double sayi2 = double.parse(stdin.readLineSync()!);
    
    print("Toplama için 1, Çıkarma için 2, Çarpma için 3, Bölme için 4, Mod alma için 5, Çıkmak için q ya basın: ");
    String? secim = stdin.readLineSync();
    if(secim=="1"){
      print("toplam: ${sayi1+sayi2}");
    }else if(secim=="2"){
      print("fark: ${sayi1-sayi2}");
    }else if(secim=="3"){
      print("çarpım: ${sayi1*sayi2}");
    }else if(secim=="4"){
      print("bölüm: ${sayi1/sayi2}");
    }else if(secim=="5"){
      print("mod: ${sayi1%sayi2}");
    }else if(secim=="q"){
      break;
    }
  }

  //Sonsuz döngü şeklinde geometrik şekillerde kare, dikdörgen, paralelkenar ve dairenin alanını bulan programı yazın.
  while(true){
    final double pi = 3.14;
    print("Alanını hesaplamak istediğiniz şekil:\n1) kare\n2) dikdörtgen\n3) paralelkenar\n4) daire");
    String? secim = stdin.readLineSync();
    if(secim=="1"){
      print("karenin alanı: ${sayi1*sayi1}");
    }else if(secim=="2"){
      print("dikdörtgenin alanı: ${sayi1*sayi2}");
    }else if(secim=="3"){
      print("paralelkenarın alanı: ${sayi1*sayi2}");
    }else if(secim=="4"){
      print("dairenin alanı: ${pi*sayi1*sayi1}");
    }
    print("Çıkmak için q ya basın: ");
    String? secim2 = stdin.readLineSync();
    if(secim2=="q"){
      break;
    }
  }
  //Kullanıcıdan 4 şekilde listelen üründen hangisini seçerse üzerine sabit kargo ücretini ekleyerek hesabı ekranda 
  //gösteren program.
  while(true){
    final double kargo = 10;
    final double kazak = 100;
    final double gomlek = 50;
    final double pantolon = 150;
    final double sapka = 20;
    print("Ürün seçiniz:\n1) kazak\n2) gömlek\n3) pantolon\n4) şapka");
    String? secim = stdin.readLineSync();
    if(secim=="1"){
      print("ürün fiyatı: ${kazak+kargo}");
    }else if(secim=="2"){
      print("ürün fiyatı: ${gomlek+kargo}");
    }else if(secim=="3"){
      print("ürün fiyatı: ${pantolon+kargo}");
    }else if(secim=="4"){
      print("ürün fiyatı: ${sapka+kargo}");
    }
    print("Çıkmak için q ya basın: ");
    String? secim2 = stdin.readLineSync();
    if(secim2=="q"){
      break;
    }
  }
  //final notunun %70 vize notunun %30 olduğu bir not hesaplama programında girilen notlara göre 100-85 AA, 84-70 BA 69-50 BB 49-30 CB 30-0 CC olan sonsuz döngülü programı yazın.
  while(true){
    print("final notunuzu girin: ");
    double finalnot = double.parse(stdin.readLineSync()!);
    print("vize notunuzu girin: ");
    double vizenot = double.parse(stdin.readLineSync()!);
    double ortalama = (finalnot*0.7)+(vizenot*0.3);
    if(ortalama>=100 && ortalama<=85){
      print("AA");
    }else if(ortalama>=84 && ortalama<=70){
      print("BA");
    }else if(ortalama>=69 && ortalama<=50){
      print("BB");
    }else if(ortalama>=49 && ortalama<=30){
      print("CB");
    }else if(ortalama>=30 && ortalama<=0){
      print("CC");
    }
    print("Çıkmak için q ya basın: ");
    String? secim2 = stdin.readLineSync();
    if(secim2=="q"){
      break;
    }
  }
  //Kullanıcan fiyat kar ya da zara oranı seçimi yaptırıp girilen fiyata göre son fiyatı yazan program (Bir fiyat girin. Kar mı Zarar oranı girin 20 => %20 sonuc olarak fiyatı hesaplatıcaksın)
  while(true){
    print("fiyat girin: ");
    double fiyat = double.parse(stdin.readLineSync()!);
    print("1) kar\n2) zarar");
    int secim = int.parse(stdin.readLineSync()!);
    if(secim==1){
      print("kar oranını girin: ");
      double kar = double.parse(stdin.readLineSync()!);
      print("son fiyat: ${fiyat+(fiyat*kar/100)}");
    }else if(secim==2){
      print("zarar oranını girin: ");
      double zarar = double.parse(stdin.readLineSync()!);
      print("son fiyat: ${fiyat-(fiyat*zarar/100)}");
    }
    print("Çıkmak için q ya basın: ");
    String? secim2 = stdin.readLineSync();
    if(secim2=="q"){
      break;
    }
  }