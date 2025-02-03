import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';


class ExampleButtonTheme {
  static final light = ExampleButtonStyle(
    color: DesignColors.blue.shade700,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = ExampleButtonStyle(
    color: DesignColors.blue.shade500,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}