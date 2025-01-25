library design_package;

import 'package:example_design/design/design.dart';
import 'package:example_design/theme/dark_mode.dart';
import 'package:example_design/theme/light_mode.dart';
import 'package:flutter/material.dart';

import 'core/text_styles.dart';

export 'core/colors.dart';
export 'core/text_styles.dart';

class DesignPackageTheme {
  static final ThemeData light = lightTheme;
  static final ThemeData dark = darkTheme;
}

class DesignPackageThemeExtension {
  static final DesignTheme light = lightDesignThemeExtension;
  static final DesignTheme dark = darkDesignThemeExtension;
}
