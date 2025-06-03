void main(List<String> args) {
  /*User user1 = AdminUser(); // Upcasting
  User user2 = User();
  User user3 = NormalUser();
  User user4 = SadeceOkuyabilenNormalUser();
  List<User> users =
      []; // Polymorphism, farklı veri türlerini tek veri tipi altında kullanabilme
  users.add(user1);
  users.add(user2);
  users.add(user3);
  users.add(user4);

  for (User user in users) {
    user.girisYap(); // Polymorphism sayesinde farklı user türleri için girisYap metodu çağrılabilir
  }*/

  Kisi yasin = Kisi("yasin", 27);
  yasin.kendiniTanit();

  Calisan kader = Calisan("kader", 25, 9000.0);
  kader.kendiniTanit();
}

abstract class Hayvan {
  void sesCikar();
}

abstract class UcanHayvan extends Hayvan {
  void uc();
}

class Kus extends UcanHayvan {
  @override
  void sesCikar() {
    print("Cik cik");
  }

  @override
  void uc() {
    print("Kuş uçuyor");
  }
}

class Kisi {
  String isim;
  int yas;
  Kisi(this.isim, this.yas);

  void kendiniTanit() {
    print("Benim adım $isim ve yaşım $yas");
  }
}

class Calisan extends Kisi {
  double maas;
  Calisan(String isim, int yas, this.maas) : super(isim, yas);

  void kendiniTanit() {
    print("Benim adım $isim, yaşım $yas ve maaşım $maas TL");
  }
}

void kimGirisYapti(User user) {
  user.girisYap();
}

class User {
  String email = "";
  String sifre = "";

  User(this.email, this.sifre) {
    print("User constructor çağrıldı");
  }

  void girisYap() {
    print("Ana user giriş yaptı");
  }
}

class NormalUser extends User {
  NormalUser(String email, String sifre) : super(email, sifre) {
    print("Normal user constructor çağrıldı");
  }

  void davetEt() {
    print("Normal user davet ediyor");
  }

  @override
  void girisYap() {
    print("Normal user giriş yaptı");
  }
}

class SadeceOkuyabilenNormalUser extends NormalUser {
  SadeceOkuyabilenNormalUser(String email, String sifre) : super(email, sifre) {
    print("Sadece okuyabilen normal user constructor çağrıldı");
  }
  void sadeceOku() {
    print("Bu user sadece okuyabilir");
  }

  @override
  void girisYap() {
    print("Sadece okuyabilen normal user giriş yaptı");
  }
}

class AdminUser extends User {
  AdminUser(String email, String sifre) : super(email, sifre) {
    print("Admin user constructor çağrıldı");
  }
  void kisiSayisiGoruntule() {
    print("Kullanıcı sayısı 20");
  }

  @override
  void girisYap() {
    print("Admin user giriş yaptı");
  }
}
