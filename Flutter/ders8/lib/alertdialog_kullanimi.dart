import 'package:flutter/material.dart';

class AlertDialogKullanimi extends StatefulWidget {
  const AlertDialogKullanimi({super.key});

  @override
  State<AlertDialogKullanimi> createState() => _AlertDialogKullanimiState();
}

class _AlertDialogKullanimiState extends State<AlertDialogKullanimi> {
  String answer = "";
  TextEditingController tf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Uyarı"),
                    content: Text("Silmek istediğinize emin misiniz?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            answer = "Evet";
                          });
                        },
                        child: Text("Evet"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            answer = "Hayır";
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Hayır"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Basic Alert"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Özel Alert",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: SizedBox(
                      height: 80,
                      child: Column(
                        children: [
                          TextField(
                            controller: tf,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: Text("Veri"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("İptal"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            answer = tf.text;
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Veri Oku"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Custom Alert"),
            ),
            Text(answer != "" ? "Verilen Cevap: $answer" : ""),
          ],
        ),
      ),
    );
  }
}
