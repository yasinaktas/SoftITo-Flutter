import 'package:flutter/material.dart';

class Ornek2 extends StatelessWidget {
  const Ornek2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Örnek 2"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
      ),
      body: MyCardListView(),
    );
  }
}

class MyCardListView extends StatefulWidget {
  const MyCardListView({super.key});

  @override
  State<MyCardListView> createState() => _MyCardListViewState();
}

class _MyCardListViewState extends State<MyCardListView> {
  List<String> sportsList = [
    "Futbol",
    "Basketbol",
    "Hentbol",
    "Voleybol",
    "Masa Tenisi",
    "Beyzbol",
    "Rugby",
    "Tenis",
    "Su Topu",
  ];
  List<String> sportsImages = [
    "futbol.png",
    "basketbol.png",
    "hentbol.png",
    "voleybol.png",
    "masatenisi.png",
    "beyzbol.png",
    "rugby.png",
    "tenis.png",
    "sutopu.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: sportsList.length,
        itemBuilder: (ctx, index) {
          return MyCardItem(
            sport: sportsList[index],
            imagePath: sportsImages[index],
            index: index,
          );
        },
      ),
    );
  }
}

class MyCardItem extends StatefulWidget {
  final int index;
  final String sport;
  final String imagePath;
  const MyCardItem({
    super.key,
    required this.sport,
    required this.imagePath,
    required this.index,
  });

  @override
  State<MyCardItem> createState() => _MyCardItemState();
}

class _MyCardItemState extends State<MyCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("resimler/sports/${widget.imagePath}"),
        ),
        //leading: CircleAvatar(child: Text("${widget.index + 1}")),
        title: Text(widget.sport),
        subtitle: Text("${widget.index + 1}-${widget.sport}"),
        trailing: Icon(Icons.play_arrow),
      ),
    );
  }
}
