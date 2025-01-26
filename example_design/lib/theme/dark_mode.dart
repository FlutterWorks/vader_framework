import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter/painting.dart';
import 'package:example_design/core/text_styles.dart';
import 'package:example_design/core/colors.dart';
import 'package:example_design/design/design.dart';

get darkTheme {
  return mt.ThemeData(
    brightness: Brightness.dark,
    extensions: [darkDesignThemeExtension],
  );
}

final darkDesignThemeExtension = DesignTheme(
  buttonsStyle: ButtonsStyle(
    simpleButtonStyle: SimpleButtonStyle(
      defaultColor: DesignColors.purple.shade500,
      textStyle: TextStyles.mediumNormalText.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: DesignColors.white,
      ),
    ),
  ),
);
