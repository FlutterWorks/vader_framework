import 'package:flutter/material.dart';
import 'package:example_design/example_design.dart';

DesignTheme get darkDesignThemeExtension => DesignTheme(
  buttonsStyle: ButtonsStyle(
    exampleButtonStyle: ExampleButtonStyle(
      color: DesignColors.blue.shade500,
      textStyle: DesignTextStyles.semiboldInterText.copyWith(
        color: DesignColors.white,
        fontSize: 16,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
