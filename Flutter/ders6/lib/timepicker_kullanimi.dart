import 'package:flutter/material.dart';

class TimePickerKullanimi extends StatefulWidget {
  const TimePickerKullanimi({super.key});

  @override
  State<TimePickerKullanimi> createState() => _TimePickerKullanimiState();
}

class _TimePickerKullanimiState extends State<TimePickerKullanimi> {
  TextEditingController tfSaat = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Picker Kullanımı")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: TextField(
                    readOnly: true,
                    controller: tfSaat,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Saat Seçiniz",
                      border: OutlineInputBorder(),
                      prefixIcon: GestureDetector(
                        child: Icon(Icons.access_time_outlined),
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((time) {
                            setState(() {
                              tfSaat.text = "${time!.hour}.${time.minute}";
                            });
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 2, child: Container(height: 50)),
            ],
          ),
        ),
      ),
    );
  }
}

class TimePickerExample extends StatefulWidget {
  const TimePickerExample({super.key, required this.tfSaat});

  final TextEditingController tfSaat;

  @override
  State<TimePickerExample> createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.tfSaat,
      decoration: InputDecoration(
        hintText: "Saat Giriniz",
        border: OutlineInputBorder(),
      ),
      onTap: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        ).then((alinanSaat) {
          widget.tfSaat.text = alinanSaat != null
              ? "${alinanSaat.hour < 10 ? "0" : ""}${alinanSaat.hour}.${alinanSaat.minute < 10 ? "0" : ""}${alinanSaat.minute}"
              : "${DateTime.now().hour}.${DateTime.now().minute}";
        });
      },
    );
  }
}
