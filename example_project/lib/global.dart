import 'package:example_project/features/events/event_list_cubit.dart';
import 'package:example_project/features/auth/auth_repository.dart';
import 'package:example_project/features/events/event_repository.dart';
import 'package:example_project/features/products/product_repository.dart';
import 'package:example_project/features/app/user_repository.dart';
import 'package:vader_app/vader_app.dart';

setupInjector({required HttpClient httpClient, required StorageClient storageClient}) {
  repositoryInjector
    ..addInstance(httpClient)
    ..addInstance(storageClient)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(ProductRepository.new)
    ..addSingleton(EventRepository.new)
    ..addSingleton(EventListCubit.new)
    ..commit();
}
