import 'package:vader_core/vader_core.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person extends VaderEntity with _$Person {
  const Person._();

  const factory Person({
    required String id,
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

