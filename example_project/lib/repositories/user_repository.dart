import 'package:vader/vader.dart';
import 'package:example_project/entities/user.dart';

class UserRepository {
  UserRepository({
    required HttpClient httpClient,
    /*required SecureStorage storage*/
  }) {
    _httpClient = httpClient;
    //_storage = storage;
  }

  late final HttpClient _httpClient;

  //late final SecureStorage _storage;

  Future<User> getLoggedUser() async {
    final response = await _httpClient.request(
      path: '/auth/me',
      method: HttpMethod.get,
    );
    return User.fromJson(response.data);
  }

  Future<User> getUser(String userName) async {
    Future.delayed(const Duration(seconds: 1));
    return User(firstName: "John", lastName: "Doe", userName: userName);
  }

/*
  Future<void> saveLoggedUser(User? user) {
    if (user != null) {
      return _storage.saveMap(StorageKey.loggedUser.name, user.toJson());
    } else {
      return _storage.remove(StorageKey.loggedUser.name);
    }
  }
   */
}
