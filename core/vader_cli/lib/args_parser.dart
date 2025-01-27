import 'package:args/args.dart';
import 'package:vader_cli/exceptions.dart';
import 'package:vader_cli/commands.dart';

class ArgumentParser {
  final argParser = ArgParser();

  ArgResults parse(args) => argParser.parse(args);

  get usage => argParser.usage;

  ArgumentParser(List<Command> commands) {
    for (var value in commands) {
      switch (value.commandType) {
        case CommandType.option:
          argParser.addOption(value.name!, abbr: value.flag, mandatory: value.isMandatory, help: value.commandHelp);
        case CommandType.multipleOption:
          argParser.addMultiOption(value.name!, abbr: value.flag, help: value.commandHelp);
        case CommandType.flag:
          argParser.addFlag(value.name!, abbr: value.flag, help: value.commandHelp, negatable: false);
      }
    }
  }
}

class Arguments {
  final bool isVerbose;
  final bool showHelp;
  final bool showVersion;

  const Arguments({
    required this.showVersion,
    required this.showHelp,
    required this.isVerbose,
  });

  factory Arguments.parse(List<String> arguments, List<Command> commands) {
    ArgResults results = ArgumentParser(commands).parse(arguments);
    return Arguments(
      showHelp: results.wasParsed("help"),
      isVerbose: results.wasParsed("verbose"),
      showVersion: results.wasParsed("version"),
    );
  }

  static getUsage(commands) => ArgumentParser(commands).usage;

  static getOptionOrNull(ArgResults results, {required String option}) {
    return results.wasParsed(option) ? results.option(option) : null;
  }

  static getOptionOrThrow(ArgResults results, {required String option, String? errorMessage}) {
    if (results.wasParsed(option)) {
      return results.option(option);
    } else {
      throw MissingOptionException(message: errorMessage ?? 'Missing option: \'$option\'');
    }
  }
}
