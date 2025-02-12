import 'package:vader_cli/vader_cli.dart';
import 'package:vader_cli_example/arguments.dart';

void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: CliArguments.parse,
    app: (args) {
      print("Main part of my app...");
      print("Message: ${args.message}");
    },
  );
}
