import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/events/event_module.dart';
import 'package:example_app/i18n/translations.g.dart';
import 'package:example_design/example_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      modules: [AppModule(), EventModule()],
      theme: ExampleTheme(),
      isDebug: false,
      entrypoint: AppRoutes.initial.path,
      localization: Localization(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        delegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}
