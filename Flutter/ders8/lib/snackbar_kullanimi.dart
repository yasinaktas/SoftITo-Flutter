import 'package:flutter/material.dart';

class SnackbarKullanimi extends StatefulWidget {
  const SnackbarKullanimi({super.key});

  @override
  State<SnackbarKullanimi> createState() => _SnackbarKullanimiState();
}

class _SnackbarKullanimiState extends State<SnackbarKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar Kullanımı"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withAlpha(128),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Merhaba"),
                    backgroundColor: Colors.amber,
                    showCloseIcon: true,
                  ),
                );
              },
              child: Text("Varsayılan"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek istiyor musunuz?"),
                    action: SnackBarAction(
                      label: "Evet",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Silindi!"),
                            showCloseIcon: true,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Text("Snackbar Action"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("İnternet Bağlantısı Yok!"),
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: "Tekrar Dene",
                      onPressed: () {
                        print("Tekrar denendi");
                      },
                    ),
                  ),
                );
              },
              child: Text("Snackbar Özel"),
            ),
          ],
        ),
      ),
    );
  }
}
