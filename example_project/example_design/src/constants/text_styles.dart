import 'package:flutter/material.dart';

class FontFamily {
  static const String inter = 'Inter';
}

class ButtonTextStyles {
  static const TextStyle largeButtonTextStyle = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  static const TextStyle mediumButtonTextStyle = TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static const TextStyle smallButtonTextStyle = TextStyle(
    fontFamily: FontFamily.inter,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.4,
  );
}
