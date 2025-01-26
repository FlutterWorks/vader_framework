import 'package:flutter/material.dart' as mt;
import 'package:flutter/material.dart';
import 'package:example_design/core/text_styles.dart';
import 'package:example_design/core/colors.dart';
import 'package:example_design/design/design.dart';

ThemeData get lightTheme {
  return mt.ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: DesignColors.green400,
    inputDecorationTheme: mt.InputDecorationTheme(
      labelStyle: const TextStyle(color: DesignColors.green400),
      focusColor: DesignColors.green200,
      focusedBorder: const mt.UnderlineInputBorder(
        borderSide: mt.BorderSide(color: DesignColors.green200),
      ),
      activeIndicatorBorder: const mt.BorderSide(color: DesignColors.red500),
      fillColor: DesignColors.red.shade600,
    ),
    extensions: [lightDesignThemeExtension],
  );
}

final lightDesignThemeExtension = DesignTheme(
  buttonsStyle: ButtonsStyle(
    simpleButtonStyle: SimpleButtonStyle(
      defaultColor: DesignColors.purple.shade200,
      textStyle: TextStyles.mediumNormalText.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: DesignColors.black,
      ),
    ),
  ),
);
