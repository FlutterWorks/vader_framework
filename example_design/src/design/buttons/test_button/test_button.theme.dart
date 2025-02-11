import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';


class TestButtonTheme {
  static final light = TestButtonStyle(
    color: DesignColors.blue.shade700,
    iconColor: DesignColors.white,
    textStyle: DesignTextStyles.semiboldInterText.copyWith(
      color: DesignColors.white,
      fontSize: 16,
      height: 0.5,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final dark = TestButtonStyle(
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