import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

abstract class VaderModule {
  abstract final String? path;
  abstract final List<GoRoute> routes;
  abstract final Injector? services;

  GoRoute route(Widget page, {bool initial = false, bool enableTransition = false, String? path}) {
    final modulePath = this.path ?? runtimeType.toString().replaceFirst('Module', '');
    final pagePath = path ?? page.runtimeType.toString().replaceFirst('Page', '');
    final fullPath = initial ? modulePath : '$modulePath/$pagePath'.replaceFirst('//', '/');
    print(fullPath);

    if (enableTransition) {
      return GoRoute(path: fullPath, builder: (context, state) => page);
    } else {
      return GoRoute(path: fullPath, pageBuilder: (context, state) => NoTransitionPage(child: page));
    }
  }
}
