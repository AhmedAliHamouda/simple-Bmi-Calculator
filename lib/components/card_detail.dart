import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CardDetailMF extends StatelessWidget {
  final IconData typeChar;
  final String typeName;

  CardDetailMF(this.typeChar, this.typeName);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          typeChar,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        AutoSizeText(
          typeName,
         style: kStyleText,

          ),
      ],
    );
  }
}
