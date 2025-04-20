import 'package:example_app/features/events/pages/event_detail_page.dart';
import 'package:example_design/example_design.dart';
import 'package:example_app/features/events/logic/event_list_cubit.dart';
import 'package:example_app/features/events/logic/event_list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';
import 'package:example_app/i18n/translations.g.dart';

import '../sections/action_section.dart';

part 'event_list_page.g.dart';

@TypedGoRoute<EventListRoute>(path: '/event/list')
class EventListRoute extends GoRouteData {
  const EventListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const EventListPage();
}

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: i18n.events.list.title,
      child: Column(
        children: [
          ActionSection(),
          BlocBuilder<EventListCubit, EventListState>(
            bloc: injector.use<EventListCubit>(),
            builder: (context, state) {
              return state.when(
                loading: () => Text("Eventy se načítají"),
                failed: (e) => Text("Nastala chyba: $e"),
                loaded: (events) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];
                        return EventCard(
                          width: double.infinity,
                          title: event.title,
                          place: event.address.name,
                          since: event.since,
                          until: event.until,
                          style: EventCardStyle(
                            decoration: BoxDecoration(
                              color: index % 2 == 0 ? AppColors.white : AppColors.blue200,
                            ),
                          ),
                          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
                          chips: event.tags.map((t) => Chip(text: t)).toList(),
                          onTap: () {
                            EventDetailRoute(event).push(context);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}