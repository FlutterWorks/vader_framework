import 'package:vader/framework.dart';
import 'package:example_project/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const UserState._();

  const factory UserState.init([User? user]) = UserStateInit;

  const factory UserState.reset([User? user]) = UserStateReset;

  const factory UserState.loading() = UserStateLoading;

  const factory UserState.failure(Exception error) = UserStateFailure;

  const factory UserState.success(User user) = UserStateSuccess;
}