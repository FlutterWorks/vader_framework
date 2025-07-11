import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/auth/auth_repository.dart';
import 'package:vader_app/vader_app.dart';

import 'logic/auth_bloc.dart';

class AuthModule extends AppModule {
  @override
  get routes => [];

  @override
  Injector? get services {
    return super.services!
      ..addSingleton(AuthRepository.new)
      ..addSingleton(AuthBloc.new)
      ..commit();
  }
}
