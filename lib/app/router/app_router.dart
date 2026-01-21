import 'package:example_websocket/features/chat/screen/chat_screen.dart';
import 'package:example_websocket/features/coinbase/screen/coin_status_screen.dart';
import 'package:example_websocket/features/coinbase/screen/coin_ticker_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoute.chat.path,
  routes: [
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
