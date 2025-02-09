import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/repositories/product_repository.dart';
import 'package:example_project/repositories/user_repository.dart';
import 'package:vader/vader.dart';

setupInjector({required HttpClient httpClient, required SecureStorage secureStorage}) {
  repositoryInjector
    ..addInstance(httpClient)
    ..addInstance(secureStorage)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(ProductRepository.new)
    ..commit();
}
