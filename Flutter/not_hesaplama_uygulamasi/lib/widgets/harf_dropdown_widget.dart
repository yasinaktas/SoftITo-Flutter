import 'package:flutter/material.dart';
import 'package:not_hesaplama_uygulamasi/constants/sabitler.dart';
import 'package:not_hesaplama_uygulamasi/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDeger = 4;
  @override
  Widget build(BuildContext context) {
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
            widget.onHarfSecildi(value);
          });
        },
      ),
    );
    ;
  }
}
