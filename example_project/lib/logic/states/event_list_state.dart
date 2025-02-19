import 'package:example_project/entities/event.dart';
import 'package:vader/vader.dart';

part 'event_list_state.freezed.dart';

@freezed
sealed class EventListState with _$EventListState {
  const EventListState._();

  const factory EventListState.init() = EventListStateInit;

  const factory EventListState.loading() = EventListStateLoading;

  const factory EventListState.failed(error) = EventListStateFailed;

  const factory EventListState.loaded(List<Event> event) = EventListStateLoaded;
}