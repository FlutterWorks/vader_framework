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

  addLazyInstance<T>(Future<T> instance, {String? key}) {
    instance.then((e) {
      _injector.uncommit();
      _injector.addInstance(e, key: key);
      _injector.commit();
    });
  }

  addSingleton<T>(Function constructor, {String? key}) {
    _injector.addSingleton(constructor, key: key);
  }

  add<T>(Function constructor, {String? key}) {
    _injector.addSingleton(constructor, key: key);
  }

  reset() {
    _injector.disposeRecursive();
  }

  commit() {
    _injector.commit();
  }

  uncommit() {
    _injector.uncommit();
  }
}
