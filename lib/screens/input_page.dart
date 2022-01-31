import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/BottomButton.dart';
import '../components/gender_container.dart';
import '../components/height_picker.dart';
import '../components/plus_minus_picker.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../enums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  double height = 160.0;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // handle the press
          },
        ),
        title: Text('BMI CALCULATOR',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  activeGender = Gender.male;
                                });
                              },
                              color: activeGender == Gender.male
                                  ? kActiveCardColor
                                  : kInactiveCardColor,
                              child: GenderContainer(
                                text: 'MALE',
                                icon: FontAwesomeIcons.mars,
                                iconColor: activeGender == Gender.male
                                    ? Colors.white
                                    : kGreyTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: ReusableCard(
                                onPress: () {
                                  setState(() {
                                    activeGender = Gender.female;
                                  });
                                },
                                color: activeGender == Gender.female
                                    ? kActiveCardColor
                                    : kInactiveCardColor,
                                child: GenderContainer(
                                  text: 'FEMALE',
                                  icon: FontAwesomeIcons.venus,
                                  iconColor: activeGender == Gender.female
                                      ? Colors.white
                                      : kGreyTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              color: kActiveCardColor,
                              child: HeightPicker(
                                title: 'HEIGHT',
                                height: height,
                                onSliderUpdate: (double value) {
                                  setState(() {
                                    height = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            color: kActiveCardColor,
                            child: PlusMinusPicker(
                              title: 'WEIGHT',
                              number: weight,
                              onIncrement: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kActiveCardColor,
                            child: PlusMinusPicker(
                              title: 'AGE',
                              number: age,
                              onIncrement: () {
                                setState(() {
                                  if (age == 160) return;
                                  age++;
                                });
                              },
                              onDecrement: () {
                                setState(() {
                                  if (age == 0) return;
                                  age--;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'CALCULATE YOUR BMI',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    calculatorBrain: CalculatorBrain(
                      height: height.toInt(),
                      weight: weight,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
