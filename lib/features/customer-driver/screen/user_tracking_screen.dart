import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/widgets/map_view.dart';
import '../provider/user_tracking_provider.dart';
import '../state/tracking_state.dart';

class UserTrackingScreen extends ConsumerStatefulWidget {
  final LatLng pickupLocation;
  final LatLng dropoffLocation;

  const UserTrackingScreen({
    super.key,
    required this.pickupLocation,
    required this.dropoffLocation,
  });

  @override
  ConsumerState<UserTrackingScreen> createState() => _UserTrackingScreenState();
}

class _UserTrackingScreenState extends ConsumerState<UserTrackingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userTrackingProvider.notifier).initialize(
            pickup: widget.pickupLocation,
            dropoff: widget.dropoffLocation,
          );
    });
  }

  // @override
  // void dispose() {
  //   ref.read(userTrackingProvider.notifier).stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userTrackingProvider);

    return Scaffold(
      body: state.when(
        initial: () => const Center(child: Text('Waiting...')),
        error: (msg) => Center(child: Text(msg)),
        connecting: (pickup, _, markers) => _buildMap(
          markers: markers,
          // driverLocation: pickup,
        ),
        tracking: (pickup, _, driver, __, markers, ___) =>
            _buildMap(markers: markers, driverLocation: driver),
      ),
    );
  }

  Widget _buildMap({
    required Set<Marker> markers,
    LatLng? driverLocation,
  }) {
    return MapView(
      markers: markers,
      showMyLocation: false,
      onMapCreated: (c) =>
          ref.read(userTrackingProvider.notifier).setMapController(c),
      driverLocation: driverLocation,
    );
  }
}
