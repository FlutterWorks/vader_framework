import 'dart:io';

import 'package:design_builder/arguments.dart';
import 'package:design_builder/builders/design_builder.dart';
import 'package:vader_console/vader_console.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: CliArguments.parse,
    app: (CliArguments args) {
      if (args.package == null) {
        print("You didn't fill package name.");
        print("You must add parameter: '-p <your_package_name>'\n");
        exit(1);
      }

      final sandbox = args.isDevModeEnabled ? "sandbox/" : "";
      if (args.isDevModeEnabled) print("Development mode is enabled!\n");

      DesignBuilder(
        sourcePoint: sandbox + (args.source ?? 'src'),
        targetPoint: sandbox + (args.output ?? 'out'),
        storybookPoint: sandbox + (args.storybook ?? 'storybook'),
        packageName: args.package!,
        themes: args.themes!,
      ).run();
    },
  );
}
