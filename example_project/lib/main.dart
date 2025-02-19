import 'package:example_design/example_design.dart';
import 'package:example_project/global.dart';
import 'package:example_project/pages/event_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AppBarTheme;
import 'package:vader/vader.dart';

void main() {
  setupInjector(httpClient: HttpClientMock(), storageClient: StorageClientMock());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      debugShowCheckedModeBanner: false,
      theme: ExampleDesignTheme.light,
      darkTheme: ExampleDesignTheme.dark,
      home: EventPage(),
      materialThemeBuilder: (context, theme) {
        return theme.copyWith(
          appBarTheme: AppBarTheme(
            color: DesignColors.white,
            surfaceTintColor: DesignColors.white,
          ),
        );
      },
    );
  }
}