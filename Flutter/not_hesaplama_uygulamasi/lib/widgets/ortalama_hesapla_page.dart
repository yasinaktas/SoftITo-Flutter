import 'package:flutter/material.dart';
import 'package:not_hesaplama_uygulamasi/constants/sabitler.dart';
import 'package:not_hesaplama_uygulamasi/helper/data_helper.dart';
import 'package:not_hesaplama_uygulamasi/models/ders.dart';
import 'package:not_hesaplama_uygulamasi/widgets/ders_listesi.dart';
import 'package:not_hesaplama_uygulamasi/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  final formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        foregroundColor: Sabitler.baslikRengi,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Container(child: _buildForm())),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  ortalama: DataHelper.ortalamaHesapla(),
                  dersSayisi: DataHelper.tumEklenecekDersler.length,
                ),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                setState(() {
                  DataHelper.tumEklenecekDersler.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // textFormField gelecek
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: _buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Harf DropdownButton gelecek
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 8,
                  ),
                  child: _buildHarfler(),
                ),
              ),
              // Kredi DropdownButton gelecek
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 8,
                  ),
                  child: _buildKrediler(),
                ),
              ),
              //IconButton gelecek
              IconButton(
                onPressed: () {
                  _dersEkleVeOrtalamaHesapla();
                },
                icon: Icon(Icons.arrow_forward_ios, color: Sabitler.anaRenk),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
        filled: true,
        fillColor: Sabitler.anaRenk.shade50,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ders adını giriniz!";
        }
        return null;
      },
      onSaved: (newValue) {
        setState(() {
          girilenDersAdi = newValue!;
        });
      },
    );
  }

  Widget _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade50,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        focusColor: Colors.transparent,
        underline: Container(),
        value: secilenHarfDeger,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(() {
            secilenHarfDeger = value!;
          });
        },
      ),
    );
  }

  Widget _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade50,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        focusColor: Colors.transparent,
        underline: Container(),
        value: secilenKrediDeger,
        items: DataHelper.dropDownKrediMenuBilgisi(),
        onChanged: (value) {
          setState(() {
            secilenKrediDeger = value!;
          });
        },
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Ders eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDeger,
        krediDegeri: secilenKrediDeger,
      );
      DataHelper.dersEkle(eklenecekDers);

      setState(() {});
    }
  }
}
