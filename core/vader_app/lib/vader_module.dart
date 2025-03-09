import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

abstract class VaderModule {
  abstract final List<GoRoute> routes;
  abstract final Injector? services;
}

class Routes {
  static GoRoute route(
    String path,
    Widget page, {
    bool initial = false,
    bool enableTransition = false,
    String? pagePath,
  }) {
    pagePath = pagePath ?? page.runtimeType.toString().replaceFirst('Page', '');
    final fullPath = initial ? path : '$path/$pagePath'.replaceFirst('//', '/');

    if (enableTransition) {
      return GoRoute(path: fullPath, builder: (context, state) => page);
    } else {
      return GoRoute(path: fullPath, pageBuilder: (context, state) => NoTransitionPage(child: page, name: fullPath));
    }
  }
}
