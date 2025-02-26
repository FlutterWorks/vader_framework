import 'package:example_design/example_design.dart';
import 'package:example_app/features/events/event_list_cubit.dart';
import 'package:example_app/features/events/event_list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

import '../components/button_section.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Seznam událostí",
      child: Column(
        children: [
          ButtonSection(),
          BlocBuilder<EventListCubit, EventListState>(
            bloc: injector.use<EventListCubit>(),
            builder: (context, state) {
              return state.when(
                init: () => Text("Eventy se načítají"),
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
                              color: index % 2 == 0 ? DesignColors.white : DesignColors.blue200,
                            ),
                          ),
                          tooMuchInfo: event.tags.length >= 3 && event.title.length > 24,
                          chips: event.tags.map((t) => Chip(text: t)).toList(),
                          onTap: () {
                            print("TODO: Go to Event detail page");
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