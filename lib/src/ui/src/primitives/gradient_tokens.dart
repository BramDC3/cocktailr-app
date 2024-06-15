import 'package:flutter/painting.dart';

class GradientTokens {
  const GradientTokens._();

  static const gold = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFD18F2C),
      Color(0xFFF3CE70),
      Color(0xFFD18F2C),
      Color(0xFFBE770D),
      Color(0xFFF3CE70),
    ],
    stops: [
      0.0,
      0.2994,
      0.675,
      0.809,
      1.0,
    ],
  );
}
