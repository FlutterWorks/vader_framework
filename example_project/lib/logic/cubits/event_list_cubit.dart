import 'package:example_project/entities/event.dart';
import 'package:example_project/logic/states/event_list_state.dart';
import 'package:example_project/repositories/event_repository.dart';
import 'package:vader/vader.dart';

class EventListCubit extends Cubit<EventListState> {
  EventListCubit({required this.eventRepository}) : super(EventListState.init()) {
    init();
  }

  late final EventRepository eventRepository;

  //update(EventListState state) {
  //  emit(state);
  //}

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
