import 'package:flutter/material.dart';
import 'package:example_design/core/text_styles.dart';
import 'package:example_design/core/colors.dart';
import 'package:example_design/design/design.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: DesignColors.green400,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: DesignColors.green400),
        focusColor: DesignColors.green200,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: DesignColors.green200),
        ),
        activeIndicatorBorder: const BorderSide(color: DesignColors.red500),
        fillColor: DesignColors.red.shade600,
      ),
      extensions: [lightDesignThemeExtension],
    );

DesignTheme get lightDesignThemeExtension => DesignTheme(
      buttonsStyle: ButtonsStyle(
        simpleButtonStyle: SimpleButtonStyle(
          defaultColor: DesignColors.purple.shade300,
          textStyle: TextStyles.mediumNormalText.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: DesignColors.black,
          ),
        ),
      ),
    );
