import 'package:example/logic/bloc/auth_bloc.dart';
import 'package:example/logic/events/auth_events.dart';
import 'package:example/logic/states/auth_state.dart';
import 'package:example/repositories/auth_repository.dart';
import 'package:example/repositories/user_repository.dart';
import 'package:vader_framework/vader_framework.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import '../repository/mock_response_data.dart';
import '../setup.dart';
import 'mock_entities_data.dart';

fakeData() {
  final httpClient = HttpClientMock();
  setupInjector(httpClient: httpClient)
    ..add(AuthRepository.new)
    ..add(UserRepository.new)
    ..commit();

  when(() => httpClient.setHeader('authorization', any())).thenReturn(true);

  when(
    () => httpClient.request(
      path: '/auth/login',
      method: HttpMethod.post,
      data: {'username': 'emilys', 'password': 'emilyspass'},
    ),
  ).thenAnswer((i) => Future.value(userLoginResponse));

  when(
    () => httpClient.request(
      path: '/auth/me',
      method: HttpMethod.get,
    ),
  ).thenAnswer((i) => Future.value(userDetailResponse));
}

void main() {
  late AuthBloc counterBloc;

  group(AuthBloc, () {
    setUp(() {
      setupData(fakeData, useFakeData: true);
      counterBloc = AuthBloc(authRepository: repositoryInjector.get<AuthRepository>());
    });
    tearDown(() => resetInjector());

    blocTest(
      'Auth Login',
      build: () => counterBloc,
      act: (bloc) => bloc.add(AuthLogin(
        userName: "emilys",
        password: "emilyspass",
        type: LoginType.token,
      )),
      expect: () => [
        UserState.loading(),
        UserState.success(expectedLoginUser),
      ],
    );

    blocTest(
      'Get logged user',
      build: () => counterBloc,
      act: (bloc) => bloc.add(AuthShowUser()),
      expect: () => [
        UserState.loading(),
        UserState.success(expectedLoggedUser),
      ],
    );
  });
}
