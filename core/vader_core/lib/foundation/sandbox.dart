import '../clients/logger.dart';

Future<void> sandbox(Function function, {LogLevel logLevel = LogLevel.debug, bool enableStopwatch = true}) async {
  logger.setLogLevel(logLevel);
  final sw = Stopwatch()..start();

  await function.call();

  sw.stop();
  if (enableStopwatch) {
    print("Elapsed time: ${sw.elapsed}");
  }
}
