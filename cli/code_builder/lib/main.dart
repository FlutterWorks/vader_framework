import 'dart:io';

import 'package:mason/mason.dart';
import 'package:vader_cli/vader_cli.dart';
import 'package:code_builder/arguments.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: CliArguments.parse,
    appInfo: AppInfo(
      name: "Code Builder",
      version: '0.1.0',
      description: "This is simple description of my program.",
    ),
    app: (args) async {
      final String projectRoot = path.script.parent.path;
      final pubspecExists = File(path.join(projectRoot, 'pubspec.yaml')).existsSync();
      if (!pubspecExists) {
        stdout.writeln('Script is not in your project.');
        exit(1);
      }

      final String componentName = args.name != null ? args.name! : UserInput.prompt(message: "Write component name");
      final String output = args.output != null ? args.output! : UserInput.prompt(message: "Write output directory");

      if (args.type == 'component') {
        final brickPath = Brick.path(path.join(projectRoot, 'bricks', 'vader_component'));
        final generator = await MasonGenerator.fromBrick(brickPath);
        final target = DirectoryGeneratorTarget(Directory(path.joinAll([projectRoot, ...path.split(output)])));
        await generator.generate(target, vars: <String, dynamic>{'name': componentName, 'package': args.package});

        stdout.writeln("Component with name '$componentName' was successfully created.");
      } else if (args.type == 'example') {
        final brickPath = Brick.path(path.join(projectRoot, 'bricks', 'example'));
        final generator = await MasonGenerator.fromBrick(brickPath);
        final target = DirectoryGeneratorTarget(Directory(path.joinAll([projectRoot, ...path.split(output)])));
        await generator.generate(target, vars: <String, dynamic>{'name': componentName});

        stdout.writeln("Example was successfully created.");
      } else {
        stdout.writeln("Type '${args.type}' doesn't exist.");
        exit(1);
      }
      exit(0);
    },
  );
}
