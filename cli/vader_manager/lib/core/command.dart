import 'dart:convert';
import 'dart:io';
import 'package:vader_manager/core/help.dart';
import 'package:yaml/yaml.dart';

/// Load Yaml file with commands
File loadCommandsFile(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('The commands.yaml file does not exist!');
    exit(1);
  }
  return file;
}

/// Recursively processes commands based on CLI arguments.
void processCommandsRecursively(
    YamlMap currentMap,
    List<String> args,
    String currentPath, {
      required YamlMap topLevelMap,
      int index = 0,
    }) {
  // Base case: If we've processed all arguments, stop
  if (index >= args.length) {
    printHelp(currentMap, currentPath: currentPath);
    return;
  }

  final arg = args[index];
  final isHelpRequested = args.contains('-h') || args.contains('--help') || args.contains('help');

  // If the argument is not in the current map, show help for the last valid command
  if (!currentMap.containsKey(arg)) {
    stdout.writeln('Command not found\n');
    printHelp(currentMap, currentPath: currentPath);
    return;
  }

  final value = currentMap[arg];

  // If it's a valid subcommand (a YAML map)
  if (value is YamlMap) {
    final nextPath = '$currentPath $arg';

    // If help is requested, show help for the current command
    if (value.containsKey('cmd') && isHelpRequested) {
      printHelp(value, currentPath: nextPath);
      return;
    }

    // If it's a terminal command, execute it
    if (value.containsKey('cmd')) {
      final cmd = value['cmd'];
      if (cmd is String) {
        _runShellCommand(cmd, args.sublist(index + 1));
      } else {
        stderr.writeln('Invalid "cmd" value for "$arg".');
      }
      return;
    }

    // If it's a subcommand group, recurse deeper
    processCommandsRecursively(
      value,
      args,
      nextPath,
      topLevelMap: topLevelMap,
      index: index + 1,
    );
  } else {
    stdout.writeln('Item "$arg" is not a valid subcommand. Showing help for parent command.\n');
    printHelp(currentMap, currentPath: currentPath);
  }
}



/// Runs a shell command on Unix (calling 'bash').
Future<void> _runShellCommand(String command, List<String> arguments) async {
  stdout.writeln('Executing: $command ${arguments.join(" ")}\n');
  try {
    final process = await Process.start(
      'bash',
      ['-c', "$command ${arguments.join(" ")}"],
      //mode: ProcessStartMode.inheritStdio,
      runInShell: true,
    );

    stdin.pipe(process.stdin);

    process.stdout.transform(utf8.decoder).listen((data) {
      stdout.write(data);
    });

    process.stderr.transform(utf8.decoder).listen((data) {
      stderr.write(data);
    });

    final exitCode = await process.exitCode;

    if (exitCode != 0) {
      stderr.writeln('Command exited with code: $exitCode');
    }
  } catch (e) {
    stderr.writeln('Failed to run "$command ${arguments.join(" ")}": $e');
  }
}
