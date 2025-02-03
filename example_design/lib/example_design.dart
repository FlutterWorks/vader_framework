export 'package:example_design/design/design.theme.dart';
export 'package:example_design/design/buttons/buttons.style.dart';
export 'package:example_design/design/buttons/example_button/example_button.style.dart';
export 'package:example_design/design/buttons/example_button/example_button.dart';
export 'package:example_design/constants/colors.dart';
export 'package:example_design/constants/text_styles.dart';

import 'package:example_design/design/design.theme.dart';
import 'package:example_design/theme/dark_theme.dart';
import 'package:example_design/theme/dark_theme_extension.dart';
import 'package:example_design/theme/light_theme.dart';
import 'package:example_design/theme/light_theme_extension.dart';
import 'package:flutter/material.dart';


class ExampleDesignTheme {
  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
}

class ExampleDesignThemeExtension {
  static DesignTheme get light => lightDesignThemeExtension;
  static DesignTheme get dark => darkDesignThemeExtension;
}
