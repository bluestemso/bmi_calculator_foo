import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'A lot of folks are overweight these days, don\'t take it too hard.';
    } else if (_bmi > 18.5) {
      return 'You\re doing great, keep it up, champ.';
    } else {
      return 'Go on, have some ice cream before bed.  Treat yourself.';
    }
  }

}