import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreKullanimi extends StatefulWidget {
  const FirestoreKullanimi({super.key});

  @override
  State<FirestoreKullanimi> createState() => _FirestoreKullanimiState();
}

class _FirestoreKullanimiState extends State<FirestoreKullanimi> {
  final String email = "yappsmobile@gmail.com";
  final String password = "pass123";
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;

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
        firestore = FirebaseFirestore.instance;
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
                _veriEklemeAdd();
              },
              child: Text("Add ile veri ekle"),
            ),
            ElevatedButton(
              onPressed: () {
                _veriEklemeSet();
              },
              child: Text("Set ile veri ekle"),
            ),
          ],
        ),
      ),
    );
  }

  void _veriEklemeSet() async {
    /*await firestore.doc("users/JdNo88x8YH2l6vtgWcYv").set({
      "okul": "YTÜ",
    }, SetOptions(merge: true));*/
    var yeniDocID = firestore.collection("users").doc().id;
    Map<String, dynamic> eklenecekUser = {};
    eklenecekUser["userID"] = yeniDocID;
    eklenecekUser["name"] = "Zeynep";
    eklenecekUser["age"] = 20;
    eklenecekUser["school"] = "İÜ";
    eklenecekUser["createdAt"] = FieldValue.serverTimestamp();
    await firestore
        .doc("users/$yeniDocID")
        .set(eklenecekUser, SetOptions(merge: true));
  }

  void _veriEklemeAdd() async {
    Map<String, dynamic> eklenecekler = {};
    eklenecekler["name"] = "Yakup";
    eklenecekler["age"] = 24;
    eklenecekler["isStudent"] = true;
    eklenecekler["address"] = {
      "city": "İstanbul",
      "district": "Bahçelievler",
      "street": "Kocasinan",
    };
    eklenecekler["colors"] = FieldValue.arrayUnion(["kırmızı", "beyaz"]);
    await firestore.collection("users").add(eklenecekler);
  }
}
