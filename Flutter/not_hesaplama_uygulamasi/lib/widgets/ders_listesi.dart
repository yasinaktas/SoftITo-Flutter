import 'package:flutter/material.dart';
import 'package:not_hesaplama_uygulamasi/constants/sabitler.dart';
import 'package:not_hesaplama_uygulamasi/helper/data_helper.dart';
import 'package:not_hesaplama_uygulamasi/models/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({super.key, required this.onElemanCikarildi});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  onElemanCikarildi(index);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.startToEnd,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(tumDersler[index].ad),
                        subtitle: Text(
                          "Kredi: ${tumDersler[index].krediDegeri} | Not Değeri: ${tumDersler[index].harfDegeri.toString()}",
                        ),
                        leading: CircleAvatar(
                          radius: 36,
                          backgroundColor: Sabitler.anaRenk.shade600,
                          child: Text(
                            "${tumDersler[index].harfDegeri * tumDersler[index].krediDegeri}",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            alignment: Alignment.center,
            child: Text(
              "Lütfen Ders Ekleyiniz",
              style: TextStyle(fontSize: 20, fontFamily: "Rajdhani"),
            ),
          );
  }
}
