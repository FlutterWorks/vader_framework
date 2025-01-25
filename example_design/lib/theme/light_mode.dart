import 'package:flutter/material.dart' as mt;
import 'package:flutter/material.dart';
import 'package:example_design/core/text_styles.dart';
import 'package:example_design/core/colors.dart';
import 'package:example_design/design/design.dart';

ThemeData get lightTheme {
  return mt.ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: DesignColors.green,
    inputDecorationTheme: const mt.InputDecorationTheme(
      labelStyle: TextStyle(color: DesignColors.green),
      focusColor: DesignColors.greenLight,
      focusedBorder: mt.UnderlineInputBorder(
        borderSide: mt.BorderSide(color: DesignColors.greenLight),
      ),
      activeIndicatorBorder: mt.BorderSide(color: DesignColors.red),
      fillColor: DesignColors.red,
    ),
    extensions: [lightDesignThemeExtension],
  );
}

final lightDesignThemeExtension = DesignTheme(
  buttonsStyle: ButtonsStyle(
    simpleButtonStyle: SimpleButtonStyle(
      defaultColor: DesignColors.purpleLight,
      textStyle: TextStyles.mediumNormalText.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: DesignColors.black,
      ),
    ),
  ),
);
