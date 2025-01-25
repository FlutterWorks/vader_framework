import 'package:example/repositories/auth_repository.dart';
import 'package:example/repositories/product_repository.dart';
import 'package:example/repositories/user_repository.dart';
import 'package:vader_framework/vader_framework.dart';

setupInjector({required HttpClient httpClient}) {
  repositoryInjector
    ..addInstance(httpClient)
    ..addSingleton(SecureStorage.new)
    ..addSingleton(AuthRepository.new)
    ..addSingleton(UserRepository.new)
    ..addSingleton(ProductRepository.new)
    ..commit();
}
