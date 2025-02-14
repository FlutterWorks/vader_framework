import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class ExampleButtonTheme {
  static final light = ExampleButtonStyle(
    outlineErrorButton: ShadButtonTheme(
      hoverForegroundColor: DesignColors.red400,
      backgroundColor: DesignColors.red100,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          width: 3,
          color: DesignColors.red400,
          radius: BorderRadius.circular(10),
        ),
      ),
    ),
    //color: DesignColors.blue.shade700,
    //iconColor: DesignColors.white,
    //textStyle: DesignTextStyles.semiboldInter16Text.copyWith(
    //  color: DesignColors.white,
    //  fontSize: 16,
    //  height: 0.5,
    //),
  );

  static final dark = ExampleButtonStyle(
    outlineErrorButton: ShadButtonTheme(
      hoverForegroundColor: DesignColors.red400,
      backgroundColor: DesignColors.red100,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          width: 3,
          color: DesignColors.red400,
          radius: BorderRadius.circular(10),
        ),
      ),
    ),
    //color: DesignColors.blue.shade500,
    //iconColor: DesignColors.white,
    //textStyle: DesignTextStyles.semiboldInter16Text.copyWith(
    //  color: DesignColors.white,
    //  fontSize: 16,
    //  height: 0.5,
    //),
  );
}