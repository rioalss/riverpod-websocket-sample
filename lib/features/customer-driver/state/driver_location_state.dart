// features/tracking/state/driver_location_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


part 'driver_location_state.freezed.dart';

@freezed
sealed class DriverLocationState with _$DriverLocationState {
  const factory DriverLocationState.idle() = _Idle;

  const factory DriverLocationState.listening() = _Listening;

  const factory DriverLocationState.tracking({
    required LatLng pickupLocation,
    required LatLng dropoffLocation,
    required LatLng driverLocation,
    required double progress,
    required DateTime lastUpdate,
  }) = _Tracking;

  const factory DriverLocationState.error({
    required String message,
  }) = _Error;
}


