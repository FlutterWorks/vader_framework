import 'package:vader_cli/vader_cli.dart';

List<Command> commands = [
  Command(
    flag: 's',
    name: 'source',
    commandType: CommandType.option,
    commandHelp: 'Path of source code.',
  ),
  Command(
    flag: 'o',
    name: 'output',
    commandType: CommandType.option,
    commandHelp: 'Path of generated code.',
  ),
  Command(
    name: 'storybook',
    commandType: CommandType.option,
    commandHelp: 'Path of storybook. ',
  ),
  Command(
    flag: 'p',
    name: 'package',
    commandType: CommandType.option,
    commandHelp: 'Name of package.',
  ),
  Command(
    flag: 't',
    name: 'themes',
    commandType: CommandType.multipleOption,
    commandHelp: 'List of themes. ',
  ),
  ...CoreCommands.list,
];

class CliArguments extends Arguments {
  CliArguments({
    required super.showVersion,
    required super.showHelp,
    required super.isVerbose,
    this.source,
    this.output,
    this.storybook,
    this.package,
    this.themes,
  });

  final String? source;
  final String? output;
  final String? storybook;
  final String? package;
  final List<String>? themes;

  static CliArguments parse(List<String> arguments, List<Command> commands) {
    final results = ArgumentParser(commands).parse(arguments);
    return CliArguments(
      showHelp: results.wasParsed(CoreCommands.help.name),
      isVerbose: results.wasParsed(CoreCommands.verbose.name),
      showVersion: results.wasParsed(CoreCommands.version.name),
      source: Arguments.getOptionOrNull(results, option: "source"),
      output: Arguments.getOptionOrNull(results, option: "output"),
      storybook: Arguments.getOptionOrNull(results, option: "storybook"),
      package: Arguments.getOptionOrNull(results, option: "package"),
      themes: Arguments.getMultipleOptionOrNull(results, option: "themes") ?? const ['light', 'dark'],
    );
  }
}
