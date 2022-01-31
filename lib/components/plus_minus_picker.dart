import 'package:flutter/material.dart';

import '../constants.dart';

class PlusMinusPicker extends StatelessWidget {
  final String title;
  final int number;
  final Function onIncrement;
  final Function onDecrement;

  PlusMinusPicker(
      {this.title, this.number, this.onIncrement, this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text('$number', style: kNumberStyle),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onTap: onDecrement,
              icon: Icon(
                Icons.remove,
                size: 35.0,
              ),
              color: kActiveCardColorAccent,
            ),
            SizedBox(
              width: 15.0,
            ),
            RoundIconButton(
              onTap: onIncrement,
              icon: Icon(
                Icons.add,
                size: 35.0,
              ),
              color: kActiveCardColorAccent,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Function onTap;

  const RoundIconButton({
    @required this.icon,
    @required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      onPressed: onTap,
      fillColor: color,
      elevation: 0.0,
      constraints: BoxConstraints(maxWidth: double.infinity),
      padding: EdgeInsets.all(10.0),
      shape: CircleBorder(),
    );
  }
}
