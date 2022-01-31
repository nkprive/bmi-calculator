import 'package:flutter/material.dart';

import '../constants.dart';

const cmUnitStyle = TextStyle(
  fontSize: 21.0,
  color: Color(0xFF8D8E98),
  fontWeight: FontWeight.w500,
);

class HeightPicker extends StatelessWidget {
  final String title;
  final double height;
  final Function onSliderUpdate;

  HeightPicker({this.title, this.height, this.onSliderUpdate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: kLabelTextStyle),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '${height.toInt()}', style: kNumberStyle),
                  TextSpan(text: 'cm', style: cmUnitStyle),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
              thumbColor: kPinkAccentColor,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 27),
              overlayColor: kPinkAccentColor.withOpacity(0.2),
              trackHeight: 1.5,
              activeTrackColor: Color(0xFFFCFEFE),
              inactiveTrackColor: Color(0xFF888896),
            ),
            child: Slider(
              value: height,
              min: 110,
              max: 230,
              // inactiveColor: Colors.white,
              // activeColor: kPinkAccentColor,
              // thumbColor: kPinkAccentColor,
              onChanged: (double value) {
                onSliderUpdate(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
