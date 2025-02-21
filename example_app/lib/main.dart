import 'package:example_design/example_design.dart';
import 'package:example_app/features/events/event_list_page.dart';
import 'package:example_app/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

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
      home: EventListPage(),
    );
  }
}