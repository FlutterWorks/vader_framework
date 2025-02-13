import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ShadThemeData get lightTheme => ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: const ShadSlateColorScheme.light(),
  primaryButtonTheme: ShadButtonTheme(backgroundColor: Color(0xff5e71ff)),
  extensions: [lightDesignThemeExtension],
);

get lightDesignThemeExtension {}