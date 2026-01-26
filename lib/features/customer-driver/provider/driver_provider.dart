// features/tracking/providers/driver_location_notifier.dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/core/utils/location_util.dart';
import 'package:example_websocket/domain/entities/customer-driver/location_update_entity.dart';
import 'package:example_websocket/domain/usecase/customer-driver/get_location_channel_usecase.dart';
import 'package:example_websocket/domain/usecase/customer-driver/get_payload_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/driver_location_state.dart';

final driverLocationNotifierProvider =
    StateNotifierProvider<DriverLocationNotifier, DriverLocationState>(
  (ref) => DriverLocationNotifier(ref),
);

class DriverLocationNotifier extends StateNotifier<DriverLocationState> {
  DriverLocationNotifier(this.ref) : super(const DriverLocationState.idle()) {
    debugPrint('[INIT] DriverLocationNotifier created');
  }

  final Ref ref;

  Timer? _timer;
  StreamSubscription? _subscription;
  StreamSubscription? _locationStreamSub;
  GoogleMapController? _mapController;
  bool _mapReady = false;

  LatLng? _pickup;
  LatLng? _dropoff;
  LatLng? _currentLocation;

  bool _isTracking = false;

  /* ==============================
   * PUBLIC API
   * ============================== */

  void trackingOrder() {
    debugPrint('[TRACKING_ORDER] called');
    debugPrint('[TRACKING_ORDER] isTracking=$_isTracking');

    if (_isTracking) {
      debugPrint('[TRACKING_ORDER] ignored (already tracking)');
      return;
    }

    _listenOrder();
  }

  /* ==============================
   * ORDER LISTENER
   * ============================== */

  void _listenOrder() {
    debugPrint('[WS] start listening order channel');

    _subscription?.cancel();

    final usecase = ref.read(getLocationChannelProvider);

    _subscription = usecase(NoParams()).listen(
      (event) {
        debugPrint('[WS] raw event received');

        event.fold(
          (err) {
            debugPrint('[WS][ERROR] $err');
            state = DriverLocationState.error(message: err);
          },
          (data) {
            debugPrint('[WS][DATA] $data');

            if (data.type == 'order') {
              debugPrint('[WS] ORDER received');
              _handleOrder(data);
            } else {
              debugPrint('[WS] ignored type=${data.type}');
            }
          },
        );
      },
      onError: (e, st) {
        debugPrint('[WS][STREAM ERROR] $e');
        debugPrint('$st');
      },
      onDone: () {
        debugPrint('[WS] stream closed');
      },
      cancelOnError: false,
    );
  }

  /* =========================
   * ORDER HANDLER
   * ========================= */

  void _handleOrder(LocationUpdateEntity data) {
    debugPrint('[ORDER] handling order');

    final pickup = LatLng(
      data.pickupLatitude!,
      data.pickupLongitude!,
    );

    final dropoff = LatLng(
      data.dropoffLatitude!,
      data.dropoffLongitude!,
    );

    debugPrint('[ORDER] pickup=$pickup');
    debugPrint('[ORDER] dropoff=$dropoff');

    _startTracking(pickup, dropoff);
  }

  /* =========================
   * TRACKING
   * ========================= */

  bool _isArrived(
    LatLng current,
    LatLng destination, {
    double thresholdMeter = 3,
  }) {
    final distance = LocationUtils.calculateDistance(
      current.latitude,
      current.longitude,
      destination.latitude,
      destination.longitude,
    );

    debugPrint(
      '[ARRIVAL CHECK] distance=${distance.toStringAsFixed(2)}m '
      'threshold=$thresholdMeter',
    );

    return distance <= thresholdMeter;
  }

  void _startTracking(LatLng pickup, LatLng dropoff) {
    debugPrint('[TRACKING] start with stream');

    if (_isTracking) return;

    _isTracking = true;
    _pickup = pickup;
    _dropoff = dropoff;

    _locationStreamSub?.cancel();

    _locationStreamSub = LocationUtils.streamMyPosition(
      accuracy: LocationAccuracy.best,
      distanceFilterMeter: 0,
    ).listen((event) {
      event.fold(
        (err) {
          debugPrint('[LOCATION STREAM ERROR] $err');
          state = DriverLocationState.error(message: err);
        },
        (data) {
          _currentLocation = LatLng(data.lat ?? 0, data.lng ?? 0);

          debugPrint('[LOCATION] current=$_currentLocation');

          state = DriverLocationState.tracking(
            pickupLocation: _pickup!,
            dropoffLocation: _dropoff!,
            driverLocation: _currentLocation!,
            progress: 0,
            lastUpdate: DateTime.now(),
          );

          // 🔥 REVISI: CEK ARRIVED SEBELUM PUBLISH
          if (_isArrived(_currentLocation!, _dropoff!)) {
            debugPrint('[TRACKING] arrived → stop');
            stopTracking();
            return;
          }

          _publish(_currentLocation!);

          if (_mapReady) {
            debugPrint('[MAP] follow driver');

            _mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _currentLocation!,
                  zoom: 18,
                ),
              ),
            );
          }
        },
      );
    });

    debugPrint('[TRACKING] location stream started');
  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
    _mapReady = true;
    debugPrint('[MAP] ready');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitPickupDropoff();
    });
  }

  void _fitPickupDropoff() {
    if (_mapController == null) return;

    final data = state.maybeWhen(
      tracking: (p, d, _, __, ___) => [p, d],
      orElse: () => null,
    );

    if (data == null) return;

    final bounds = LocationUtils.calculateBounds(data);

    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 80),
    );
  }

  void _tick(Timer timer) async {
    debugPrint('[TICK] fired');

    if (_pickup == null || _dropoff == null) {
      debugPrint('[TICK] pickup/dropoff null → skip');
      return;
    }

    final result = await LocationUtils.getCurrentLocationDetail();

    result.fold(
      (err) {
        debugPrint('[LOCATION][ERROR] $err');
        state = DriverLocationState.error(message: err);
      },
      (data) {
        _currentLocation = LatLng(data.lat ?? 0, data.lng ?? 0);

        debugPrint('[LOCATION] current=$_currentLocation');

        state = DriverLocationState.tracking(
          pickupLocation: _pickup!,
          dropoffLocation: _dropoff!,
          driverLocation: _currentLocation!,
          progress: 0,
          lastUpdate: DateTime.now(),
        );

        // 🔥 REVISI: CEK ARRIVED SEBELUM PUBLISH
        if (_isArrived(_currentLocation!, _dropoff!)) {
          debugPrint('[TRACKING] arrived → stop');
          stopTracking();
          return;
        }

        _publish(_currentLocation!);

        if (_mapReady) {
          debugPrint('[MAP] follow driver');

          _mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: _currentLocation!,
                zoom: 18,
              ),
            ),
          );
        }
      },
    );
  }

  /* ==============================
   * WEBSOCKET PUBLISH
   * ============================== */

  Future<void> _publish(LatLng pos) async {
    debugPrint('[PUBLISH] sending location $pos');

    final payload = {
      'input': jsonEncode({
        'type': 'location',
        'latitude': pos.latitude,
        'longitude': pos.longitude,
        'progress': 0,
      }),
      'timestamp': DateTime.now().millisecondsSinceEpoch ~/ 1000,
    };

    await ref.read(getPayloadUsecaseProvider)(payload);

    debugPrint('[PUBLISH] done');
  }

  /* ==============================
   * CLEANUP
   * ============================== */

  void stopTracking() {
    debugPrint('[STOP] tracking stopped');

    _timer?.cancel();
    _timer = null;
    _subscription?.cancel();
    _locationStreamSub?.cancel();
    _isTracking = false;
    _pickup = null;
    _dropoff = null;
    _currentLocation = null;
    _mapReady = false;
    _mapController = null;
  }

  @override
  void dispose() {
    debugPrint('[DISPOSE] DriverLocationNotifier');

    _timer?.cancel();
    _subscription?.cancel();
    _locationStreamSub?.cancel();
    super.dispose();
  }
}
