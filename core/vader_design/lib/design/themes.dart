import 'package:flutter/material.dart';

abstract class VaderTheme {
  abstract final Map<String, ThemeData> themes;

  ThemeData? getTheme(String name) {
    return themes.containsKey(name) ? themes[name] : null;
  }

  ThemeData? get light => getTheme('light');

  ThemeData? get dark => getTheme('dark');
}
