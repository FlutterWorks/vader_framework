import 'dart:io';

import 'package:example_app/config.dart';
import 'package:example_app/features/app/pages/initial_page.dart';
import 'package:example_app/features/app/pages/error_page.dart';
import 'package:flutter/foundation.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialRoute, $errorRoute];

  @override
  Injector? get services {
    final appConfig = AppConfig();
    return Injector()
      ..addInstance(appConfig)
      ..addInstance(HttpClient(apiUrl: appConfig.apiUrl, enableLogs: true, preventLargeResponses: true, kIsWeb: kIsWeb))
      ..addInstance(StorageClient(path: kIsWeb ? null : Directory.systemTemp.path));
  }
}