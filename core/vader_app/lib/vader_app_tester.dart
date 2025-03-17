import 'package:vader_app/vader_app.dart';

class VaderAppTester {
  const VaderAppTester({required this.modules});

  final List<VaderModule> modules;

  Future<VaderAppTester> init({Duration? waitTime}) async {
    setupModules();
    await Future.delayed(waitTime ?? Duration(milliseconds: 1000));
    return this;
  }

  void setupModules() {
    for (var module in modules) {
      if (module.services != null) {
        injector.addInjector(module.services!);
      }
    }
    injector.commit();
  }
}
