import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VaderApp extends ShadApp {
  const VaderApp({
    super.key,
    super.navigatorKey,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.onNavigationNotification,
    super.navigatorObservers = const <NavigatorObserver>[],
    super.initialRoute,
    super.home,
    super.routes = const <String, WidgetBuilder>{},
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.showPerformanceOverlay = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = true,
    super.shortcuts,
    super.actions,
    super.theme,
    super.darkTheme,
    super.themeMode,
    super.restorationScopeId,
    super.scrollBehavior = const ShadScrollBehavior(),
    super.pageRouteBuilder,
    super.themeCurve = Curves.linear,
    super.materialThemeBuilder,
  });
}
