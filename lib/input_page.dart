import 'package:bmi_calc/bmi_brain.dart';
import 'package:bmi_calc/bottom_navigate_button.dart';
import 'package:bmi_calc/card.dart';
import 'package:bmi_calc/rsult_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_round_button.dart';
import 'my_widget_icon.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { female, male }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 8,
                child: Row(children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childCard: const MyIconWidget(
                      tittle: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    childCard: const MyIconWidget(
                      tittle: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  )),
                ])),
            Expanded(
              flex: 10,
              child: ReusableCard(
                onPress: () {},
                cardColor: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kCustomTextStyle,
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kCustomIconicTextStyle),
                        const Text(
                          'cm',
                          style: kCustomTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: kInactiveCardColor,
                          activeTrackColor: kCustomIconColor,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 16.3),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 32.0),
                          thumbColor: kBottomAppBarColor,
                          overlayColor: kBottomAppBarColor.withOpacity(.16)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Row(children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    cardColor: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kCustomTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCustomIconicTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 14.0,
                            ),
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    cardColor: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kCustomTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kCustomIconicTextStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 14.0,
                            ),
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ])),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                BMIBrain bmiBrain = BMIBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: bmiBrain.calculateBMI(),
                      result: bmiBrain.getResult(),
                      interpretation: bmiBrain.getInterpretation(),
                    ),
                  ),
                );
              },
              child: const BottomNavigateButton(
                tittle: 'Go to result',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
