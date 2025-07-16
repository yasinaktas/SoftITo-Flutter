import 'dart:convert';

ArabaModel arabaModelFromJson(String str) =>
    ArabaModel.fromJson(json.decode(str));

String arabaModelToJson(ArabaModel data) => json.encode(data.toJson());

class ArabaModel {
  final String arabaAdi;
  final String ulke;
  final String kurulusYili;
  final List<Model> model;

  ArabaModel({
    required this.arabaAdi,
    required this.ulke,
    required this.kurulusYili,
    required this.model,
  });

  factory ArabaModel.fromJson(Map<String, dynamic> json) => ArabaModel(
    arabaAdi: json["araba_adi"],
    ulke: json["ulke"],
    kurulusYili: json["kurulus_yili"],
    model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "araba_adi": arabaAdi,
    "ulke": ulke,
    "kurulus_yili": kurulusYili,
    "model": List<dynamic>.from(model.map((x) => x.toJson())),
  };
}

class Model {
  final String modelAdi;
  final int fiyat;
  final bool benzinli;

  Model({required this.modelAdi, required this.fiyat, required this.benzinli});

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    modelAdi: json["model_adi"],
    fiyat: json["fiyat"],
    benzinli: json["benzinli"],
  );

  Map<String, dynamic> toJson() => {
    "model_adi": modelAdi,
    "fiyat": fiyat,
    "benzinli": benzinli,
  };
}
