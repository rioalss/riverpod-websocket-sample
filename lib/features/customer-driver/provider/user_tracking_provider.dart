import 'dart:async';
import 'dart:convert';

import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/core/utils/location_util.dart';
import 'package:example_websocket/domain/usecase/customer-driver/get_location_channel_usecase.dart';
import 'package:example_websocket/domain/usecase/customer-driver/get_payload_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/tracking_state.dart';

final userTrackingProvider =
    StateNotifierProvider<UserTrackingNotifier, TrackingState>(
  (ref) => UserTrackingNotifier(ref),
);

class UserTrackingNotifier extends StateNotifier<TrackingState> {
  UserTrackingNotifier(this.ref) : super(const TrackingState.initial());

  final Ref ref;

  GoogleMapController? _mapController;
  StreamSubscription? _subscription;
  Timer? _orderTimer;

  bool _followDriver = true;
  bool _waitingDriver = false;

  // =========================
  // INITIALIZE
  // =========================

  void initialize({
    required LatLng pickup,
    required LatLng dropoff,
  }) {
    if (state != const TrackingState.initial()) return;

    state = TrackingState.connecting(
      pickupLocation: pickup,
      dropoffLocation: dropoff,
      markers: _buildInitialMarkers(pickup, dropoff),
    );

    _listenDriverLocation();
    _startOrderLoop();
  }

  // =========================
  // MAP CONTROLLER
  // =========================

  void setMapController(GoogleMapController controller) {
    _mapController = controller;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitPickupDropoff();
    });
  }

  void clearMapController() {
    debugPrint('[MAP] controller cleared');
    _mapController = null;
  }

  void disableFollow() {
    _followDriver = false;
  }

  Future<void> _moveCameraToInitialTarget() async {
    final target = state.maybeWhen(
      connecting: (pickup, __, ___) => pickup,
      tracking: (_, __, driver, ___, ____, _____) => driver,
      orElse: () => null,
    );

    if (target != null && _mapController != null) {
      await _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(target, 15),
      );
    }
  }

  // =========================
  // DRIVER LOCATION STREAM
  // =========================

  void _fitPickupDropoff() {
    if (_mapController == null) return;

    final data = state.maybeWhen(
      connecting: (p, d, _) => [p, d],
      orElse: () => null,
    );

    if (data == null) return;

    final bounds = LocationUtils.calculateBounds(data);

    _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 80),
    );
  }

  void _listenDriverLocation() {
    _subscription?.cancel();

    _subscription =
        ref.read(getLocationChannelProvider)(NoParams()).listen((event) {
      event.fold(
        (err) {
          _subscription?.cancel();
          _orderTimer?.cancel();
          state = TrackingState.error(message: err);
          return;
        },
        (data) {
          if (data.type == 'location') {
            _orderTimer?.cancel();
            final pos = LatLng(data.latitude!, data.longitude!);
            _onDriverUpdate(pos, data.progress ?? 0);
          } else {
            _waitingDriver = false;
          }
        },
      );
    });
  }

  // =========================
  // DRIVER UPDATE
  // =========================

  void _onDriverUpdate(LatLng position, double progress) {
    state = state.when(
      initial: () => state,
      error: (_) => state,
      connecting: (pickup, dropoff, markers) {
        return TrackingState.tracking(
          pickupLocation: pickup,
          dropoffLocation: dropoff,
          driverLocation: position,
          driverProgress: progress,
          markers: _updateDriverMarker(markers, position),
          lastUpdate: DateTime.now(),
        );
      },
      tracking: (pickup, dropoff, _, __, markers, ___) {
        return TrackingState.tracking(
          pickupLocation: pickup,
          dropoffLocation: dropoff,
          driverLocation: position,
          driverProgress: progress,
          markers: _updateDriverMarker(markers, position),
          lastUpdate: DateTime.now(),
        );
      },
    );

    _followCamera(position);
  }

  Future<void> _followCamera(LatLng pos) async {
    final controller = _mapController;
    if (!_followDriver || controller == null) return;

    try {
      await controller.animateCamera(
        CameraUpdate.newLatLngZoom(pos, 16),
      );
    } catch (e) {
      debugPrint('[MAP] animate skipped (map disposed)');
      _mapController = null;
    }
  }

  // =========================
  // ORDER LOOP
  // =========================

  void _startOrderLoop() {
    _waitingDriver = true;

    _orderTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        final data = state.maybeWhen(
          connecting: (p, d, _) => [p, d],
          tracking: (p, d, ___, ____, _____, ______) => [p, d],
          orElse: () => null,
        );

        if (data != null) {
          _sendOrder(data[0], data[1]);
        }
      },
    );
  }

  Future<void> _sendOrder(LatLng pickup, LatLng dropoff) async {
    final payload = {
      'input': jsonEncode({
        'type': 'order',
        'pickupLatitude': pickup.latitude,
        'pickupLongitude': pickup.longitude,
        'dropoffLatitude': dropoff.latitude,
        'dropoffLongitude': dropoff.longitude,
      }),
      'timestamp': DateTime.now().millisecondsSinceEpoch ~/ 1000,
    };

    await ref.read(getPayloadUsecaseProvider)(payload);
  }

  // =========================
  // MARKERS
  // =========================

  Set<Marker> _buildInitialMarkers(LatLng pickup, LatLng dropoff) => {
        Marker(
          markerId: const MarkerId('pickup'),
          position: pickup,
          infoWindow: const InfoWindow(title: 'Pickup'),
        ),
        Marker(
          markerId: const MarkerId('dropoff'),
          position: dropoff,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: const InfoWindow(title: 'Destination'),
        ),
      };

  Set<Marker> _updateDriverMarker(Set<Marker> markers, LatLng pos) {
    final list = markers.toList()
      ..removeWhere((m) => m.markerId.value == 'driver');

    list.add(
      Marker(
        markerId: const MarkerId('driver'),
        position: pos,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
        zIndex: 10,
      ),
    );

    return list.toSet();
  }

  void stop() {
    debugPrint('[STOP] user tracking');
    _subscription?.cancel();
    _orderTimer?.cancel();
    _mapController = null;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _orderTimer?.cancel();
    super.dispose();
  }
}
