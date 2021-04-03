import 'package:flutter/material.dart';
import 'package:lumi/theme/constants/colors.dart';

class LumiCardFilm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 200,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            color: Colors.blue),
      ),
      Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4)),
            color: LUMI_DARK_PURPLE),
        child: _label,
      )
    ]);
  }

  get _label => Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Interestelar',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, color: LUMI_WHITE)),
          Text('Narrativas Multimídia',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: LUMI_WHITE))
        ]),
      );
}
