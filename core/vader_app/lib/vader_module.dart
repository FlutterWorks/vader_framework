import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

abstract class VaderModule {
  abstract final List<RouteBase> routes;
  abstract final Injector? services;
}

class Routes {
  static String path(String routePath, String name) => routePath == '/$name' ? routePath : '$routePath/$name';

  static GoRoute route(String path, Widget page, {bool enableTransition = false, String? pagePath}) {
    pagePath = pagePath ?? page.runtimeType.toString().replaceFirst('Page', '');

    final fullPath = Routes.path(path, pagePath.toLowerCase());

    if (enableTransition) {
      return GoRoute(path: fullPath, builder: (context, state) => page);
    } else {
      return GoRoute(path: fullPath, pageBuilder: (context, state) => NoTransitionPage(child: page, name: fullPath));
    }
  }
}
