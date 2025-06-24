import 'package:flutter/material.dart';

class FormsKullanimi extends StatefulWidget {
  const FormsKullanimi({super.key});

  @override
  State<FormsKullanimi> createState() => _FormsKullanimiState();
}

class _FormsKullanimiState extends State<FormsKullanimi> {
  // Validate kontrolü için gereken key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tfKullaniciAdi = TextEditingController();
  TextEditingController tfSifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms Kullanımı"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 15,
                  children: [
                    TextFormField(
                      controller: tfKullaniciAdi,
                      validator: (tfKullaniciAdi) {
                        if (tfKullaniciAdi!.isEmpty) {
                          return "Kullanıcı adı boş olamaz";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Kullanıcı Adı",
                      ),
                    ),
                    TextFormField(
                      controller: tfSifre,
                      validator: (tfSifre) {
                        if (tfSifre!.isEmpty) {
                          return "Şifre boş olamaz";
                        }
                        if (tfSifre.length < 6) {
                          return "Şifre en az 6 karakter olmalıdır!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Şifre",
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              foregroundColor: Colors.blueAccent,
                            ),
                            onPressed: () {
                              // true dönerse validate'ler null demektir, işlemler uygun demektir.
                              // false dönerse hata stringleri dönmüş demektir.
                              bool kontrolSonuc = formKey.currentState!
                                  .validate();
                              if (kontrolSonuc) {
                                String userName = tfKullaniciAdi.text;
                                String userPass = tfSifre.text;
                                print(
                                  "Kullanıcı adı: $userName, Kullanıcı şifre: $userPass",
                                );
                              }
                            },
                            child: Text("Giriş Yap"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Form'da validate yapabilmek için GlobalKey türünde bir key vardır.
