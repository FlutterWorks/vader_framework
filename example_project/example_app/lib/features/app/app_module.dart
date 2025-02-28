import 'package:example_app/features/app/pages/first_page.dart';
import 'package:example_app/features/app/pages/second_page.dart';
import 'package:example_app/features/app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  AppModule();

  @override
  final String name = '';

  @override
  final routes = [Route.pageIndex(const SplashPage()), Route.page(const FirstPage()), Route.page(const SecondPage())];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClientMock())
      ..addInstance(StorageClientMock());
  }
}

class Route {
  static GoRoute pageIndex(Widget page, {bool enableTransition = false}) {
    return Route.page(page, isDefault: true, enableTransition: enableTransition);
  }

  static GoRoute page(Widget page, {bool isDefault = false, bool enableTransition = false, String? path}) {
    path = isDefault ? '/' : path ?? '/${page.runtimeType.toString().replaceFirst('Page', '')}';

    if (enableTransition) {
      return GoRoute(path: path, builder: (context, state) => page);
    } else {
      return GoRoute(path: path, pageBuilder: (context, state) => NoTransitionPage(child: page));
    }
  }
}
