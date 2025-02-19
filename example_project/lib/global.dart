import 'package:example_project/logic/cubits/event_list_cubit.dart';
import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/repositories/event_repository.dart';
import 'package:example_project/repositories/product_repository.dart';
import 'package:example_project/repositories/user_repository.dart';
import 'package:vader/vader.dart';

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
