import 'dart:io';

import 'package:yaml/yaml.dart';

/// Generate shell completion script and exit program
int generateCompletions(String shellType, YamlMap vaderSection) {
  switch (shellType) {
    case 'zsh':
      stdout.write(generateZshCompletions(vaderSection));
      exit(0);
    case 'bash':
      stdout.write(generateBashCompletions(vaderSection));
      exit(0);
    default:
      stderr.writeln('Unknown shell type: $shellType (use "zsh" or "bash")');
      exit(1);
  }
}


/// ===========================================================================
///  Below are two functions to GENERATE completion scripts (ZSH and Bash).
///
///  1) [_generateZshCompletions]
///  2) [_generateBashCompletions]
///
///  Both traverse the YAML to build a static shell script
///  that can autocomplete top-level and nested subcommands.
/// ===========================================================================

/// Generates a ZSH completion script as a [String].
String generateZshCompletions(YamlMap vaderSection) {
  final commandsMap = <String, List<String>>{};
  _buildCommandsMap(vaderSection, 'vader', commandsMap);

  final buffer = StringBuffer();

  buffer.writeln(r'#compdef vader ./vader');
  buffer.writeln();
  buffer.writeln(r'_vader_cli_zsh_completions() {');
  buffer.writeln(r'  local context state state_descr line');
  buffer.writeln(r'  typeset -A opt_args');
  buffer.writeln();
  buffer.writeln(r'  _arguments -C \');
  buffer.writeln(r'    "*: :->subcmd";');
  buffer.writeln();
  buffer.writeln(r'  case $state in');
  buffer.writeln(r'    subcmd)');
  buffer.writeln(r'      _vader_cli_zsh_get_completions');
  buffer.writeln(r'      return');
  buffer.writeln(r'    ;;');
  buffer.writeln(r'  esac');
  buffer.writeln(r'}');
  buffer.writeln();
  buffer.writeln(r'_vader_cli_zsh_get_completions() {');
  buffer.writeln(r'  local completions=()');
  buffer.writeln(r'  local -a path');
  buffer.writeln(r'  path=()');
  buffer.writeln();
  buffer.writeln(r'  for (( i=1; i<=$CURRENT; i++ )); do');
  buffer.writeln(r'    if [[ $words[$i] != "vader" && $words[$i] != "./vader" ]]; then');
  buffer.writeln(r'      path+="$words[$i]"');
  buffer.writeln(r'    fi');
  buffer.writeln(r'  done');
  buffer.writeln();
  buffer.writeln(r'  local lastIndex=$(( ${#path[@]} ))');
  buffer.writeln();
  buffer.writeln(r'  local joinPath="${path[0]}"');
  buffer.writeln(r'  for (( i=1; i<$lastIndex; i++ )); do');
  buffer.writeln(r'    joinPath+=".${path[$i]}"');
  buffer.writeln(r'  done');
  buffer.writeln();
  buffer.writeln(r'  case "$joinPath" in');

  for (final pathKey in commandsMap.keys) {
    final subs = commandsMap[pathKey]!;
    final listString = subs.join(' ');
    buffer.writeln('    "${pathKey.replaceAll('vader', '')}")');
    buffer.writeln('      completions=($listString)');
    buffer.writeln(r'    ;;');
  }

  buffer.writeln(r'    *)');
  buffer.writeln(r'    ;;');
  buffer.writeln(r'  esac');
  buffer.writeln();
  buffer.writeln(r'  compadd -- $completions');
  buffer.writeln(r'}');
  buffer.writeln();
  buffer.writeln(r'compdef _vader_cli_zsh_completions vader ./vader');

  return buffer.toString();
}

/// Generates a Bash completion script as a [String].
String generateBashCompletions(YamlMap vaderSection) {
  final commandsMap = <String, List<String>>{};
  _buildCommandsMap(vaderSection, 'vader', commandsMap);

  final buffer = StringBuffer();
  buffer.writeln(r'# Bash completion script for vader');
  buffer.writeln(r'# Usage:');
  buffer.writeln(r'#   dart run bin/vader completions bash > ~/.vader_completions.bash');
  buffer.writeln(r'#   echo "source ~/.vader_completions.bash" >> ~/.bashrc');
  buffer.writeln();
  buffer.writeln(r'_vader_cli_bash_completions() {');
  buffer.writeln(r'  local cur prev words cword');
  buffer.writeln(r'  _get_comp_words_by_ref -n = cur prev words cword');
  buffer.writeln();
  buffer.writeln(r'  local pathArr=()');
  buffer.writeln(r'  for (( i=1; i<$cword; i++ )); do');
  buffer.writeln(r'    pathArr+=("${words[$i]}")');
  buffer.writeln(r'  done');
  buffer.writeln(r'  if [ ${#pathArr[@]} -eq 0 ]; then');
  buffer.writeln(r'    pathArr=("vader")');
  buffer.writeln(r'  fi');
  buffer.writeln();
  buffer.writeln(r'  local joinPath="${pathArr[0]}"');
  buffer.writeln(r'  for (( i=1; i<${#pathArr[@]}; i++ )); do');
  buffer.writeln(r'    joinPath+=".${pathArr[$i]}"');
  buffer.writeln(r'  done');
  buffer.writeln();
  buffer.writeln(r'  local completions=()');
  buffer.writeln(r'  case "$joinPath" in');

  for (final pathKey in commandsMap.keys) {
    final subs = commandsMap[pathKey]!;
    final listString = subs.join(' ');
    buffer.writeln(r'    "$pathKey")');
    buffer.writeln('      completions=($listString)');
    buffer.writeln(r'    ;;');
  }

  buffer.writeln(r'    *)');
  buffer.writeln(r'      completions=()');
  buffer.writeln(r'    ;;');
  buffer.writeln(r'  esac');
  buffer.writeln();
  buffer.writeln(r'  COMPREPLY=( $(compgen -W "${completions[*]}" -- "$cur") )');
  buffer.writeln(r'}');
  buffer.writeln();
  buffer.writeln(r'complete -F _vader_cli_bash_completions vader');

  return buffer.toString();
}


/// Builds a map of <path, List<String>> that indicates each "path" in the hierarchy
/// and the sub-commands under it.
///
/// For example:
///   commandsMap["vader"] = ["init","update","clean","run","release","generate"]
///   commandsMap["vader.run"] = ["dev","beta","prod","tests"]
///
/// That way, we can generate either ZSH or Bash scripts that know how to autocomplete.
void _buildCommandsMap(
    YamlMap currentMap,
    String currentPath,
    Map<String, List<String>> commandsMap,
    ) {
  // Gather all keys (except "desc")
  final keys = <String>[];
  for (final key in currentMap.keys) {
    if (key == 'desc') continue;
    keys.add(key);
  }
  commandsMap[currentPath] = keys;

  // For sub-groups, recurse if not containing "cmd"
  for (final key in currentMap.keys) {
    if (key == 'desc') continue;
    final value = currentMap[key];
    if (value is YamlMap) {
      // If there's no 'cmd', it's likely a sub-group
      if (!value.containsKey('cmd')) {
        _buildCommandsMap(value, '$currentPath.$key', commandsMap);
      }
    }
  }
}
