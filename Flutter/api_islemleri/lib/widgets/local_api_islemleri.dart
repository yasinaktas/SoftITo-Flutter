import 'dart:convert';

import 'package:api_islemleri/model/araba_model.dart';
import 'package:flutter/material.dart';

class LocalApiIslemleri extends StatefulWidget {
  const LocalApiIslemleri({super.key});

  @override
  State<LocalApiIslemleri> createState() => _LocalApiIslemleriState();
}

class _LocalApiIslemleriState extends State<LocalApiIslemleri> {
  late Future<List<ArabaModel>> arabalar;
  @override
  void initState() {
    super.initState();
    arabalar = arabalarJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Local Api"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: arabalar,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ArabaModel> arabaList = snapshot.data!;
              return ListView.builder(
                itemCount: arabaList.length,
                itemBuilder: (context, index) {
                  ArabaModel arabaModel = arabaList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 48,
                      child: Text(arabaModel.kurulusYili.toString()),
                    ),
                    title: Text(arabaModel.arabaAdi),
                    subtitle: Text(arabaModel.ulke),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<List<ArabaModel>> arabalarJsonOku() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      String okunanString = await DefaultAssetBundle.of(
        context,
      ).loadString("data/arabalar.json");

      // Stringi jsona dönüştürme
      var jsonObject = jsonDecode(okunanString);
      List<ArabaModel> tumArabalar = (jsonObject as List)
          .map((arabaMap) => ArabaModel.fromJson(arabaMap))
          .toList();
      return tumArabalar;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
