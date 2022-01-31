import 'package:flutter/material.dart';

import '../CalculatorBrain.dart';
import '../components/BottomButton.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final CalculatorBrain calculatorBrain;

  const ResultPage({this.calculatorBrain});

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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 35.0,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Result',
                      style: kResultTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kActiveCardColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 60.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment,
                          children: [
                            Text(
                              calculatorBrain.getSingleWordInterpretation(),
                              style: kEvaluationTextStyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              calculatorBrain.getBmiString(),
                              style: kBmiNumberStyle,
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              calculatorBrain.getBmiRangeDescriptionTitle(),
                              style: kLabelTextStyle.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              calculatorBrain.getBmiRangeDescription(),
                              style: kResultBodyStyle,
                            ),
                            SizedBox(height: 40.0),
                            Text(
                              calculatorBrain.getInterpretationText(),
                              textAlign: TextAlign.center,
                              style: kResultBodyStyle,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                print('Save results');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 25.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: kSaveButtonColor,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'SAVE RESULT',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE YOUR BMI',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
