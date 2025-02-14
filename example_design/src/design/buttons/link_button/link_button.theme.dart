import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';


class LinkButtonTheme {
  static final light = LinkButtonStyle(
    textColor: DesignColors.blue800,
    textSize: 13,
    iconColor: DesignColors.blue800,
    iconSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final dark = light;
}