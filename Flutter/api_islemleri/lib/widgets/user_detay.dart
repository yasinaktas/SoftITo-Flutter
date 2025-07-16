import 'package:api_islemleri/model/user_model.dart';
import 'package:flutter/material.dart';

class UserDetay extends StatelessWidget {
  final UserModel userModel;
  const UserDetay({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("User Detay Sayfası", style: TextStyle(fontSize: 18)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ad: ${userModel.name}\nKullanıcı Adı: ${userModel.username}\nEmail: ${userModel.email}\nAdres: ${userModel.address.city}, ${userModel.address.street}, ${userModel.address.suite}\nEnlem: ${userModel.address.geo.lat}\nBoylam: ${userModel.address.geo.lng}",
            ),
          ],
        ),
      ),
    );
  }
}
