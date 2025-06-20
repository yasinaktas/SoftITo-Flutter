import 'package:flutter/material.dart';

class DatePickerKullanimi extends StatefulWidget {
  const DatePickerKullanimi({super.key});

  @override
  State<DatePickerKullanimi> createState() => _DatePickerKullanimiState();
}

class _DatePickerKullanimiState extends State<DatePickerKullanimi> {
  TextEditingController tfTarih = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker Kullanımı"),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white10,
      ),
      body: Center(
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                readOnly: true,
                controller: tfTarih,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Tarih seçiniz",
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2050),
                  ).then((tarih) {
                    setState(() {
                      tfTarih.text =
                          "${tarih!.day}/${tarih.month}/${tarih.year}";
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
