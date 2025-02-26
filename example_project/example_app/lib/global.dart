import 'package:example_app/features/events/logic/event_list_cubit.dart';
import 'package:example_app/features/auth/auth_repository.dart';
import 'package:example_app/features/events/event_repository.dart';
import 'package:example_app/features/app/user_repository.dart';
import 'package:vader_app/vader_app.dart';

setupInjector({required HttpClient httpClient, required StorageClient storageClient}) {
  injector
    ..addInstance(httpClient)
    ..addInstance(storageClient)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(EventRepository.new)
    ..addSingleton(EventListCubit.new)
    ..commit();
}
