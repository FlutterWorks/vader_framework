/*
import 'package:vader_cli/vader_cli.dart';
import 'package:vader_manager/arguments.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: ExampleArguments.parse,
    appInfo: AppInfo(
      name: "design_builder",
      version: '0.1.0',
      description: "Builder for build directory structure in vader design package.",
    ),
    app: (args) {
      print("Main part of my app...");
      print("Message: ${args.message}");
    },
  );
}
*/

import 'dart:io';
import 'package:vader_manager/core/arguments.dart';
import 'package:vader_manager/core/command.dart';


Future<void> main(List<String> arguments) async {
  if (arguments.isNotEmpty && (arguments.first == '-v' || arguments.first == '--version')) {
    stdout.writeln("Version: 1.0.0-dev.0");
    exit(0);
  }

  File file = loadCommandsFile('commands.yaml');

  final content = file.readAsStringSync();
  var vaderSection = parseArguments(content, arguments);

  try {
    processCommandsRecursively(
      vaderSection,
      arguments,
      'vader',
      topLevelMap: vaderSection,
    );
  } catch (e) {
    stderr.writeln('An error occurred: $e');
    exit(1);
  }
}
