import 'package:example_app/features/events/logic/event_list_state.dart';
import 'package:example_app/features/events/event_repository.dart';
import 'package:vader_app/vader_app.dart';

class EventListCubit extends Cubit<EventListState> {
  EventListCubit({required this.eventRepository}) : super(EventListState.loading()) {
    init();
  }

  late final EventRepository eventRepository;

  init() => reload();

  Future<void> reload() async {
    try {
      emit(EventListState.loading());
      emit(EventListState.loaded(await eventRepository.getEvents()));
    } catch (e) {
      emit(EventListState.failed(e));
    }
  }
}
