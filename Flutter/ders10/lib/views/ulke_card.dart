import 'package:flutter/material.dart';

class UlkeCard extends StatefulWidget {
  final int index;
  final String ulke;
  const UlkeCard({super.key, required this.index, required this.ulke});

  @override
  State<UlkeCard> createState() => _UlkeCardState();
}

class _UlkeCardState extends State<UlkeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        color: widget.index % 2 == 0 ? Colors.green : Colors.pink,
        child: Container(
          alignment: Alignment.center,
          height: 85,
          child: ListTile(
            title: Text(widget.ulke, style: TextStyle(color: Colors.white)),
            leading: CircleAvatar(child: Text("${widget.index + 1}")),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
