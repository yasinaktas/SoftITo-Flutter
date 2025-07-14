import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  final PageStorageKey expansionKey;
  const ExpansionTilePage({super.key, required this.expansionKey});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.expansionKey,
      itemCount: 40,
      itemBuilder: (context, index) {
        return ExpansionTile(
          //initiallyExpanded: true,
          //maintainState: true,
          key: PageStorageKey(index),
          title: Text("Başlık ${index + 1}"),
          leading: CircleAvatar(child: Text("${index + 1}")),
          children: [
            Container(
              color: index % 2 == 0
                  ? Colors.orangeAccent.shade200
                  : Colors.indigo.shade200,
              height: 200,
            ),
          ],
        );
      },
    );
  }
}
