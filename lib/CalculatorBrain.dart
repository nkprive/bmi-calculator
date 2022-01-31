import 'dart:math';

import 'enums.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  BmiEvaluation _evaluation;
  double _bmi;

  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      _evaluation = BmiEvaluation.overweight;
    } else if (_bmi > 18.5) {
      _evaluation = BmiEvaluation.normal;
    } else {
      _evaluation = BmiEvaluation.underweight;
    }
  }

  String getBmiString() {
    return _bmi.toStringAsFixed(1);
  }

  String getSingleWordInterpretation() {
    if (_evaluation == BmiEvaluation.overweight) {
      return 'OVERWEIGHT';
    }
    if (_evaluation == BmiEvaluation.normal) {
      return 'NORMAL';
    }
    if (_evaluation == BmiEvaluation.underweight) {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretationText() {
    if (_evaluation == BmiEvaluation.overweight) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    if (_evaluation == BmiEvaluation.normal) {
      return 'You have a normal body weight. Good job!';
    }
    if (_evaluation == BmiEvaluation.underweight) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getBmiRangeDescriptionTitle() {
    if (_evaluation == BmiEvaluation.overweight) {
      return 'Overweight BMI range.';
    }
    if (_evaluation == BmiEvaluation.normal) {
      return 'Normal BMI range.';
    }
    if (_evaluation == BmiEvaluation.underweight) {
      return 'Underweight BMI range.';
    }
  }

  String getBmiRangeDescription() {
    if (_evaluation == BmiEvaluation.overweight) {
      return '25 (or more) kg/m2';
    }
    if (_evaluation == BmiEvaluation.normal) {
      return '18.5 - 25 kg/m2';
    }
    if (_evaluation == BmiEvaluation.underweight) {
      return '18.5 (or less) kg/m2';
    }
  }
}
