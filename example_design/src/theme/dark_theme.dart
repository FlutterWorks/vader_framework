import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ShadThemeData get darkTheme => ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadSlateColorScheme.dark(),
      extensions: [darkDesignThemeExtension],
    );

get darkDesignThemeExtension {}
