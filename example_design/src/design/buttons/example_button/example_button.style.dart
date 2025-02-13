import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ExampleButtonStyle {
  const ExampleButtonStyle({
    required this.outlineErrorButton,
    // required this.iconColor,
    // required this.textStyle,
  });

  @override
  final ShadButtonTheme outlineErrorButton;

  //@override
  //final Color iconColor;

  //@override
  //final TextStyle textStyle;
}
