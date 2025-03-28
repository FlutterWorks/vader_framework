import 'package:serinus/serinus.dart';
import 'package:hotreloader/hotreloader.dart';

import 'app.dart';

Future<void> main(List<String> arguments) async {
  String flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'devel');
  if (flavor == 'devel') await HotReloader.create(debounceInterval: Duration(milliseconds: 300));

  final app = await serinus.createApplication(entrypoint: AppModule(), host: '0.0.0.0', port: 3000);
  await app.serve();
}
