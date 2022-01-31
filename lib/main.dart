import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
        ),
      ),
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Color(0xFF090D21),
      //   ),
      //   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      //   scaffoldBackgroundColor: Color(0xFF090D21),
      //   accentColor: Colors.green,
      // ),
    );
  }
}
