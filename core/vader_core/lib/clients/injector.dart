import 'package:auto_injector/auto_injector.dart';
import 'package:mocktail/mocktail.dart';

class MockInjector extends Mock implements Injector {}

class Injector {

  static Injector get get => Injector._internal();

  AutoInjector _injector = AutoInjector();

  Injector._internal() {
    _injector = AutoInjector();
  }

  T use<T>({String? key}) {
    return _injector.get<T>(key: key);
  }

  addInstance<T>(T instance, {String? key}) {
    _injector.addInstance(instance, key: key);
  }

  addSingleton<T>(Function constructor, {String? key}) {
    _injector.addSingleton(constructor, key: key);
  }

  add<T>(Function constructor, {String? key}) {
    _injector.add(constructor, key: key);
  }

  reset() {
    _injector = AutoInjector();
  }

  commit() {
    _injector.commit();
  }
}

final Injector injector = Injector.get;
