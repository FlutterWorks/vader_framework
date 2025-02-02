import 'dart:io';

import 'package:design_builder/arguments.dart';
import 'package:design_builder/builders/design_builder.dart';
import 'package:vader_cli/vader_cli.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: CliArguments.parse,
    appInfo: AppInfo(
      name: "design_builder",
      version: '0.1.0',
      description: "Builder for build directory structure in vader design package.",
    ),
    app: (args) {
      if (args.package == null) {
        print("You didn't fill package name.");
        print("You must add parameter: '-p <your_package_name>'\n");
        exit(1);
      }

      DesignBuilder(
        sourcePoint: args.source ?? 'src',
        targetPoint: args.output ?? 'out',
        packageName: args.package!,
        themes: args.themes!,
      ).run();
    },
  );
}
