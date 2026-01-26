// // features/tracking/screens/tracking_screen.dart
// import 'package:example_websocket/features/customer-driver/provider/driver_provider.dart';
// import 'package:example_websocket/features/customer-driver/provider/user_tracking_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../shared/widgets/map_view.dart';
// import '../state/tracking_state.dart';
// import '../state/driver_location_state.dart';

// class TrackingScreen extends ConsumerStatefulWidget {
//   const TrackingScreen({super.key, this.pickupLocation, this.dropoffLocation});

//   final LatLng? pickupLocation;
//   final LatLng? dropoffLocation;

//   @override
//   ConsumerState<TrackingScreen> createState() => _TrackingScreenState();
// }

// class _TrackingScreenState extends ConsumerState<TrackingScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _pulseController;
//   late Animation<double> _pulseAnimation;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _pulseController = AnimationController(
//       duration: const Duration(seconds: 1, milliseconds: 500),
//       vsync: this,
//     );
//     _pulseAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
//       CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
//     );
//     _pulseController.repeat(reverse: true);
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_isInitialized && widget.pickupLocation != null && widget.dropoffLocation != null) {
//       _initializeTracking();
//       _isInitialized = true;
//     }
//   }

//   void _initializeTracking() {
//     // 👤 USER MODE - Listen only
//     final tripId = ref.read(driverLocationNotifierProvider).tripId;
//     ref.read(trackingProvider.notifier).initialize(
//       pickup: widget.pickupLocation!,
//       dropoff: widget.dropoffLocation!,
//       tripId: tripId,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final trackingState = ref.watch(trackingProvider);
//     final driverState = ref.watch(driverLocationNotifierProvider);

//     return Scaffold(
//       body: Column(
//         children: [
//           _buildHeader(driverState, trackingState),
//           Expanded(
//             child: MapView(
//               markers: trackingState.markers,
//               driverLocation: trackingState.driverLocation,
//               initialPosition: CameraPosition(
//                 target: widget.pickupLocation ?? const LatLng(-6.2088, 106.8456),
//                 zoom: 14,
//               ),
//               onMapCreated: (controller) => 
//                   ref.read(trackingProvider.notifier).setMapController(controller),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(DriverLocationState driverState, TrackingState trackingState) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 AnimatedBuilder(
//                   animation: _pulseAnimation,
//                   builder: (context, child) => Container(
//                     width: 12,
//                     height: 12,
//                     decoration: BoxDecoration(
//                       color: driverState.isTracking 
//                           ? Colors.green.shade600 
//                           : Colors.orange.shade600,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: (driverState.isTracking 
//                               ? Colors.green 
//                               : Colors.orange).withOpacity(0.5),
//                           blurRadius: 16 * _pulseAnimation.value,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         trackingState.status == TrackingStatus.tracking
//                             ? 'Driver sedang menuju'
//                             : trackingState.status.name.toUpperCase(),
//                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       if (trackingState.lastUpdate != null)
//                         Text(
//                           'Diperbarui ${_formatRelativeTime(trackingState.lastUpdate!)}',
//                           style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
//                         ),
//                       Text(
//                         'Trip ID: ${driverState.tripId}',
//                         style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     ref.read(driverLocationNotifierProvider.notifier).stopTracking();
//                     if (context.mounted) context.pop();
//                   },
//                   icon: const Icon(Icons.close),
//                   style: IconButton.styleFrom(
//                     backgroundColor: Colors.grey.shade100,
//                     padding: const EdgeInsets.all(12),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             if (driverState.isTracking && driverState.progress > 0.01)
//               _buildProgressBar(driverState),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressBar(DriverLocationState driverState) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade50,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           LinearProgressIndicator(
//             value: driverState.progress,
//             backgroundColor: Colors.grey.shade200,
//             valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
//             minHeight: 8,
//           ),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Ambil Penumpang',
//                 style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
//               ),
//               Text(
//                 '${(driverState.progress * 100).toStringAsFixed(0)}%',
//                 style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
//               ),
//               const Text(
//                 'Tujuan',
//                 style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatRelativeTime(DateTime time) {
//     final now = DateTime.now();
//     final diff = now.difference(time);
//     if (diff.inSeconds < 60) return 'Baru saja';
//     if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
//     return '${diff.inHours} jam lalu';
//   }

//   @override
//   void dispose() {
//     _pulseController.dispose();
//     super.dispose();
//   }
// }
