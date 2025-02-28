import 'package:example_app/features/app/app_module.gr.dart';
import 'package:vader_app/vader_app.dart';

@AutoRouterConfig()
class AppModule extends VaderModule {
  AppModule();

  @override
  final String name = '';

  @override
  final routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: FirstRoute.page),
    AutoRoute(page: SecondRoute.page),
  ];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClientMock())
      ..addInstance(StorageClientMock());
  }
}
