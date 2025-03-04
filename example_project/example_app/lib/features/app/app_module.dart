import 'package:example_app/features/app/pages/first_page.dart';
import 'package:example_app/features/app/pages/second_page.dart';
import 'package:example_app/features/app/pages/splash_page.dart';
import 'package:vader_app/vader_app.dart';

class AppModule extends VaderModule {
  AppModule();

  @override
  final String name = '';

  @override
  final routes = [
    Route.page(const SplashPage(), initial: true),
    Route.page(const FirstPage()),
    Route.page(const SecondPage()),
  ];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClient(apiUrl: 'https://www.example.com/api/', enableLogs: true, preventLargeResponses: true))
      ..addInstance(StorageClient());
  }
}
