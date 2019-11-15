import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void goToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute<Widget>(builder: (context) => screen),
  );
}

Color createRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
      .withOpacity(1.0);
}

Widget textGuideRebuildWarning() {
  return Text(
    'Note: When you see the background color of the widget is change randomly, '
    'it means that widget is rebuilt.',
    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  );
}

Widget textGuideTouchButtonToIncrease() {
  return Text(
    'Press below button to increase number',
    style: TextStyle(fontSize: 18),
  );
}

TextStyle textResultStyle = TextStyle(
  fontSize: 18,
);

SizedBox height10 = SizedBox(height: 10);
