import 'dart:io';

import 'package:recase/recase.dart';

typedef WidgetTheme = Map<String, StringBuffer>;

class ComponentBuilder {
  const ComponentBuilder({
    required this.inputPath,
    required this.outputPath,
  });

  final String inputPath;
  final String outputPath;

  void buildWidget(String path, String fileName) {
    ReCase name = ReCase(fileName);
    final designPathStyle = path
        .replaceFirst(inputPath, '')
        .replaceFirst(name.snakeCase, '')
        .split('/')
        .map((e) => e.isEmpty ? e : '${e}Style')
        .join('.');

    final file = File('$path/${name.snakeCase}.dart');
    final code = file
        .readAsStringSync()
        .replaceAll("style!", "(style ?? context.designTheme.$designPathStyle${name.camelCase}Style)");

    path = path.replaceFirst(inputPath, '').replaceFirst(name.snakeCase, '');
    final outputFile = File('$outputPath$path${name.snakeCase}/${name.snakeCase}.dart');
    outputFile.writeAsStringSync(code);
  }

  void buildStyle(String path, String fileName) {
    ReCase name = ReCase(fileName);
    final file = File('$path/${name.snakeCase}.style.dart');
    var code = file
        .readAsStringSync()
        .replaceAll("@tailorMixinComponent", "\npart '${name.snakeCase}.tailor.dart';\n\n@tailorMixinComponent");
    final classLine = code.split('\n').where((element) => element.contains("class")).first;
    final replaceClassLine = classLine.replaceAll(
        ' {', ' extends ThemeExtension<${name.pascalCase}Style> with _\$${name.pascalCase}StyleTailorMixin {');
    code = code.replaceAll(classLine, replaceClassLine);

    path = path.replaceFirst(inputPath, '').replaceFirst(name.snakeCase, '');

    if (path == 'src/' || path == 'src/design') path = '';
    if (name.snakeCase == 'design') fileName = '';

    final outputFile =
        File('$outputPath$path${name.snakeCase == 'design' ? '' : '${name.snakeCase}/'}/${name.snakeCase}.style.dart');
    outputFile.writeAsStringSync(code);
  }

  WidgetTheme getTheme(String path, String fileName, {required List<String> themes}) {
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
}