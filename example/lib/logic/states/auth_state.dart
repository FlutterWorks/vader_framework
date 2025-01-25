import 'package:vader_common/vader_common.dart';
import 'package:example/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const UserState._();

  const factory UserState.init([User? user]) = UserStateInit;

  factory UserState.reset([User? user]) => UserStateInit(user);

  const factory UserState.loading() = UserStateLoading;

  const factory UserState.failure(Exception error) = UserStateFailure;

  const factory UserState.success(User user) = UserStateSuccess;
}