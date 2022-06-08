import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const int _primaryValue = 0xFFFB836F;
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      100: Color(0xFFFAC3B9),
      200: Color(0xFFFAADA0),
      300: Color(0xFFFA9887),
      400: Color(_primaryValue),
    },
  );
  static const int _secondaryValue = 0xFF6667AB;
  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      100: Color(0xFFDFDFF7),
      200: Color(0xFFB1B2DE),
      300: Color(0xFF898AC4),
      400: Color(_secondaryValue),
    },
  );
  static const int _blackValue = 0xFF3A3A3A;
  static const MaterialColor black = MaterialColor(
    _blackValue,
    <int, Color>{
      100: Color(0xFF878787),
      200: Color(0xFF6E6E6E),
      300: Color(0xFF545454),
      400: Color(_blackValue),
    },
  );
  static const int _greyValue = 0xFFAAAAAA;
  static const MaterialColor grey = MaterialColor(
    _greyValue,
    <int, Color>{
      100: Color(0xFFF6F6F6),
      200: Color(0xFFDEDEDE),
      300: Color(0xFFC4C4C4),
      400: Color(_greyValue),
    },
  );
}
