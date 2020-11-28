import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String textBottomButton;
  final Function onTapButton;
  BottomButton({@required this.textBottomButton, @required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            textBottomButton,
            style: kButtonStyle,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFEB1555),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}