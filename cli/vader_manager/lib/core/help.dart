import 'dart:io';

import 'package:yaml/yaml.dart';

/// Prints help for a given YAML map section.
void printHelp(YamlMap currentMap, {required String currentPath}) {
  final description = currentMap['desc'];
  if (description is String) {
    stdout.writeln('\n$currentPath: $description\n');
  } else {
    stdout.writeln('\n$currentPath: (no description)\n');
  }

  if (!currentMap.containsKey('cmd')) {
    stdout.writeln('Usage: cli.dart [options] $currentPath <subcommand> [args]');
    stdout.writeln('       Use -h, --help or help for more details.\n');

    stdout.writeln('Available subcommands under "$currentPath":');
  }

  for (final key in currentMap.keys) {
    if (key == 'desc') continue;
    final value = currentMap[key];
    if (value is YamlMap) {
      final subcommandDesc = value['desc'];
      if (subcommandDesc is String) {
        stdout.writeln('   $key\t$subcommandDesc');
      } else {
        stdout.writeln('   $key\t(no description)');
      }
    }
  }

  if (!currentMap.containsKey('cmd')) {
    stdout.writeln('\nFor more details, try "$currentPath <subcommand> -h"\n');
  }
}
