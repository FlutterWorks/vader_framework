import 'package:example_app/features/app/pages/first_page.dart';
import 'package:example_app/features/app/pages/second_page.dart';
import 'package:example_app/features/app/pages/initial_page.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  AppModule();

  @override
  final String path = '/app';

  @override
  List<GoRoute> get routes => [
    route(const InitialPage(), initial: true),
    route(const FirstPage()),
    route(const SecondPage()),
  ];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClient(apiUrl: 'https://www.example.com/api/', enableLogs: true, preventLargeResponses: true))
      ..addInstance(StorageClient());
  }
}

enum AppRoutes {
  initial,
  first,
  second;

  final modulePath = '/app';

  get path => '$modulePath/${name == 'initial' ? '' : name}';
}
