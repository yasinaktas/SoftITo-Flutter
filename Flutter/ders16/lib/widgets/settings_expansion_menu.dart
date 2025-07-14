import 'package:flutter/material.dart';

class SettingsExpansionMenu extends StatefulWidget {
  final PageStorageKey settingsKey;
  const SettingsExpansionMenu({super.key, required this.settingsKey});

  @override
  State<SettingsExpansionMenu> createState() => _SettingsExpansionMenuState();
}

class _SettingsExpansionMenuState extends State<SettingsExpansionMenu> {
  bool notificationEnabled = true;
  bool darkMode = false;
  bool fingerprintEnabled = false;
  bool autoSynch = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      key: widget.settingsKey,
      children: [
        ExpansionTile(
          key: PageStorageKey(0),
          shape: RoundedRectangleBorder(),
          title: const Text("Bildirimler"),
          leading: const Icon(Icons.notifications),
          children: [
            SwitchListTile(
              value: notificationEnabled,
              onChanged: (value) {
                setState(() {
                  notificationEnabled = value;
                });
              },
              title: Text("Bildirimleri Aç"),
            ),
            SwitchListTile(
              value: autoSynch,
              onChanged: (value) {
                setState(() {
                  autoSynch = value;
                });
              },
              title: Text("Otomatik Senkronizasyon"),
            ),
          ],
        ),
        ExpansionTile(
          key: PageStorageKey(1),
          title: const Text("Tema"),
          shape: RoundedRectangleBorder(),
          leading: Icon(Icons.color_lens),
          children: [
            SwitchListTile(
              title: Text("Karanlık Mode"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          key: PageStorageKey(2),
          title: const Text("Güvenlik"),
          shape: RoundedRectangleBorder(),
          leading: Icon(Icons.security),
          children: [
            SwitchListTile(
              title: Text("Parmakizi ile Giriş"),
              value: fingerprintEnabled,
              onChanged: (value) {
                setState(() {
                  fingerprintEnabled = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
