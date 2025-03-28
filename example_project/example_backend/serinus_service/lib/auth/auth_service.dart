import 'package:serinus/serinus.dart';


class AuthService extends Provider {
  AuthService();

  String getName(String name) {
    return "Hello $name!!!\n";
  }
}
