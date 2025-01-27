import 'package:example_design/design/buttons/example_button/example_button.dart';
import 'package:flutter/material.dart';
import 'package:example_design/constants/text_styles.dart';
import 'package:example_design/constants/colors.dart';
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
        exampleButtonStyle: ExampleButtonStyle(
          color: ExampleColors.blue,
          textStyle: ExampleTextStyles.semiboldInterText.copyWith(
            color: ExampleColors.white,
            fontSize: 16,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
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
