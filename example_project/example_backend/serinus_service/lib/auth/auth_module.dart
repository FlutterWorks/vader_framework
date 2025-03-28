import 'package:serinus/serinus.dart';
import 'package:serinus_service/auth/auth_controller.dart';
import 'package:serinus_service/auth/auth_service.dart';

class AuthModule extends Module {
  AuthModule() : super(
    imports: [],
    controllers: [AuthController()],
    providers: [AuthService()],
  );
}
