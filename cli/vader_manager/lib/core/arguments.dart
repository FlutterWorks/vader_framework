import 'dart:io';

import 'package:vader_manager/core/completion.dart';
import 'package:vader_manager/core/help.dart';
import 'package:yaml/yaml.dart';

parseArguments(String content, List<String> arguments) {
  final YamlMap yamlMap;
  try {
    yamlMap = loadYaml(content) as YamlMap;
  } catch (e) {
    stderr.writeln('Error parsing commands.yaml: $e');
    exit(1);
  }

  // We expect a "vader" section as the root
  final vaderSection = yamlMap['vader'];
  if (vaderSection == null || vaderSection is! YamlMap) {
    stderr.writeln('No valid "vader" section found in YAML (it must be a YamlMap).');
    exit(1);
  }

  // If no arguments are provided, print top-level help
  if (arguments.isEmpty) {
    printHelp(vaderSection, currentPath: 'vader');
    exit(0);
  }

  // Check if the user called "completions"
  if (arguments.first == 'completions') {
    if (arguments.length < 2) {
      stderr.writeln('Usage: cli.dart completions <zsh|bash>');
      exit(1);
    }

    final shellType = arguments[1];
    generateCompletions(shellType, vaderSection);
  }
  return vaderSection;
}
