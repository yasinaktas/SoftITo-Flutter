import 'package:burc_yorumlari/models/burc.dart';
import 'package:burc_yorumlari/data/strings.dart';
import 'package:burc_yorumlari/widgets/burc_item.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatefulWidget {
  const BurcListesi({super.key});

  @override
  State<BurcListesi> createState() => _BurcListesiState();
}

class _BurcListesiState extends State<BurcListesi> {
  late final List<Burc> tumBurclar;

  @override
  void initState() {
    super.initState();
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Listesi"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tumBurclar.length,
          itemBuilder: (context, index) {
            return BurcItem(gelenBurc: tumBurclar[index]);
          },
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      Burc eklenecekBurc = Burc(
        burcAdi: Strings.BURC_ADLARI[i],
        burcTarih: Strings.BURC_TARIHLERI[i],
        burcDetay: Strings.BURC_GENEL_OZELLIKLERI[i],
        burcKucukResim: ("${Strings.BURC_ADLARI[i]}${i + 1}.png").toLowerCase(),
        burcBuyukResim: ("${Strings.BURC_ADLARI[i]}_buyuk${i + 1}.png")
            .toLowerCase(),
      );
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
