import 'package:serinus/serinus.dart';
import 'package:serinus_service/auth/auth_module.dart';
import 'package:serinus_service/todo/todo_module.dart';

class AppModule extends Module {
  AppModule() : super(
    imports: [TodoModule(), AuthModule()],
    controllers: [],
    providers: [],
  );
}