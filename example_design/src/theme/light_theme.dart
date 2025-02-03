import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';

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

get lightDesignThemeExtension {}