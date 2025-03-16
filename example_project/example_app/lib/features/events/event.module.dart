import 'package:example_app/features/app/app.module.dart';
import 'package:example_app/features/events/event.repository.dart';
import 'package:example_app/features/events/logic/event_list.cubit.dart';
import 'package:example_app/features/events/pages/event_detail.page.dart';
import 'package:example_app/features/events/pages/event_list.page.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

class EventModule extends AppModule {
  @override
  List<GoRoute> get routes => EventRoutes.routes;

  @override
  Injector? get services {
    return super.services!
      ..add(EventRepository.new)
      ..add(EventListCubit.new)
      ..commit();
  }
}

enum EventRoutes {
  eventList(EventListPage()),
  eventDetail(EventDetailPage());

  const EventRoutes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/event';

  get path => Routes.path(routePath, name);

  static List<GoRoute> get routes => [
    Routes.route(routePath, EventRoutes.eventList._page),
    Routes.route(routePath, EventRoutes.eventDetail._page),
  ];
}
