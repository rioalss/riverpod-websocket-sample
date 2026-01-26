// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_utils_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationUtilsModel _$LocationUtilsModelFromJson(Map<String, dynamic> json) =>
    _LocationUtilsModel(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationUtilsModelToJson(_LocationUtilsModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'timestamp': instance.timestamp,
      'address': instance.address,
    };
