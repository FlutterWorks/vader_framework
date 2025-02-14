import 'package:example_design/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:vader_design/vader_design.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ShadThemeData get lightTheme => ShadThemeData(
      brightness: Brightness.light,
      radius: BorderRadius.circular(10),
      colorScheme: ShadBlueColorScheme.light(
        primary: DesignColors.blue600,
        border: DesignColors.blue600,
        background: DesignColors.grey200,
      ),
      textTheme: ShadTextTheme(family: 'Inter'),
      //primaryButtonTheme: ShadButtonTheme(),
      outlineButtonTheme: ShadButtonTheme(
        hoverForegroundColor: DesignColors.blue600,
        backgroundColor: DesignColors.blue100,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            width: 3,
            color: DesignColors.blue600,
            radius: BorderRadius.circular(10),
          ),
        ),
      ),
      buttonSizesTheme: ShadButtonSizesTheme(
        lg: ShadButtonSizeTheme(
          height: 42,
          width: 330,
          padding: EdgeInsets.zero,
        ),
        regular: ShadButtonSizeTheme(
          height: 36,
          width: 165,
          padding: EdgeInsets.zero,
        ),
        sm: ShadButtonSizeTheme(
          height: 30,
          width: 132,
          padding: EdgeInsets.zero,
        ),
      ),
      extensions: [lightDesignThemeExtension],
    );

get lightDesignThemeExtension {}
