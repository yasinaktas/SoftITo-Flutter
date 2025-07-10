import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HostPage());
  }
}

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Form Field Kullanımı"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: TextFormFieldKullanimi(),
    );
  }
}

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  late final String _userName, _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 20,
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      _userName = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.orange),
                    labelText: "Kullanıcı Adı",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  validator: (girilenUsername) {
                    if (girilenUsername!.isEmpty) {
                      return "Kullanıcı adı boş olamaz";
                    }
                    if (girilenUsername.length <= 4) {
                      return "5 karakterden az olamaz";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      _email = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.orange),
                    labelText: "E-mail",
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (girilenEmail) {
                    if (!EmailValidator.validate(girilenEmail!)) {
                      return "Lütfen geçerli bir email giriniz!";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    setState(() {
                      _password = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.orange),
                    labelText: "Şifre",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (girilenPassword) {
                    if (girilenPassword!.isEmpty) {
                      return "Şifre boş olamaz";
                    }
                    if (girilenPassword.length <= 5) {
                      return "Şifre en az 6 karakter olmalı";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            bool _isValidate = _formKey.currentState!
                                .validate();
                            if (_isValidate) {
                              _formKey.currentState!.save();
                              String result =
                                  "Username:\t\t$_userName\nEmail:\t$_email\nPassword:\t\t$_password";
                              debugPrint(result);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    result,
                                    style: TextStyle(fontFamily: 'Courier'),
                                  ),
                                ),
                              );
                              _formKey.currentState!.reset();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text("Onayla"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
