import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;

  BMIBrain({required this.weight, required this.height});

  double _bmi () {
    return weight / pow(height / 100, 2);
  }

    String calculateBMI() {
    double tmp = _bmi();
      return tmp.toStringAsFixed(1);
    }

    String getResult() {
    double tmp = _bmi();
      if (tmp > 25) {
        return 'Overweight';
      } else if (tmp < 18.5) {
        return 'Underweight';
      } else {
        return 'Normal';
      }
    }

    final Map<String, String> _interpretation = {
      'Overweight':
      'You have a higher than normal body weight. You need to exercise in regular basis.',
      'Underweight':
      'You have a lower than normal body weight. You need to eat more.',
      'Normal': 'You have a normal body weight. Good job!',
    };

    String getInterpretation() {
      return _interpretation[getResult()].toString();
    }

}
