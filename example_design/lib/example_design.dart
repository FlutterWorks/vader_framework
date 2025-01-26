library design_package;

import 'package:example_design/design/design.dart';
import 'package:example_design/theme/dark_mode.dart';
import 'package:example_design/theme/light_mode.dart';
import 'package:flutter/material.dart';

export 'core/colors.dart';
export 'core/text_styles.dart';

class ExampleDesignTheme {
  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
}

class ExampleDesignThemeExtension {
  static DesignTheme get light => lightDesignThemeExtension;
  static DesignTheme get dark => darkDesignThemeExtension;
}
