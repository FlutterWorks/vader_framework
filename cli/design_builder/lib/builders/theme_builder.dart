import 'dart:io';

import 'package:recase/recase.dart';

typedef WidgetTheme = Map<String, StringBuffer>;

class ThemeBuilder {
  ThemeBuilder(this.themes);

  final List<String> themes;
  Map _themeStructure = {};

  Map<K, dynamic> _deepMerge<K>(Map<K, dynamic> a, Map<K, dynamic> b) {
    final result = Map<K, dynamic>.from(a);

    b.forEach((key, bValue) {
      if (result.containsKey(key)) {
        final aValue = result[key];
        if (aValue is Map && bValue is Map) {
          result[key] = _deepMerge(aValue, bValue);
        } else {
          result[key] = bValue;
        }
      } else {
        result[key] = bValue;
      }
    });

    return result;
  }

  WidgetTheme getTheme(String path, String fileName) {
    ReCase name = ReCase(fileName);
    final file = File('$path/${name.snakeCase}.theme.dart');
    final lines = file.readAsStringSync().split('\n');

    int countLetter(String input, String letter) {
      return letter.isEmpty ? 0 : input.split(letter).length - 1;
    }

    WidgetTheme result = {
      for (final theme in themes) theme: StringBuffer(),
    };

    String? currentTheme;
    int i = 0;

    saveLine(String line) {
      result[currentTheme]!.writeln(line);
      i += countLetter(line, '(');
      i -= countLetter(line, ')');
      if (i == 0) currentTheme = null;
    }

    for (final line in lines) {
      if (currentTheme == null) {
        for (final theme in themes) {
          if (line.contains('$theme = ${name.pascalCase}Style')) {
            currentTheme = theme;
            saveLine(line.split(' = ').last);
          }
        }
      } else {
        saveLine(line);
      }
    }

    return result;
  }

  addTheme(String path, String fileName) {
    bool recording = true;

    final newTheme = path.split('/').reversed.fold({}, (buffer, e) {
      if (recording) buffer = {e: fileName == e ? getTheme(path, fileName) : buffer};
      if (e == 'design') recording = false;

      return buffer;
    });

    _themeStructure = _deepMerge(_themeStructure, newTheme);
  }

  buildTheme() {
    print("Building design theme...");

    final StringBuffer sb = StringBuffer();
    sb.writeln("DesignTheme(");

    print(_themeStructure);
  }
}
