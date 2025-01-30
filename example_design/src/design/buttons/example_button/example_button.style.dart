import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ExampleButtonStyle {
  const ExampleButtonStyle({
    required this.color,
    required this.textStyle,
    required this.borderRadius,
  });

  @override
  final Color color;

  @override
  final TextStyle textStyle;

  @override
  final BorderRadius borderRadius;
}
