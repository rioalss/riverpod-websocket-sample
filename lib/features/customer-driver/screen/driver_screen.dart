// features/tracking/screens/driver_tracking_screen.dart
import 'package:example_websocket/features/customer-driver/provider/driver_provider.dart';
import 'package:example_websocket/shared/gen/assets.gen.dart';
import 'package:example_websocket/shared/widgets/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../state/driver_location_state.dart';

class DriverTrackingScreen extends ConsumerStatefulWidget {
  const DriverTrackingScreen({
    super.key,
  });

  @override
  ConsumerState<DriverTrackingScreen> createState() =>
      _DriverTrackingScreenState();
}

class _DriverTrackingScreenState extends ConsumerState<DriverTrackingScreen> {
  BitmapDescriptor? _driverIcon;

  @override
  void initState() {
    _loadDriverIcon();
    super.initState();
  }

  void _loadDriverIcon() {
    if (_driverIcon != null) {
      return;
    }
    try {
      BitmapDescriptor.asset(
        const ImageConfiguration(
          size: Size(48, 48),
          devicePixelRatio: 2,
        ),
        Assets.icons.driverMarker.path,
      ).then(
        (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _driverIcon = value;
            });
          });
        },
      );
    } catch (e) {
      debugPrint('❌ Driver icon load failed: $e');
      // Fallback ke default - no setState
    }
  }

  @override
  Widget build(BuildContext context) {
    final driverState = ref.watch(driverLocationNotifierProvider);

    return Scaffold(
      body: driverState.maybeWhen(
          orElse: () {},
          idle: () => const Center(
                child: Text('Please wait...'),
              ),
          listening: () => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (error) => Center(
                child: Text(error.toString()),
              ),
          tracking: (pickupLocation, dropoffLocation, driverLocation, progress,
              lastUpdate) {
            return Column(
              children: [
                // _buildDriverHeader(driverState),
                Expanded(
                  child: MapView(
                    markers: {
                      Marker(
                        markerId: const MarkerId('pickup'),
                        position: pickupLocation,
                      ),
                      Marker(
                        markerId: const MarkerId('dropoff'),
                        position: dropoffLocation,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen,
                        ),
                      ),
                      if (_driverIcon != null)
                        Marker(
                          markerId: const MarkerId('driver'),
                          position: driverLocation,
                          icon: _driverIcon!,
                          anchor: const Offset(0.5, 0.5),
                          infoWindow: const InfoWindow(title: 'Driver'),
                        ),
                    },
                    driverLocation: driverLocation,
                    driverIcon: _driverIcon,
                    showMyLocation: false,
                    onMapCreated: (c) => ref
                        .read(driverLocationNotifierProvider.notifier)
                        .setMapController(c),
                    // polygons: {
                    //   Polygon(
                    //     polygonId: const PolygonId('route'),
                    //     points: [
                    //       pickupLocation,
                    //       dropoffLocation,
                    //     ],
                    //     fillColor: Colors.blue.withOpacity(0.2),
                    //     strokeColor: Colors.blue,
                    //     strokeWidth: 2,
                    //   ),
                    // },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _buildDriverHeader(DriverLocationState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        children: [
          const Text(
            'DRIVER MODE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          state.maybeWhen(
            orElse: () => const SizedBox(),
            tracking: (pickupLocation, dropoffLocation, driverLocation,
                    progress, lastUpdate) =>
                Column(
              children: [
                Text('Progress: ${(progress * 100).toStringAsFixed(1)}%'),
                Text('Last Update: $lastUpdate'),
              ],
            ),
          ),
          state.maybeWhen(
            orElse: () => const SizedBox(),
            error: (error) => Text('Error: $error',
                style: const TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () => ref
                .read(driverLocationNotifierProvider.notifier)
                .stopTracking(),
            child: const Text('STOP TRACKING'),
          ),
        ],
      ),
    );
  }
}
