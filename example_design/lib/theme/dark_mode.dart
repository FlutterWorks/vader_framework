import 'package:example_design/design/buttons/example_button.dart';
import 'package:flutter/material.dart';
import 'package:example_design/core/text_styles.dart';
import 'package:example_design/core/colors.dart';
import 'package:example_design/design/design.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      extensions: [darkDesignThemeExtension],
    );

DesignTheme get darkDesignThemeExtension => DesignTheme(
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
          defaultColor: DesignColors.purple.shade500,
          textStyle: TextStyles.mediumNormalText.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: DesignColors.white,
          ),
        ),
      ),
    );
