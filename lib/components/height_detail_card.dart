import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class HeightDetail extends StatefulWidget {
  HeightDetail({ @required this.valueSlider, @required this.cc});

   final Function cc;
   final int valueSlider;
  @override
  _HeightDetailState createState() => _HeightDetailState();
}

class _HeightDetailState extends State<HeightDetail> {
   //int valueSlider = 170;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AutoSizeText(
          'HEIGHT',
          style: kStyleText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            AutoSizeText(
              widget.valueSlider.toString(),
              style: kStyleNumber,
            ),
            AutoSizeText(
              'cm',
              style: kStyleText,
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: kActiveColorSlider,
            inactiveTrackColor: kInactiveColorSlider,
            thumbColor: kThumbColor,
            overlayColor: kThumbOverlayColor,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: widget.valueSlider.toDouble(),
            min: kMinSlider,
            max: kMaxSlider,
            onChanged: widget.cc,
          ),
        )
      ],
    );
  }
}
