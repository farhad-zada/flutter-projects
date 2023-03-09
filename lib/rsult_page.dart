import 'package:bmi_calc/card.dart';
import 'package:bmi_calc/constants.dart';
import 'package:flutter/material.dart';

import 'bottom_navigate_button.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final String bmiResult;
  final String interpretation;
  const ResultScreen({
    super.key,
    required this.result,
    required this.bmiResult,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12.0, 13.0, 0.0, 0.0),
                child: Text(
                  'Your Result',
                  style: kCustomTitleStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.8),
                  child: ReusableCard(
                    onPress: () {},
                    cardColor: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(result.toUpperCase(),
                            style: kResultTextStyle),
                        Text(
                          bmiResult,
                          style: kBMIResultTxt,
                        ),
                        Text(
                          interpretation,
                          style: kBMIInterpretationTxt,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                }
                ,
                child: const BottomNavigateButton(
                  tittle: 'Recalculate',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
