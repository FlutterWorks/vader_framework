import 'package:vader_app/vader_app.dart';

part 'venue.freezed.dart';

part 'venue.g.dart';

@freezed
class Venue with _$Address {
  const Venue._();

  const factory Venue({
    @Default("") String name,
    @Default("") String country,
    @Default("") String number,
    @Default("") @JsonKey(name: 'postal_code') String postalCode,
    @Default("") String street,
    @Default("") String town,
  }) = _Address;

  String format() => "$street\u00A0$number, $postalCode\u00A0$town";

  factory Venue.fromJson(Map<String, Object?> json) => _$AddressFromJson(json);
}