// // features/tracking/providers/location_tracking_provider.dart
// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../state/tracking_state.dart';

// enum TrackingRole { driver, user }

// class TrackingParams {
//   final LatLng pickup;
//   final LatLng dropoff;
//   final TrackingRole role;
//   const TrackingParams({
//     required this.pickup,
//     required this.dropoff,
//     required this.role,
//   });
// }

// final locationTrackingProvider = StateNotifierProvider.autoDispose
//     .family<LocationTrackingNotifier, TrackingState, TrackingParams>(
//   (ref, params) => LocationTrackingNotifier(ref, params),
// );

// class LocationTrackingNotifier extends StateNotifier<TrackingState> {
//   final Ref ref;
//   final TrackingParams params;
//   GoogleMapController? _mapController;
//   Timer? _publishTimer;
//   LatLng? _currentDriverPos;
//   double _simulatedProgress = 0.0;
//   final Random _random = Random();

//   LocationTrackingNotifier(this.ref, this.params)
//       : super(const TrackingState(status: TrackingStatus.connecting));

//   void initialize() {
//     final markers = _buildInitialMarkers(params.pickup, params.dropoff);
//     state = state.copyWith(
//       pickupLocation: params.pickup,
//       dropoffLocation: params.dropoff,
//       markers: markers,
//       status: TrackingStatus.connecting,
//     );

//     // 🔥 Listen to websocket stream via usecase (implement in domain)
//     _listenToLocationStream();

//     if (params.role == TrackingRole.driver) {
//       _startDriverPublishing();
//     }
//   }

//   void _listenToLocationStream() {
//     // ref.watch(subscribeLocationStreamProvider).whenData((stream) {
//     //   stream.listen((location) => _updateFromStream(location));
//     // });
//     // TODO: Connect to your cleaned datasource stream filtering type: 'location'
//     // For demo, simulate stream updates
//     Timer.periodic(const Duration(seconds: 2), (timer) {
//       if (params.role == TrackingRole.user) {
//         _simulateIncomingLocation();
//       }
//     });
//   }

//   void _startDriverPublishing() {
//     _publishTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
//       _simulatedProgress = (_simulatedProgress + 0.05).clamp(0.0, 1.0);
//       _currentDriverPos = _interpolate(params.pickup, params.dropoff, _simulatedProgress);
      
//       _updateLocalState(_currentDriverPos!, _simulatedProgress);
      
//       await _publishLocation(_currentDriverPos!, _simulatedProgress);
      
//       if (_simulatedProgress >= 1.0) {
//         _stopPublishing();
//         state = state.copyWith(status: TrackingStatus.completed);
//       }
//     });
//   }

//   Future<void> _publishLocation(LatLng pos, double progress) async {
//     final payload = {
//       'type': 'location',
//       'latitude': pos.latitude,
//       'longitude': pos.longitude,
//       'progress': progress,
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     // await ref.read(getPayloadUsecaseProvider)(payload);
//     debugPrint('📤 Published: $payload');
//   }

//   void _simulateIncomingLocation() {
//     // Simulate receiving from websocket
//     final progress = (_simulatedProgress + 0.03).clamp(0.0, 1.0);
//     final pos = _interpolate(params.pickup, params.dropoff, progress);
//     _updateLocalState(pos, progress);
//   }

//   void _updateLocalState(LatLng pos, double progress) {
//     final markers = _updateDriverMarker(state.markers, pos, progress);
//     state = state.copyWith(
//       driverLocation: pos,
//       driverProgress: progress,
//       markers: markers,
//       status: TrackingStatus.tracking,
//       lastUpdate: DateTime.now(),
//     );
//     _animateToDriver();
//   }

//   // Existing helpers: _buildInitialMarkers, _updateDriverMarker, _animateToDriver, _interpolate...
//   LatLng _interpolate(LatLng start, LatLng end, double t) {
//     return LatLng(
//       start.latitude + (end.latitude - start.latitude) * t,
//       start.longitude + (end.longitude - start.longitude) * t,
//     );
//   }

//   void setMapController(GoogleMapController controller) => _mapController = controller;

//   void _stopPublishing() => _publishTimer?.cancel();

//   @override
//   void dispose() {
//     _stopPublishing();
//     super.dispose();
//   }
// }
