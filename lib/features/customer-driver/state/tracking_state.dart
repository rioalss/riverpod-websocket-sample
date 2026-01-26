import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'tracking_state.freezed.dart';

@freezed
sealed class TrackingState with _$TrackingState {
  const factory TrackingState.initial() = _Initial;

  const factory TrackingState.connecting({
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required Set<Marker> markers,
  }) = _Connecting;

  const factory TrackingState.tracking({
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required LatLng driverLocation,
    required double driverProgress,
    required Set<Marker> markers,
    required DateTime lastUpdate,
  }) = _Tracking;

  const factory TrackingState.error({
    required String message,
  }) = _Error;
}
