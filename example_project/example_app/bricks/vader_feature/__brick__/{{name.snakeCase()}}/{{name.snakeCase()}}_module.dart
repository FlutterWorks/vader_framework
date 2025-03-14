import 'package:{{package.snakeCase()}}_app/features/app/app_module.dart';
import 'package:{{package.snakeCase()}}_app/features/{{name.snakeCase()}}/{{name.snakeCase()}}_page.dart';
import 'package:{{package.snakeCase()}}_app/features/{{name.snakeCase()}}/{{name.snakeCase()}}_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

class {{name.pascalCase()}}Module extends AppModule {
  @override
  List<GoRoute> get routes => {{name.pascalCase()}}Routes.routes;

  @override
  Injector? get services {
    return super.services!
      ..add({{name.pascalCase()}}Repository.new)
      ..commit();
  }
}

enum {{name.pascalCase()}}Routes {
  {{name.camelCase()}}({{name.pascalCase()}}Page());

  const {{name.pascalCase()}}Routes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/{{name.camelCase()}}';

  get path => Routes.path(routePath, name);

  static List<GoRoute> get routes => [Routes.route(routePath, {{name.pascalCase()}}Routes.{{name.camelCase()}}._page)];
}
