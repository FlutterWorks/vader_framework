import 'package:example_app/features/app/pages/first_page.dart';
import 'package:example_app/features/app/pages/second_page.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  AppModule();

  @override
  final String name = '';

  @override
  final routes = [
    GoRoute(path: '/', builder: (context, state) => const FirstPage()),
    GoRoute(path: '/second', builder: (context, state) => const SecondPage()),
  ];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClientMock())
      ..addInstance(StorageClientMock());
  }
}
