void main(List<String> args) {
  /*List<String> sabitUzunluklu = List.filled(5, "Yasin");
  print(sabitUzunluklu);
  int length = sabitUzunluklu.length;
  print(length);

  List<dynamic> tumVeriTipleri = <dynamic>[];
  tumVeriTipleri.add(1);
  tumVeriTipleri.add("Yasin");
  tumVeriTipleri.add(3.14);
  tumVeriTipleri.add(true);
  tumVeriTipleri.add([1, 2, 3]);
  tumVeriTipleri.add({"ad": "Yasin", "yas": 25});
  tumVeriTipleri.add(null);
  print(tumVeriTipleri);

  // Tip vermezsek otomatik olarak dynamic olur
  List dynamicList = List.filled(6, 0);
  dynamicList[0] = "yasin";
  print(dynamicList);

  List<String> isimler = List.filled(5, "");
  isimler[0] = "Yasin";
  isimler[1] = "Ali";
  isimler[2] = "Ayşe";
  isimler[3] = "Fatma";
  isimler[4] = "Mehmet";
  for (int i = 0; i < isimler.length; i++) {
    print("${i + 1}. eleman: ${isimler[i]}");
  }

  for (String isim in isimler) {
    print(isim);
  }

  // Değişken uzunluklu liste
  List<String> isimler = [];
  List<int?> sayilar = <int?>[];
  //isimler[0] = "yasin"; // Hata verir çünkü liste boş
  sayilar.length = 10;
  sayilar.add(1);
  sayilar[0] = 2; // Hata vermez çünkü o index dolu

  List<int> sayilar = [1, 2, 3, 4, 5];
  print("Liste 1: $sayilar");
  print("**************");
  sayilar.add(45);
  print("Liste 2: $sayilar");

  // Büyüyebilen liste
  // growable bir isimlendirilmiş parametredir {} içine yazılmıştır
  List<String> isimler = List.filled(5, "", growable: true);*/

  List<String> isimler = List.empty(growable: true);
  isimler.add("Yasin");
  isimler.add("Ali");
  isimler.add("Ayşe");
  isimler.add("Fatma");
  isimler.add("Mehmet");
  isimler.add("Zeynep");
  isimler.remove("Ali");
  isimler.removeAt(2);
  isimler.removeLast();
  isimler.removeRange(0, 2);
  isimler.removeWhere((eleman) => eleman == "Yasin");
  print(isimler);
}
