import 'package:flutter/material.dart';
import 'package:example_design/example_design.dart';

DesignTheme get lightDesignThemeExtension => DesignTheme(
  buttonsStyle: ButtonsStyle(
    exampleButtonStyle: ExampleButtonStyle(
      color: DesignColors.blue.shade700,
      textStyle: DesignTextStyles.semiboldInterText.copyWith(
        color: DesignColors.white,
        fontSize: 16,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
