import 'package:example_app/config.dart';
import 'package:example_app/features/app/pages/initial_page.dart';
import 'package:example_app/features/app/pages/error_page.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  @override
  List<RouteBase> get routes => [$initialRoute, $errorRoute];

  @override
  Injector? get services {
    final appConfig = AppConfig();
    return Injector()
      ..addInstance(appConfig)
      ..addInstance(HttpClient(apiUrl: appConfig.apiUrl, enableLogs: true, preventLargeResponses: true))
      ..addInstance(StorageClient());
  }
}

/*
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
 */