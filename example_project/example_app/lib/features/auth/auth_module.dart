import 'package:example_app/features/app/pages/first_page.dart';
import 'package:example_app/features/app/pages/second_page.dart';
import 'package:example_app/features/auth/auth_repository.dart';
import 'package:vader_app/vader_app.dart';

import 'auth_bloc.dart';

class AuthModule extends VaderModule {
  AuthModule();

  @override
  final String name = 'auth';

  @override
  final routes = [
    //GoRoute(path: '/', builder: (context, state) => const FirstPage()),
    //GoRoute(path: '/second', builder: (context, state) => const SecondPage()),
  ];

  @override
  Injector? get services {
    return Injector()
      ..add(AuthRepository.new)
      ..add(AuthBloc.new);
  }
}
