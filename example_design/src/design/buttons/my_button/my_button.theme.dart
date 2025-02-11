import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';


class ExampleButtonTheme {
  static final light = MyButtonStyle(
    color: DesignColors.blue.shade700,
    iconColor: DesignColors.white,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
      height: 0.5,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = MyButtonStyle(
    color: DesignColors.blue.shade500,
    iconColor: DesignColors.white,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
      height: 0.5,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}