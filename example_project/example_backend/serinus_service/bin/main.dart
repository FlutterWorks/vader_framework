import 'package:vader_core/vader_core.dart';

Future<void> main(List<String> arguments) async {
  await sandbox(logLevel: LogLevel.debug, enableStopwatch: true, () async {
    try {
      logger.info("Test123");
      throw Exception("Test error");
    } catch (e) {
      logger.error(e.toString());
    }
  });
}

