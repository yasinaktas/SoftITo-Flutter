import 'dart:math';

class VeriTabaniIslemleri {
  //Veri tabanına bağlanmak için gerekenler

  String _kullaniciAdi = "bilal";
  String _sifre = "123456";

  bool baglan() {
    if (_internetVarmi()) {
      if (_kullaniciAdi == "bilal" && _sifre == "123456") {
        //başarılı giriş
        return true;
      } else {
        //başarısız giriş
        return false;
      }
    } else {
      return false;
    }
  }

  bool _internetVarmi() {
    bool baglanti = Random().nextBool();
    if (baglanti) {
      //true, false
      return true;
    } else {
      return false;
    }
  }
}
