import 'package:flutter/material.dart';

class ProgressbarSliderKullanimi extends StatefulWidget {
  const ProgressbarSliderKullanimi({super.key});

  @override
  State<ProgressbarSliderKullanimi> createState() =>
      _ProgressbarSliderKullanimiState();
}

class _ProgressbarSliderKullanimiState
    extends State<ProgressbarSliderKullanimi> {
  bool showProgressbar = false;
  double sliderProgress = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progressbar - Slider Kullanımı"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Visibility(
                visible: showProgressbar,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.lightGreen),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showProgressbar = true;
                });
              },
              child: Text("Başlat"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showProgressbar = false;
                });
              },
              child: Text("Durdur"),
            ),
            SizedBox(height: 20),
            Text("Slider Değeri: ${sliderProgress.toInt()}"),
            Slider(
              min: 0,
              max: 100,
              thumbColor: Colors.amber,
              activeColor: Colors.blue,
              inactiveColor: Colors.green,
              value: sliderProgress,
              onChanged: (newValue) {
                setState(() {
                  sliderProgress = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
