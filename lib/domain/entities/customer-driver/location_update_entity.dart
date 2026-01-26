// domain/entities/message_entity.dart
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationUpdateEntity extends Equatable {
  final int? timestamp;
  final String? type;
  final double? latitude;
  final double? longitude;
  final double? progress;
  final double? pickupLatitude;
  final double? pickupLongitude;
  final double? dropoffLatitude;
  final double? dropoffLongitude;

  const LocationUpdateEntity({
    this.timestamp,
    this.type,
    this.latitude,
    this.longitude,
    this.progress,
    this.pickupLatitude,
    this.pickupLongitude,
    this.dropoffLatitude,
    this.dropoffLongitude,
  });

  @override
  List<Object?> get props => [
    
    timestamp,
    type,
    latitude,
    longitude,
    progress,
    pickupLatitude,
    pickupLongitude,
    dropoffLatitude,
    dropoffLongitude,
    
  ];

  /// Parse dari Centrifuge chat response
  factory LocationUpdateEntity.fromJson(Map<String, dynamic> json) {
    final inputJson = jsonDecode(json['input'] ?? '{}');
    
    return LocationUpdateEntity(
      timestamp: json['timestamp'],
      type: inputJson['type'],
      latitude: inputJson['latitude']?.toDouble(),
      longitude: inputJson['longitude']?.toDouble(),
      progress: inputJson['progress']?.toDouble(),
      pickupLatitude: inputJson['pickupLatitude']?.toDouble(),
      pickupLongitude: inputJson['pickupLongitude']?.toDouble(),
      dropoffLatitude: inputJson['dropoffLatitude']?.toDouble(),
      dropoffLongitude: inputJson['dropoffLongitude']?.toDouble(),
    );
  }

  /// Check apakah ini location message
  bool get isLocation => 
      type == 'location' && latitude != null && longitude != null;

  /// Get LatLng position jika location message
  LatLng? get locationPosition {
    if (!isLocation) return null;
    return LatLng(latitude!, longitude!);
  }

  @override
  String toString() {
    return 'LocationUpdateEntity(type: $type, timestamp: $timestamp, '
        'lat: $latitude, lng: $longitude, progress: $progress)';
  }
}
