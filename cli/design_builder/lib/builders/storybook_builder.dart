import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';

class StorybookBuilder {
  StorybookBuilder(this.storybookPath);

  final String storybookPath;

  String get outputStoriesPath => '$storybookPath/design/';

  final Map<String, String> _stories = {};

  void buildAllStoriesList() {
    StringBuffer sb = StringBuffer();
    sb.writeln("import 'package:storybook_toolkit/storybook_toolkit.dart';\n");

    for (final path in _stories.keys) {
      sb.writeln("import 'design/$path.stories.dart';");
    }

    sb.writeln("\nfinal List<Story> allStories = [");
    for (final name in _stories.values) {
      sb.writeln("  ...${ReCase(name).camelCase}Stories,");
    }
    sb.writeln("];");

    final outputFile = File('$storybookPath/all_stories.dart');
    Directory(outputFile.parent.path).createSync(recursive: true);
    outputFile.writeAsStringSync(sb.toString());
  }

  void buildStory(String sourcePath, String fileName) {
    final function = RegExp(r'(?:(?:[A-Za-z_]\w*)\s+)?[A-Za-z_]\w*Story\(\s*[A-Za-z_]\w*(?:\s+[A-Za-z_]\w*)?\s*\)');
    final ReCase name = ReCase(fileName);

    // Load story from source
    final file = File('$sourcePath/${name.snakeCase}.story.dart');
    final code = file.readAsStringSync();
    final functions = code.split('\n').where((e) => e.contains(function)).map(_extractFunctionName).toList()
      ..remove('');

    // Build list of stories
    final clearPath = sourcePath.split('/design/').last;
    final storiesCode = _buildStoriesList(functions, clearPath, name);

    String resultCode = "import 'package:vader/vader.dart';\n$code\n\n$storiesCode";

    // Write result into storybook
    final outputFile = File('$outputStoriesPath$clearPath.stories.dart');
    Directory(outputFile.parent.path).createSync(recursive: true);
    outputFile.writeAsStringSync(resultCode);

    _stories[clearPath] = fileName;
  }

  String _buildStoriesList(List<String> functions, String clearPath, ReCase name) {
    StringBuffer sb = StringBuffer();
    sb.writeln('final List<Story> ${name.camelCase}Stories = [');

    for (final func in functions) {
      final String storyPath = clearPath.split('/').map((e) => ReCase(e).pascalCase).join('/');
      final Iterable<String> storyTags = clearPath.split('/').map((e) => ReCase(e).camelCase);

      sb.write("""
  Story(
    tags: const [${storyTags.fold('', (s, tag) => "$s'$tag', ")}],
    name: '$storyPath/${ReCase(func).pascalCase.replaceFirst('Story', '')}',
    goldenPathBuilder: (c) => goldenTestPathBuilder(c),
    builder: (c) => $func(c),
  ),
      """);
    }
    sb.writeln('];');

    final formatter = DartFormatter(languageVersion: DartFormatter.latestLanguageVersion);
    final formattedCode = formatter.format(sb.toString());

    return formattedCode;
  }

  String _extractFunctionName(String input) {
    input = input.trim();
    final RegExp regex = RegExp(r'^(?:[A-Za-z_]\w*\s+)?([A-Za-z_]\w*Story)\s*\(');
    final match = regex.firstMatch(input);
    return match != null ? match.group(1)! : '';
  }
}
