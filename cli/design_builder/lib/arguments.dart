import 'package:vader_cli/vader_cli.dart';

List<Command> commands = [
  ...CoreCommands.list,
  Command(
    flag: 'm',
    name: 'message',
    commandType: CommandType.option,
    commandHelp: 'Print message.',
  ),
];


class ExampleArguments extends Arguments {
  ExampleArguments({
    required super.showVersion,
    required super.showHelp,
    required super.isVerbose,
    this.message,
  });

  final String? message;

  factory ExampleArguments.parse(List<String> arguments, List<Command> commands) {
    final results = ArgumentParser(commands).parse(arguments);
    return ExampleArguments(
      showHelp: results.wasParsed(CoreCommands.help.name),
      isVerbose: results.wasParsed(CoreCommands.verbose.name),
      showVersion: results.wasParsed(CoreCommands.version.name),
      message: Arguments.getOptionOrNull(results, option: "message"),
    );
  }
}
