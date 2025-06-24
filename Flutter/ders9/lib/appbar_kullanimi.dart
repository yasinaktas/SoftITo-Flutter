import 'package:flutter/material.dart';

class AppBarKullanimi extends StatefulWidget {
  const AppBarKullanimi({super.key});

  @override
  State<AppBarKullanimi> createState() => _AppBarKullanimiState();
}

class _AppBarKullanimiState extends State<AppBarKullanimi> {
  bool aramaYapiliyorMu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: aramaYapiliyorMu
            ? TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Aramak için bir şeyler yazın",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                onChanged: (aramaGirdisi) {
                  debugPrint("Arama sonucu: $aramaGirdisi");
                },
                onSubmitted: (aramaGirdisi) {
                  debugPrint("Arama sonucu: $aramaGirdisi");
                },
              )
            : Text("AppBar Arama"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: Icon(Icons.cancel),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class PopupMenuAppBar extends StatelessWidget {
  const PopupMenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AppBar Kullanımı",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Flutter Uygulamaları",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            debugPrint("Menü tıklandı");
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("Çıkış yapıldı");
            },
            child: Text("Çıkış", style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () => debugPrint("Bilgi alındı"),
            icon: Icon(Icons.info_outline),
          ),
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text("Güncelle")),
              PopupMenuItem(value: 1, child: Text("Sil")),
            ],
            onSelected: (value) {
              if (value == 1) {
                debugPrint("Güncellendi");
              }
              if (value == 2) {
                debugPrint("Silindi");
              }
            },
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

class AppBarNormal extends StatelessWidget {
  const AppBarNormal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AppBar Kullanımı",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Flutter Uygulamaları",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            debugPrint("Menü tıklandı");
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("Çıkış yapıldı");
            },
            child: Text("Çıkış", style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () => debugPrint("Bilgi alındı"),
            icon: Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () => debugPrint("Menü açıldı"),
            icon: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
    );
  }
}
