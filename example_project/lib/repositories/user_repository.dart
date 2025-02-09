import 'package:vader/vader.dart';
import 'package:example_project/entities/user.dart';

class UserRepository extends Repository {
  UserRepository({
    required super.httpClient,
    required super.secureStorage,
  });

  Future<User> getLoggedUser() async {
    final response = await httpClient.request(
      path: '/auth/me',
      method: HttpMethod.get,
    );
    return User.fromJson(response.data);
  }

  Future<User> getUser(String userName) async {
    Future.delayed(const Duration(seconds: 1));
    return User(firstName: "John", lastName: "Doe", userName: userName);
  }

  Future<void> saveLoggedUser(User? user) {
    if (user != null) {
      return secureStorage.saveMap(StorageKey.loggedUser.name, user.toJson());
    } else {
      return secureStorage.remove(StorageKey.loggedUser.name);
    }
  }
}
