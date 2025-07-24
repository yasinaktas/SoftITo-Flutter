import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasemyproject/firebase_options.dart';
import 'package:firebasemyproject/firestore_kullanimi.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirestoreKullanimi());
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String email = "yappsmobile@gmail.com";
  final String password = "pass123";
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      if (user == null) {
        // Oturum kapalı
        debugPrint("Kullanıcı oturum kapattı");
      } else {
        // Oturum açık
        if (!user.emailVerified) {
          user.sendEmailVerification();
        }
        debugPrint(
          "Kullanıcı oturum açtı: ${user.email}, email durumu: ${user.emailVerified}",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase İşlemleri")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            ElevatedButton(
              onPressed: () {
                _createUserEmailAndPassword();
              },
              child: Text("Kayıt Ol"),
            ),
            ElevatedButton(
              onPressed: () {
                _loginUserEmailAndPassword();
              },
              child: Text("Giriş Yap"),
            ),
            ElevatedButton(
              onPressed: () {
                _signOut();
              },
              child: Text("Çıkış Yap"),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteUser();
              },
              child: Text("Kullanıcı Sil"),
            ),
            ElevatedButton(
              onPressed: () {
                _changePassword();
              },
              child: Text("Parola Değiştir"),
            ),
            ElevatedButton(
              onPressed: () {
                _changeEmail();
              },
              child: Text("Email Değiştir"),
            ),
          ],
        ),
      ),
    );
  }

  void _createUserEmailAndPassword() async {
    try {
      var userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint(userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _loginUserEmailAndPassword() async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _signOut() async {
    await auth.signOut();
  }

  void _deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
    } else {
      debugPrint("Önce oturum açmalısın!");
    }
  }

  void _changePassword() async {
    try {
      await auth.currentUser!.updatePassword("yenisifre");
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        debugPrint("Tekrar oturum açmalı");
        var credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await auth.currentUser!.updatePassword("yenisifre");
        await auth.signOut();
        debugPrint("Şifre güncellendi");
      }
    }
  }

  void _changeEmail() async {
    try {
      await auth.currentUser!.verifyBeforeUpdateEmail(
        "yasinaktasdev@gmail.com",
      );
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        debugPrint("Tekrar oturum açmalı");
        var credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        await auth.currentUser!.reauthenticateWithCredential(credential);
        await auth.currentUser!.verifyBeforeUpdateEmail(
          "yasinaktasdev@gmail.com",
        );
        await auth.signOut();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
