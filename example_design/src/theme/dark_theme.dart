import 'package:flutter/material.dart';

/*
  ThemeData and DesignTheme MUST be getters due to dynamic change during hot-reload!!
 */
ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      extensions: [darkDesignThemeExtension],
    );

get darkDesignThemeExtension {}