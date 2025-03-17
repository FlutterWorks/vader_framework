export 'package:vader_core/vader_core.dart';
export 'package:vader_design/vader_design.dart';

export 'package:go_router/go_router.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
export 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';

export 'vader_app_tester.dart';
export 'vader_module.dart';
export 'splash_view.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:vader_core/clients/logger.dart';
import 'package:vader_design/design/themes.dart';
import 'package:vader_app/vader_module.dart';
import 'package:vader_core/clients/injector.dart';

final Injector injector = Injector();

class VaderApp extends StatefulWidget {
  const VaderApp({
    super.key,
    required this.modules,
    required this.theme,
    this.localization,
    this.isDebug = false,
    this.entrypoint,
  });

  final List<VaderModule> modules;

  final VaderTheme theme;

  final bool isDebug;

  final String? entrypoint;

  final Localization? localization;

  @override
  State<VaderApp> createState() => _VaderAppState();
}

class _VaderAppState extends State<VaderApp> {
  @override
  void initState() {
    super.initState();
    Bloc.observer = TalkerBlocObserver(talker: logger.getTalker());
    setupModules();
  }

  void setupModules() {
    for (var module in widget.modules) {
      if (module.services != null) {
        injector.addInjector(module.services!);
      }
    }
    injector.commit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: widget.isDebug,
      theme: widget.theme.light,
      darkTheme: widget.theme.dark,
      locale: widget.localization?.locale,
      supportedLocales: widget.localization?.supportedLocales ?? const <Locale>[Locale('en', 'US')],
      localizationsDelegates: widget.localization?.delegates,
      routerConfig: GoRouter(
        observers: [TalkerRouteObserver(logger.getTalker())],
        initialLocation: widget.entrypoint,
        routes: [for (var module in widget.modules) ...module.routes],
      ),
    );
  }
}

class Localization {
  const Localization({required this.locale, required this.supportedLocales, required this.delegates});

  final Locale locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>> delegates;
}
