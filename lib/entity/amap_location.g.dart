// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmapLocation _$AmapLocationFromJson(Map<String, dynamic> json) {
  return AmapLocation()
    ..regeocode = json['regeocode'] == null
        ? null
        : RegeoCode.fromJson(json['regeocode'] as Map<String, dynamic>)
    ..info = json['info'] as String
    ..infocode = json['infocode'] as String;
}

Map<String, dynamic> _$AmapLocationToJson(AmapLocation instance) =>
    <String, dynamic>{
      'regeocode': instance.regeocode,
      'info': instance.info,
      'infocode': instance.infocode,
    };
