import 'package:vader_cli/vader_cli.dart';
import 'package:vader_cli_example/arguments.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: CliArguments.parse,
    appInfo: AppInfo(
      name: "Project test",
      version: '1.3.2',
      description: "This is simple description of my program.",
    ),
    app: (args) {
      print("Main part of my app...");
      print("Message: ${args.message}");
    },
  );
}
