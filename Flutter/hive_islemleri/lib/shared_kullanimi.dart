import 'package:flutter/material.dart';
import 'package:hive_islemleri/models/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedKullanimi extends StatefulWidget {
  const SharedKullanimi({super.key});

  @override
  State<SharedKullanimi> createState() => _SharedKullanimiState();
}

class _SharedKullanimiState extends State<SharedKullanimi> {
  var _secilenCinsiyet = Cinsiyet.kadin;
  var _secilenRenkler = <String>[];
  var _ogrenciMi = false;

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _verileriOku();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Shared Preferences"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 0, color: Colors.grey.shade300),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4),
        children: [
          ListTile(
            title: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Adınızı Giriniz"),
            ),
          ),
          _buildRadioListTile("Kadın", Cinsiyet.kadin),
          _buildRadioListTile("Erkek", Cinsiyet.erkek),
          _buildRadioListTile("Diğer", Cinsiyet.diger),
          for (Renkler renk in Renkler.values) _buildCheckBoxListTile(renk),
          SwitchListTile(
            title: Text("Öğrenci Misin"),
            value: _ogrenciMi,
            onChanged: (value) {
              setState(() {
                _ogrenciMi = value;
              });
            },
          ),
          TextButton(
            onPressed: () {
              _verileriKaydet();
            },
            child: Text("Kaydet"),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioListTile(String title, Cinsiyet cinsiyet) {
    return RadioListTile(
      value: cinsiyet,
      title: Text(title),
      groupValue: _secilenCinsiyet,
      onChanged: (value) {
        setState(() {
          _secilenCinsiyet = value!;
        });
      },
    );
  }

  Widget _buildCheckBoxListTile(Renkler renk) {
    return CheckboxListTile(
      title: Text(renk.name.toUpperCase()),
      value: _secilenRenkler.contains(renk.name),
      onChanged: (value) {
        if (value == false) {
          _secilenRenkler.remove(renk.name);
        } else {
          _secilenRenkler.add(renk.name);
        }
        setState(() {});
        debugPrint(_secilenRenkler.toString());
      },
    );
  }

  void _verileriKaydet() async {
    final String name = controller.text;
    final preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
    preferences.setBool("ogrenci", _ogrenciMi);
    preferences.setInt("cinsiyet", _secilenCinsiyet.index);
    preferences.setStringList("renkler", _secilenRenkler);
  }

  void _verileriOku() async {
    final preferences = await SharedPreferences.getInstance();
    controller.text = preferences.getString("name") ?? "";
    _ogrenciMi = preferences.getBool("ogrenci") ?? true;
    _secilenCinsiyet = Cinsiyet.values[preferences.getInt("cinsiyet") ?? 0];
    _secilenRenkler = preferences.getStringList("renkler") ?? [];

    setState(() {});
  }
}
