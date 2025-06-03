class Ogrenci {
  //benden bir varsayılan değer ya da soru işareti koy diyor ben koymucam bu sefer
  int id;
  int notDegeri;
  Ogrenci({this.id = 0, this.notDegeri = 0});

 @override
  String toString() {

    return "ID: $id NotDeğeri: $notDegeri";
  }

  
}
