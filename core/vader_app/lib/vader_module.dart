import 'package:vader_app/vader_app.dart';

abstract class VaderModule extends RootStackRouter {
  abstract final String name;
  @override
  abstract final List<AutoRoute> routes;
  abstract final Injector? services;

  get injector {
    final injector = Injector();

    if (services != null) injector.addInjector(services!..commit());

    return injector;
  }
}
