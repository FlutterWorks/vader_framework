import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
export 'package:talker/talker.dart' show LogLevel;

final logger = Logger.get;

class Logger {
  late Talker _talker;

  static Logger get get => Logger._internal();

  final TalkerLogger _talkerLogger = TalkerLogger(filter: LogLevelFilter(LogLevel.verbose));

  final TalkerSettings _talkerSettings = TalkerSettings(useHistory: false, useConsoleLogs: true, enabled: true);

  Logger._internal() {
    _talker = Talker(settings: _talkerSettings, logger: _talkerLogger);
  }

  setObserver(observer) {
    _talker = Talker(observer: observer, settings: _talkerSettings, logger: _talkerLogger);
  }

  Talker getTalker() => _talker;

  setLogLevel(LogLevel level) {
    _talker.configure(logger: _talkerLogger.copyWith(filter: LogLevelFilter(level)));
  }

  void debug(String msg, {Object? exception, StackTrace? stackTrace}) {
    return _talker.debug(msg, exception, stackTrace);
  }

  void info(String msg, {Object? exception, StackTrace? stackTrace}) {
    return _talker.info(msg, exception, stackTrace);
  }

  void warning(String msg, {Object? exception, StackTrace? stackTrace}) {
    return _talker.warning(msg, exception, stackTrace);
  }

  void error(String msg, {Object? exception, StackTrace? stackTrace}) {
    return _talker.error(msg, exception, stackTrace);
  }

  void critical(String msg, {Object? exception, StackTrace? stackTrace}) {
    return _talker.critical(msg, exception, stackTrace);
  }

  void exception(Object exception, {StackTrace? stackTrace}) {
    return _talker.handle(exception, stackTrace);
  }

  static TalkerDioLogger dioInterceptor({bool preventLargeResponses = true}) {
    return TalkerDioLogger(
      talker: Logger.get._talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseHeaders: false,
        printResponseMessage: true,
        responseFilter: (response) {
          if (preventLargeResponses) {
            return response.data.toString().length <= 500;
          } else {
            return true;
          }
        },
      ),
    );
  }
}

class LoggerObserver extends TalkerObserver {
  const LoggerObserver();

  @override
  void onError(err);

  @override
  void onException(err);
}
