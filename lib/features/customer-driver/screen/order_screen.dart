// features/maps/screens/order_screen.dart
import 'package:example_websocket/features/customer-driver/provider/user_tracking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../app/router/route_paths.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  LatLng? _pickupLocation;
  LatLng? _dropoffLocation;

  @override
  void dispose() {
    _pickupController.dispose();
    _dropoffController.dispose();
    super.dispose();
  }

  Future<void> _selectPickupLocation() async {
    final result = await context.push<LatLng?>(
      AppRoute.map.path,
      extra: {'initialPosition': _pickupLocation},
    );
    if (result != null && mounted) {
      setState(() {
        _pickupLocation = result;
        _pickupController.text =
            '${result.latitude.toStringAsFixed(6)}, ${result.longitude.toStringAsFixed(6)}';
      });
    }
  }

  Future<void> _selectDropoffLocation() async {
    final result = await context.push<LatLng?>(
      AppRoute.map.path,
      extra: {'initialPosition': _dropoffLocation},
    );
    if (result != null && mounted) {
      setState(() {
        _dropoffLocation = result;
        _dropoffController.text =
            '${result.latitude.toStringAsFixed(6)}, ${result.longitude.toStringAsFixed(6)}';
      });
    }
  }

  void _navigateToTracking() {
    if (_pickupLocation != null && _dropoffLocation != null) {
      ref.read(userTrackingProvider.notifier).initialize(
            pickup: _pickupLocation!,
            dropoff: _dropoffLocation!,
          );

      context.push(
        AppRoute.userTracking.path,
        extra: {
          'pickupLocation': _pickupLocation,
          'dropoffLocation': _dropoffLocation,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            _LocationField(
              controller: _pickupController,
              label: '📍 Pickup Location',
              location: _pickupLocation,
              onTap: _selectPickupLocation,
            ),
            const SizedBox(height: 16),
            _LocationField(
              controller: _dropoffController,
              label: '🏁 Dropoff Location',
              location: _dropoffLocation,
              onTap: _selectDropoffLocation,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _pickupLocation != null && _dropoffLocation != null
                  ? _navigateToTracking
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                '🚗 START TRACKING',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationField extends StatelessWidget {
  const _LocationField({
    required this.controller,
    required this.label,
    required this.location,
    required this.onTap,
  });

  final TextEditingController controller;
  final String label;
  final LatLng? location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        suffixIcon: location != null
            ? Icon(Icons.location_on, color: Colors.green.shade600)
            : Icon(Icons.add_location_alt_outlined,
                color: Colors.grey.shade400),
        suffixIconConstraints:
            const BoxConstraints(minWidth: 32, minHeight: 32),
      ),
    );
  }
}
