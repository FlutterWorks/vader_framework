# vader

Framework for simplify development of CLI Dart programs.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  vader_cli: ^1.0.0
```

Then run:

```sh
flutter pub get
```

## Usage:

1) Define Commands:
```
List<Command> commands = [
  ...CoreCommands.list,
  Command(
    flag: 'm',
    name: 'message',
    commandType: CommandType.option,
    commandHelp: 'Print message.',
  ),
];
```

2) Define Arguments:
```
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
```

3) Setup main function:
```
void main(List<String> args) {
  runCliApp(
    arguments: args,
    commands: commands,
    parser: ExampleArguments.parse,
    app: (args) {
      print("Main part of my app...");
      print("Message: ${args.message}");
    },
  );
}
```


## Author

👤 **Martin Jablečník**

* Website: [martin-jablecnik.cz](https://www.martin-jablecnik.cz)
* Github: [@mjablecnik](https://github.com/mjablecnik)
* Blog: [dev.to/mjablecnik](https://dev.to/mjablecnik)


## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/mjablecnik">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>


## 📝 License

Copyright © 2024 [Martin Jablečník](https://github.com/mjablecnik).<br />
This project is licensed under [MIT License](https://github.com/mjablecnik/vader_framework/blob/master/core/vader_cli/LICENSE).
