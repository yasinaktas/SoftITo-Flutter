import 'package:hive_flutter/hive_flutter.dart';
part "ogrenci.g.dart";

@HiveType(typeId: 1)
class Ogrenci {
  @HiveField(0)
  final int id;
  @HiveField(1, defaultValue: "unknown")
  final String ad;
  @HiveField(2, defaultValue: "unknown")
  final String soyad;
  @HiveField(3, defaultValue: GozRenk.kahverengi)
  final GozRenk gozRengi;
  @HiveField(4, defaultValue: 0)
  final int yas;

  Ogrenci({
    required this.id,
    required this.ad,
    required this.soyad,
    required this.gozRengi,
    required this.yas,
  });
}

@HiveType(typeId: 2)
enum GozRenk {
  @HiveField(0)
  siyah,
  @HiveField(1)
  kahverengi,
  @HiveField(2)
  yesil,
  @HiveField(3)
  mavi,
  @HiveField(4)
  ela,
}


// Her bir sınıfa ya da enuma hive type (unique) vermeliyiz
// Bir de veritabanına eklenecek fieldlar HiveField tanımlamalıyız
// Adapter için terminale aşağıdaki kodu yaz:
// flutter packages pub run build_runner build