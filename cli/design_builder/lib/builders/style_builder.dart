import 'package:recase/recase.dart';

class StyleBuilder {
  const StyleBuilder({
    required this.packageName,
    required this.className,
    required this.fileName,
    required this.filePath,
    required this.styles,
  });

  final String packageName;
  final String className;
  final String fileName;
  final String filePath;
  final List<String> styles;

  String getType(String name) => name == 'design' ? 'theme' : 'style';

  StringBuffer _writeImports(StringBuffer sb) {
    String path = "package:$packageName/$filePath";

    sb.writeln("");
    for (final styleName in styles) {
      sb.writeln("import '$path$styleName/$styleName.${getType(styleName)}.dart';");
    }
    sb.writeln("");
    sb.writeln("import 'package:flutter/material.dart';");
    sb.writeln("import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';");
    sb.writeln("");
    sb.writeln("part '$fileName.${getType(fileName)}.tailor.dart';");
    sb.writeln("");
    return sb;
    /*
    export 'buttons/buttons.dart';

    import 'package:example_design/design/buttons/buttons.dart';
    import 'package:flutter/material.dart';
    import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

    part 'design.tailor.dart';
     */
  }

  StringBuffer _writeClassConstructor(StringBuffer sb) {
    sb.writeln("  const $className({");
    for (final styleName in styles) {
      sb.writeln("    required this.${styleName.camelCase}Style,");
    }
    sb.writeln("  });");
    return sb;
    /*
    const DesignTheme({
      required this.buttonsStyle,
    });
    */
  }

  StringBuffer _writeFields(StringBuffer sb) {
    for (final styleName in styles) {
      ReCase name = ReCase(styleName);

      sb.writeln("");
      sb.writeln("  @override");
      sb.writeln("  @themeExtension");
      sb.writeln("  final ${name.pascalCase}Style ${name.camelCase}Style;");
    }
    return sb;
  }

  StringBuffer _buildClass() {
    final sb = StringBuffer();
    _writeImports(sb);
    sb.writeln("@TailorMixin()");
    sb.writeln("class $className extends ThemeExtension<$className> with _\$${className}TailorMixin {");
    _writeClassConstructor(sb);
    sb.writeln("");
    _writeFields(sb);
    sb.writeln("}");
    return sb;
  }

  String build() {
    return _buildClass().toString();
  }
}
