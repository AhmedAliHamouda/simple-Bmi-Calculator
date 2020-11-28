import 'package:flutter/material.dart';

class CardBackgroundColor extends StatelessWidget {

   final Color backgroundColor;
   final Widget childCard;
   final Function onPress;
  CardBackgroundColor( {this.backgroundColor,this.childCard,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgroundColor,
        ),
      ),
    );
  }
}
