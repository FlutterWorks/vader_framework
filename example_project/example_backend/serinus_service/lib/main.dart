import 'package:serinus/serinus.dart';
import 'package:hotreloader/hotreloader.dart';

import 'app_module.dart';

Future<void> main(List<String> arguments) async {
  await HotReloader.create(debounceInterval: Duration(milliseconds: 300));
  final app = await serinus.createApplication(entrypoint: AppModule(), host: '0.0.0.0', port: 3000);
  await app.serve();
}
