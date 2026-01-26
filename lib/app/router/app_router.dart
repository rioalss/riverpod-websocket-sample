import 'package:example_websocket/features/chat/screen/chat_screen.dart';
import 'package:example_websocket/features/coinbase/screen/coin_status_screen.dart';
import 'package:example_websocket/features/coinbase/screen/coin_ticker_screen.dart';
import 'package:example_websocket/features/customer-driver/screen/choose_role.dart';
import 'package:example_websocket/features/customer-driver/screen/driver_screen.dart';
import 'package:example_websocket/features/customer-driver/screen/map_screen.dart';
import 'package:example_websocket/features/customer-driver/screen/order_screen.dart';
import 'package:example_websocket/features/customer-driver/screen/user_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoute.chooseRole.path,
  routes: [
    GoRoute(
      path: AppRoute.chooseRole.path,
      name: AppRoute.chooseRole.name,
      builder: (context, state) => const ChooseRole(),
    ),
    GoRoute(
      path: AppRoute.order.path,
      name: AppRoute.order.name,
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
        path: AppRoute.map.path,
        name: AppRoute.map.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final initialPosition = extra?['initialPosition'] as LatLng?;
          return MapScreen(initialPosition: initialPosition);
        }),
    // GoRoute(
    //   path: AppRoute.tracking.path, // Konsisten dengan push
    //   name: AppRoute.tracking.name,
    //   builder: (context, state) {
    //     final extra = state.extra as Map<String, LatLng?>?;
    //     return TrackingScreen(
    //       pickupLocation: extra?['pickupLocation'],
    //       dropoffLocation: extra?['dropoffLocation'],
    //     );
    //   },
    // ),
    GoRoute(
      path: AppRoute.driverTracking.path,
      name: AppRoute.driverTracking.name,
      builder: (context, state) {
        return const DriverTrackingScreen();
      },
    ),
    GoRoute(
      path: AppRoute.userTracking.path,
      name: AppRoute.userTracking.name,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return UserTrackingScreen(
          pickupLocation: extra!['pickupLocation']!,
          dropoffLocation: extra['dropoffLocation']!,
        );
      },
    ),
    GoRoute(
      path: AppRoute.chat.path,
      name: AppRoute.chat.name,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: AppRoute.coinStatus.path,
      name: AppRoute.coinStatus.name,
      builder: (context, state) => const CoinStatusScreen(),
    ),
    GoRoute(
      path: AppRoute.coinTicker.path,
      name: AppRoute.coinTicker.name,
      builder: (context, state) {
        final productId = state.extra as Map<String, String>;
        final id = productId['id']!;
        return CoinTickerScreen(productId: id);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Page Not Found: ${state.error}')),
  ),
);
