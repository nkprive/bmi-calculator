import 'package:flutter/material.dart';

import '../constants.dart';

const iconSize = 80.0;
const spacerHeight = 10.0;

class GenderContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  GenderContainer({this.text, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        SizedBox(
          height: spacerHeight,
        ),
        Text(text, style: kLabelTextStyle),
      ],
    );
  }
}
