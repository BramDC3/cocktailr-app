import 'package:flutter/widgets.dart';

class TypographyTokens {
  const TypographyTokens._();

  static const _bodoniModa = 'BodoniModa';
  static const _sfPro = 'SFPro';

  static const title1 = TextStyle(
    fontFamily: _bodoniModa,
    fontWeight: FontWeight.w500,
    fontSize: 36.0,
    height: 1.1,
  );

  static const title2 = TextStyle(
    fontFamily: _bodoniModa,
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    height: 1.1,
  );

  static const title3 = TextStyle(
    fontFamily: _bodoniModa,
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    height: 1.525,
  );

  static const title4 = TextStyle(
    fontFamily: _bodoniModa,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.525,
    letterSpacing: 2.0,
  );

  static const ingredientItem = TextStyle(
    fontFamily: _sfPro,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    height: 1.193125,
  );

  static const paragraph = TextStyle(
    fontFamily: _sfPro,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    height: 1.5,
  );
}
