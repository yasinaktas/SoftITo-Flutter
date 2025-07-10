import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyStepperApp());
  }
}

class MyStepperApp extends StatefulWidget {
  const MyStepperApp({super.key});

  @override
  State<MyStepperApp> createState() => _MyStepperAppState();
}

class _MyStepperAppState extends State<MyStepperApp> {
  int _aktifStep = 0;
  String kullaniciAdi = "", mail = "", sifre = "";
  late List<Step> tumStepler;
  var keyName = GlobalKey<FormFieldState>();
  var keyMail = GlobalKey<FormFieldState>();
  var keyPassword = GlobalKey<FormFieldState>();
  bool hata = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Uygulaması"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: _aktifStep,
          onStepContinue: () {
            setState(() {
              _ileriButonuKontrolu();
            });
          },
          onStepCancel: () {
            if (_aktifStep > 0) {
              setState(() {
                _aktifStep--;
              });
            }
          },
          onStepTapped: (value) {
            setState(() {
              _aktifStep = value;
            });
          },
          steps: tumStepler,
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username"),
        subtitle: Text("Lütfen kullanıcı adını giriniz"),
        state: stateleriAyarla(0),
        isActive: true,
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
            key: keyName,
            decoration: InputDecoration(
              labelText: "Username",
              hintText: "Kullanıcı Adı",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Boş bırakılamaz";
              }
              if (value.length < 6) {
                return "En az 6 karakter girilmeli";
              }
              return null;
            },
            onSaved: (newValue) {
              kullaniciAdi = newValue!;
            },
          ),
        ),
      ),
      Step(
        title: Text("Mail"),
        subtitle: Text("Lütfen email giriniz"),
        state: stateleriAyarla(1),
        isActive: true,
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
            key: keyMail,
            validator: (value) {
              if (!value!.contains("@")) {
                return "Lütfen geçerli bir email giriniz";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "E-Mail",
              hintText: "E-Posta",
              border: OutlineInputBorder(),
            ),
            onSaved: (newValue) {
              mail = newValue!;
            },
          ),
        ),
      ),
      Step(
        title: Text("Password"),
        subtitle: Text("Lütfen şifre giriniz"),
        state: stateleriAyarla(2),
        isActive: true,
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
            key: keyPassword,
            validator: (value) {
              if (value!.length < 5) {
                return "En az 5 karakterden oluşmalı!";
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Şifre",
              border: OutlineInputBorder(),
            ),
            onSaved: (newValue) {
              sifre = newValue!;
            },
          ),
        ),
      ),
    ];
    return stepler;
  }

  StepState stateleriAyarla(int oAnkiStep) {
    if (_aktifStep == oAnkiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    }
    return StepState.complete;
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (keyName.currentState!.validate()) {
          keyName.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (keyMail.currentState!.validate()) {
          keyMail.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (keyPassword.currentState!.validate()) {
          keyPassword.currentState!.save();
          hata = false;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    String result =
        "Girilen değerler: isim => $kullaniciAdi, mail => $mail, şifre => $sifre";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }
}
