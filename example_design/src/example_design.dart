import 'package:example_design/design/design.theme.dart';
import 'package:example_design/theme/dark_theme.dart';
import 'package:example_design/theme/dark_theme_extension.dart';
import 'package:example_design/theme/light_theme.dart';
import 'package:example_design/theme/light_theme_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';


class ExampleDesignTheme {
  static ShadThemeData get light => lightTheme;
  static ShadThemeData get dark => darkTheme;
}

class ExampleDesignThemeExtension {
  static DesignTheme get light => lightDesignThemeExtension;
  static DesignTheme get dark => darkDesignThemeExtension;
}
