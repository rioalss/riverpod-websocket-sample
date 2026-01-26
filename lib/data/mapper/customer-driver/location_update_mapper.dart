import 'dart:convert';

import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:example_websocket/domain/entities/customer-driver/location_update_entity.dart';

extension LocationUpdateMapper on MessageModel {
  LocationUpdateEntity toLocationUpdateEntity() {
    // 🔒 contract: HARUS valid
    final decoded = jsonDecode(input!) as Map<String, dynamic>;

    return LocationUpdateEntity(
      timestamp: timestamp,
      type: decoded['type'],
      latitude: _parseDouble(decoded['latitude']),
      longitude: _parseDouble(decoded['longitude']),
      progress: _parseDouble(decoded['progress']),
      pickupLatitude: _parseDouble(decoded['pickupLatitude']),
      pickupLongitude: _parseDouble(decoded['pickupLongitude']),
      dropoffLatitude: _parseDouble(decoded['dropoffLatitude']),
      dropoffLongitude: _parseDouble(decoded['dropoffLongitude']),
    );
  }

  double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  Map<String, dynamic>? get decodedJson {
    final raw = input;
    if (raw == null || raw.isEmpty) return null;
    if (!raw.trimLeft().startsWith('{')) return null;

    try {
      final json = jsonDecode(raw);
      return json is Map<String, dynamic> ? json : null;
    } catch (_) {
      return null;
    }
  }

  bool isType(String type) {
    final json = decodedJson;
    return json != null && json['type'] == type;
  }

  bool get isLocationUpdate => isType('location');
  bool get isOrderUpdate => isType('order');
}
