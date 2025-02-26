import 'package:example_app/features/events/pages/event_detail_page.dart';
import 'package:example_app/features/events/pages/event_list_page.dart';
import 'package:vader_app/vader_app.dart';

class EventModule extends VaderModule {
  EventModule();

  @override
  final String name = 'event';

  @override
  final routes = [
    GoRoute(path: '/list', builder: (context, state) => const EventListPage()),
    GoRoute(path: '/detail', builder: (context, state) => const EventDetailPage()),
  ];

  @override
  Injector? get services {
    return Injector()
      ..addInstance(HttpClientMock())
      ..addInstance(StorageClientMock());
  }
}
