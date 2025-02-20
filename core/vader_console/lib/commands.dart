enum CommandType { option, multipleOption, flag }

enum CoreCommands {
  help(Command(
    flag: 'h',
    name: 'help',
    commandType: CommandType.flag,
    commandHelp: 'Print help information.',
  )),
  verbose(Command(
    flag: 'V',
    name: 'verbose',
    commandType: CommandType.flag,
    commandHelp: 'Show additional command output.',
  )),
  version(Command(
    flag: 'v',
    name: 'version',
    commandType: CommandType.flag,
    commandHelp: 'Print program version.',
  ));

  const CoreCommands(this.command);

  final Command command;

  static Iterable<Command> get list => values.map((e) => e.command);
}

class Command {
  const Command({
    this.flag,
    this.name,
    this.isMandatory = false,
    required this.commandHelp,
    required this.commandType,
  });

  final String? flag;
  final String? name;
  final bool isMandatory;
  final String commandHelp;
  final CommandType commandType;
}
