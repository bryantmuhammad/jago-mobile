import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  const Event({
    this.lowerPrice,
    required this.id,
    required this.name,
    required this.location,
    required this.link,
    required this.province,
    required this.image,
    required this.dateStart,
  });

  final int id;
  final String name;
  final String location;
  final String link; // Slug
  final String province;
  final String image;
  @JsonKey(name: 'date_start')
  final DateTime dateStart;

  @JsonKey(name: 'lower_price')
  final int? lowerPrice;

  factory Event.from(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
