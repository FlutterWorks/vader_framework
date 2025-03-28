import 'package:serinus/serinus.dart';

import 'auth_service.dart';

class AuthController extends Controller {
  AuthController({super.path = '/'}) {
    on(Route.get('/hello'), _sayHello);
  }

  Future<String> _sayHello(RequestContext context) async {
    final name = context.query["name"] ?? "World";
    return context.use<AuthService>().getName(name);
  }
}
