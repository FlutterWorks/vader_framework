import 'dart:io';

import 'package:recase/recase.dart';

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
    String code = file
        .readAsStringSync()
        .replaceAll("style!", "(style ?? context.designTheme.$designPathStyle${name.camelCase}Style)");

    code = "import 'package:example_design/design/design.theme.dart';\n$code";

    path = path.replaceFirst(inputPath, '').replaceFirst(name.snakeCase, '');
    final outputFile = File('$outputPath$path${name.snakeCase}/${name.snakeCase}.dart');
    outputFile.writeAsStringSync(code);
  }

  void buildStyle(String path, String fileName) {
    ReCase name = ReCase(fileName);
    final file = File('$path/${name.snakeCase}.style.dart');

    var code = file
        .readAsStringSync()
        .replaceAll("@tailorMixinComponent", "\npart '${name.snakeCase}.style.tailor.dart';\n\n@tailorMixinComponent");
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
}