import 'package:vader/framework.dart';
import 'package:example_project/logic/events/auth_events.dart';
import 'package:example_project/logic/states/auth_state.dart';
import 'package:example_project/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, UserState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(UserState.init()) {
    on<AuthGetUser>(_onGetUser);
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
  }

  late final AuthRepository _authRepository;

  Future<void> _onLogin(AuthLogin event, Emitter<UserState> emit) async {
    try {
      emit(UserState.loading());
      final UserState user = UserState.loggedIn(
        await _authRepository.login(
          userName: event.userName,
          password: event.password,
          type: event.type,
        ),
      );
      emit(user);
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }

  Future<void> _onGetUser(AuthGetUser event, Emitter<UserState> emit) async {
    try {
      emit(UserState.loading());
      final UserState user = UserState.success(await _authRepository.loggedUser());
      emit(user);
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }

  void _onLogout(AuthLogout event, Emitter<UserState> emit) {
    try {
      _authRepository.logout();
      emit(UserState.loggedOut());
    } catch (e, stackTrace) {
      emit(UserState.failure(e as Exception));
    }
  }
}
