import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/events/event_repository.dart';
import 'package:example_app/features/events/logic/event_list_cubit.dart';
import 'package:example_app/features/events/pages/event_detail_page.dart';
import 'package:example_app/features/events/pages/event_list_page.dart';
import 'package:vader_app/vader_app.dart';

class EventModule extends AppModule {
  @override
  List<RouteBase> get routes => [$eventListRoute, $eventDetailRoute];

  @override
  Injector? get services {
    return super.services!
      ..addSingleton(EventRepository.new)
      ..addSingleton(EventListCubit.new)
      ..commit();
  }
}