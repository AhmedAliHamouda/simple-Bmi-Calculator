import 'dart:math';

class BMICalculatorBrain {
  BMICalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 30) {
      return 'Obesity';
    } else if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'underWeight';
    }
  }

  String getDiagnosis() {
    if (_bmi >= 30) {
      return 'You have a higher more than normal body weight. you should make diet and exercise more.';
    } else if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
