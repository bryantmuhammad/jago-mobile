// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      lowerPrice: (json['lower_price'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      location: json['location'] as String,
      link: json['link'] as String,
      province: json['province'] as String,
      image: json['image'] as String,
      dateStart: DateTime.parse(json['date_start'] as String),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'link': instance.link,
      'province': instance.province,
      'image': instance.image,
      'date_start': instance.dateStart.toIso8601String(),
      'lower_price': instance.lowerPrice,
    };
