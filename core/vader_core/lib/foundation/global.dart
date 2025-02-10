import 'package:auto_injector/auto_injector.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vader_core/clients/http_client.dart';
import 'package:vader_core/clients/storage_client.dart';

class MockInjector extends Mock implements AutoInjector {}

AutoInjector repositoryInjector = AutoInjector();

AutoInjector setupInjector({
  required HttpClient httpClient,
  required StorageClient storageClient,
}) {
  return repositoryInjector
    ..addInstance(httpClient)
    ..addInstance(storageClient);
}

resetInjector() {
  repositoryInjector = AutoInjector();
}

class StoreKeys {
  static const deviceId = 'deviceId';
  static const loggedUser = 'loggedUser';
}

enum StorageKey { deviceId, loggedUser, themeMode }

class Constants {
  static const methodChannel = 'flutter.app.channel';
}
