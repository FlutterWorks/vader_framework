import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/events/event_module.dart';
import 'package:example_design/example_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  final app = VaderApp(
    modules: [AppModule(), EventModule()],
    theme: ExampleTheme(),
    isDebug: true,
    router: AppModule(),
  );
  app.setup();

  runApp(app);
}
