import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/repositories/product_repository.dart';
import 'package:example_project/repositories/user_repository.dart';
import 'package:vader/framework.dart';

setupInjector({required HttpClient httpClient}) {
  repositoryInjector
    ..addInstance(httpClient)
    ..addSingleton(SecureStorage.new)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(ProductRepository.new)
    ..commit();
}
