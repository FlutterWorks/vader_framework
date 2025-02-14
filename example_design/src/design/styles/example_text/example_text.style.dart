import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ExampleTextStyle {
  const ExampleTextStyle({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body1,
    required this.body2,
    required this.caption1,
    required this.caption2,
  });

  @override
  final TextStyle title1;

  @override
  final TextStyle title2;

  @override
  final TextStyle title3;

  @override
  final TextStyle body1;

  @override
  final TextStyle body2;

  @override
  final TextStyle caption1;

  @override
  final TextStyle caption2;
}
