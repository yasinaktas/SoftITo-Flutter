import 'package:flutter/material.dart';

class ListeOrnek extends StatefulWidget {
  final PageStorageKey listKey;
  const ListeOrnek({super.key, required this.listKey});

  @override
  State<ListeOrnek> createState() => _ListeOrnekState();
}

class _ListeOrnekState extends State<ListeOrnek> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.listKey,
      itemExtent: 200,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            color: index % 2 == 0
                ? Colors.orangeAccent.shade200
                : Colors.indigo.shade200,
            child: Center(child: Text("Kutu $index")),
          ),
        );
      },
    );
  }
}
