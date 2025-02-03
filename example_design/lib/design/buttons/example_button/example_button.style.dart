import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';


part 'example_button.style.tailor.dart';

@tailorMixinComponent
class ExampleButtonStyle extends ThemeExtension<ExampleButtonStyle> with _$ExampleButtonStyleTailorMixin {
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
