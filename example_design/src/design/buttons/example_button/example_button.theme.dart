import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';

import 'example_button.style.dart';

class ExampleButtonTheme {
  static final light = ExampleButtonStyle(
    color: ExampleColors.blue,
    textStyle: ExampleTextStyles.semiboldInterText.copyWith(
      color: ExampleColors.white,
      fontSize: 16,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = ExampleButtonStyle(
    color: ExampleColors.blue,
    textStyle: ExampleTextStyles.semiboldInterText.copyWith(
      color: ExampleColors.white,
      fontSize: 16,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}