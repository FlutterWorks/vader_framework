import 'dart:io';

import 'package:design_builder/arguments.dart';
import 'package:design_builder/builders/constants_builder.dart';
import 'package:design_builder/builders/design_builder.dart';
import 'package:vader_cli/vader_cli.dart';

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
      DesignBuilder().run();
      //ConstantsBuilder().copyConstants(source: 'src', target: 'out');
    },
  );
}