import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/app/pages/initial_page.dart';
import 'package:example_app/features/events/event_module.dart';
import 'package:example_app/i18n/translations.g.dart';
import 'package:example_design/example_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logger.setObserver(CrashlyticsLoggerObserver());

  AppIcons.setup();

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
      entrypoint: InitialRoute().location,
      localization: Localization(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        delegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}

class CrashlyticsLoggerObserver extends LoggerObserver {
  const CrashlyticsLoggerObserver();

  @override
  void onError(err) {
    //FirebaseCrashlytics.instance.recordError(err.error, err.stackTrace, reason: err.message);
  }

  @override
  void onException(err) {
    //FirebaseCrashlytics.instance.recordError(err.exception, err.stackTrace, reason: err.message);
  }
}
