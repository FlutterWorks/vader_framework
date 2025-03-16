import 'package:example_app/features/app/pages/initial_page.dart';
import 'package:example_app/features/app/pages/error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<GoRoute> get routes => AppRoutes.routes;

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClient(apiUrl: 'https://www.example.com/api/', enableLogs: true, preventLargeResponses: true))
      ..addInstance(StorageClient());
  }
}

enum AppRoutes {
  initial(InitialPage()),
  error(ErrorPage());

  const AppRoutes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/app';

  get path => Routes.path(routePath, name);

  static List<GoRoute> get routes => [
    Routes.route(routePath, AppRoutes.initial._page),
    Routes.route(routePath, AppRoutes.error._page),
  ];
}
