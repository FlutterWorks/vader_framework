import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';


part 'test_button.style.tailor.dart';

@tailorMixinComponent
class TestButtonStyle extends ThemeExtension<TestButtonStyle> with _$TestButtonStyleTailorMixin {
  const TestButtonStyle({
    required this.color,
    required this.iconColor,
    required this.textStyle,
    required this.borderRadius,
  });

  @override
  final Color color;

  @override
  final Color iconColor;

  @override
  final TextStyle textStyle;

  @override
  final BorderRadius borderRadius;
}
