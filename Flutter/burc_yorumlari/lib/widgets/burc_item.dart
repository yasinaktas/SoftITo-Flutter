import 'package:burc_yorumlari/models/burc.dart';
import 'package:burc_yorumlari/pages/burc_detay.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc gelenBurc;
  const BurcItem({super.key, required this.gelenBurc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: gelenBurc),
                ),
              );
            },
            leading: Image.asset("images/${gelenBurc.burcKucukResim}"),
            title: Text(
              gelenBurc.burcAdi,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              gelenBurc.burcTarih,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
