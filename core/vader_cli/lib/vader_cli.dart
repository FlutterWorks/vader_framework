import 'dart:io';

import 'package:vader_cli/app_info.dart';
import 'package:vader_cli/commands.dart';

import 'args_parser.dart';
import 'exceptions.dart';

export 'app_info.dart';
export 'commands.dart';
export 'exceptions.dart';
export 'args_parser.dart';

void runCliApp<T extends Arguments>({
  required List<String> arguments,
  required List<Command> commands,
  required T Function(List<String>, List<Command>) parser,
  required AppInfo appInfo,
  required Function(T) app,
}) {
  try {
    final args = parser(arguments, commands);
    if (args.showHelp) {
      print(appInfo.name);
      if (appInfo.description != null) {
        print(appInfo.description);
      }
      showHelp(commands);
    } else if (args.showVersion) {
      print("Version: ${appInfo.version}");
    } else {
      app.call(args);
      exit(0);
    }
  } on MissingOptionException catch (error) {
    print(error.message);
    showHelp(commands);
  } on FormatException catch (error) {
    print(error.message);
    showHelp(commands);
  } on Exception catch (e) {
    print("$e\n");
  } finally {
    exit(1);
  }
}

showHelp(List<Command> commands) {
  print("\nUsage:");
  print(Arguments.getUsage(commands));
}
