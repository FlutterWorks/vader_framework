import 'package:example_app/features/app/app.module.dart';
import 'package:example_app/features/auth/auth.repository.dart';
import 'package:vader_app/vader_app.dart';

import 'logic/auth.bloc.dart';

class AuthModule extends AppModule {
  @override
  get routes => [];

  @override
  Injector? get services {
    return super.services!
      ..add(AuthRepository.new)
      ..add(AuthBloc.new)
      ..commit();
  }
}
