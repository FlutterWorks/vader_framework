import 'package:serinus/serinus.dart';
import 'package:serinus_service/todo/todo_controller.dart';
import 'package:serinus_service/todo/todo_service.dart';

class AppModule extends Module {
  AppModule() : super(
    imports: [],
    controllers: [
      TodoController()
    ],
    providers: [
      TodoService()
    ],
  );
}