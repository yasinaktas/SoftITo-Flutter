import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WeatherApp());
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    Color colorDark = const Color.fromARGB(255, 1, 96, 174);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        padding: EdgeInsets.only(top: 72, left: 32, right: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset("resimler/konum.png"),
                  SizedBox(width: 24),
                  Text(
                    "Fortaleze",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 24),
                  Image.asset("resimler/alt_ok.png"),
                  Expanded(child: Container()),
                  Image.asset("resimler/bildirim.png"),
                ],
              ),
              SizedBox(
                width: 225,
                height: 225,
                child: Image.asset(
                  "resimler/hava_resim.png",
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "28°",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Precipitations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Max.:31°Max.:25°",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: colorDark,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset("resimler/yagmur.png"),
                        SizedBox(width: 4),
                        Text("6%", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("resimler/derece_icon.png"),
                        SizedBox(width: 4),
                        Text("90%", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("resimler/ruzgar_hiz.png"),
                        SizedBox(width: 4),
                        Text("19 km/h%", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: colorDark,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Mar,9",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "29°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "resimler/gunesli.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "15:00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "26°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "resimler/gunesli.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "16:00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "24°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "resimler/durgun.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "17:00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "23°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "resimler/gece.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              "18:00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: colorDark,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Next Forecast",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Image.asset("resimler/takvim.png"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Monday",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Image.asset("resimler/mavi_yagmur.png"),
                          Row(
                            children: [
                              Text(
                                "13°C",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "10°C",
                                style: TextStyle(
                                  color: Colors.white.withAlpha(150),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Tuesday",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Image.asset("resimler/yildirim.png"),
                          Row(
                            children: [
                              Text(
                                "17°C",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "12°C",
                                style: TextStyle(
                                  color: Colors.white.withAlpha(150),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Wednesday",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Image.asset("resimler/gunes_yagmur.png"),
                          Row(
                            children: [
                              Text(
                                "17°C",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "12°C",
                                style: TextStyle(
                                  color: Colors.white.withAlpha(150),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
