import 'package:example_project/repositories/auth_repository.dart';
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
    ..commit();
}
