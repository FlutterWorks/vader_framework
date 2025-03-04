import 'package:auto_injector/auto_injector.dart';
import 'package:mocktail/mocktail.dart';

class MockInjector extends Mock implements Injector {}

class Injector {
  Injector();

  final AutoInjector _injector = AutoInjector();

  void addInjector(Injector injector) => _injector.addInjector(injector._injector);


  T use<T>({String? key}) {
    return _injector.get<T>(key: key);
  }

  T? tryUse<T>({String? key}) {
    return _injector.tryGet<T>(key: key);
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
    _injector.disposeRecursive();
    //_injector = AutoInjector();
  }

  commit() {
    _injector.commit();
  }
}
