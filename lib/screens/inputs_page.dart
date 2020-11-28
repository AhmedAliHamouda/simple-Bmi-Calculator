import 'package:simple_bmi_calculator/bmi_calculate_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_bmi_calculator/components/background_card_color.dart';
import '../components/card_detail.dart';
import '../constants.dart';
import '../components/height_detail_card.dart';
import 'package:simple_bmi_calculator/components/weight_age_details.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType genderType;
  int height = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        //dragStartBehavior: DragStartBehavior.start,

        child: Container(
          height: 680,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CardBackgroundColor(
                        onPress: () {
                          setState(() {
                            genderType = GenderType.male;
                          });
                        },
                        backgroundColor: genderType == GenderType.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childCard: CardDetailMF(FontAwesomeIcons.mars, 'MALE'),
                      ),
                    ),
                    Expanded(
                      child: CardBackgroundColor(
                        onPress: () {
                          setState(() {
                            genderType = GenderType.female;
                          });
                        },
                        backgroundColor: genderType == GenderType.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        childCard:
                            CardDetailMF(FontAwesomeIcons.venus, 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: CardBackgroundColor(
                  backgroundColor: kActiveCardColor,
                  childCard: HeightDetail(
                    valueSlider: height,
                    cc: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CardBackgroundColor(
                        backgroundColor: kActiveCardColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kStyleText,
                            ),
                            Text(
                              weight.toString(),
                              style: kStyleNumber,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CardBackgroundColor(
                        backgroundColor: kActiveCardColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kStyleText,
                            ),
                            Text(
                              age.toString(),
                              style: kStyleNumber,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                textBottomButton: 'CALCULATE',
                onTapButton: () {
                  BMICalculatorBrain bmiCalc =
                      BMICalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmiCalculate: bmiCalc.calculateBmi(),
                        bmiResult: bmiCalc.bmiResult(),
                        bmiDiagnosis: bmiCalc.getDiagnosis(),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
