class CemberDaire {
  int _yariCap = 1; //adam 1 den küçük giremesin kontrol yapıcam o yüzden private yaptım
  double _pi = 3.14; //adam bunu değiştiremeyecek o yüzden private yaptım.
  //Kurucu metod yarıçapı alacak ama sıkıntı şu eğer veriyi burdan verirse kontrol yok bu yüzden burdan vermek sağlıklı değil. bunun için setter metotlar var demiştik.
  CemberDaire(int yariCap) {
    _yariCapKontrol = yariCap;
  }

  //Set ile yarıçapın sıfırdan büyük olup olmama durumunu kontrol ettik. Eğer 0 dan büyükse gelen değeri _yarıcap değişkenine verdik küçük ise varsayılan olarak _yarıcap değişkenini 1 yaptık
  void set _yariCapKontrol(int deger) {
    if (deger > 0) {
      _yariCap = deger;
    } else {
      _yariCap = 1;
    }
  }
  //double döndüren bir cevreHesapla Metotu oluşturuyorum

  double cevreHesapla() {
    return 2 * _pi * _yariCap; //Çember çevre 2 pi r dir.
  }
  //double döndüren bir alan hesaplama Metotu oluşturuyorum
  double alanHesapla() {
    return _pi * _yariCap * _yariCap;//Çember alan pi r karedir
  }
}
