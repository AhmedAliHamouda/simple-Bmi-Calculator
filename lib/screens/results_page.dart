import 'package:simple_bmi_calculator/components/bottom_button.dart';
import 'package:simple_bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/components/background_card_color.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiCalculate, this.bmiResult, this.bmiDiagnosis});

  final String bmiCalculate;
  final String bmiResult;
  final String bmiDiagnosis;
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
        child: Container(
         // height: MediaQuery.of(context).size.height,
          height: 690,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your Result',
                      style: kTitleResultStyle,
                    ),
                  ],
                ),

                // Container(
                //   padding: EdgeInsets.all(20.0),
                //   //alignment: Alignment.bottomLeft,
                //   alignment: Alignment.center,
                //   child: Text(
                //     'Your Result',
                //     style: kTitleResultStyle,
                //   ),
                // ),
              ),
              Flexible(
                flex: 5,
                child: CardBackgroundColor(
                  backgroundColor: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmiResult.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiCalculate,
                        style: kBMITextStyle,
                      ),
                      Text(
                        bmiDiagnosis,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              BottomButton(
                textBottomButton: 'RE-CALCULATE',
                onTapButton: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
