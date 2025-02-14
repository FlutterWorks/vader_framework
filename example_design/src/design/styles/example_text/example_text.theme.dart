import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';


class ExampleTextTheme {
  static final light = ExampleTextStyle(
    title1: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 22,
      //height: 0.28,
    ),
    title2: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      //height: 0.19,
    ),
    body1: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    body2: TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 11,
    ),
  );

  static final dark = light;
}