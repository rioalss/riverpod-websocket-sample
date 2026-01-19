// import 'package:example_websocket/data/repositories/coinbase_repositories_impl.dart';
// import 'package:example_websocket/core/service/network/websocket_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final coinbaseWebsocketProvider = Provider.autoDispose<WebsocketService>(
//   (ref) {
//     ref.onDispose(() {
//       debugPrint('coinbaseWebsocketProvider dispose');
//     });
//     ref.onCancel(() {
//       debugPrint('coinbaseWebsocketProvider cancel');
//     });
//     ref.onResume(
//       () {
//         debugPrint('coinbaseWebsocketProvider resume');
//       },
//     );
//     ref.onAddListener(
//       () {
//         debugPrint('coinbaseWebsocketProvider addListener');
//       },
//     );
//     ref.onRemoveListener(
//       () {
//         debugPrint('coinbaseWebsocketProvider removeListener');
//       },
//     );
//     return WebsocketService();
//   },
// );

// final coinbaseStatusProvider = StreamProvider.autoDispose<Map<String, dynamic>>(
//   (ref) {
//     ref.onDispose(() {
//       debugPrint('coinbaseStatusProvider dispose');
//     });
//     ref.onCancel(() {
//       debugPrint('coinbaseStatusProvider cancel');
//     });
//     ref.onResume(
//       () {
//         debugPrint('coinbaseStatusProvider resume');
//       },
//     );
//     ref.onAddListener(
//       () {
//         debugPrint('coinbaseStatusProvider addListener');
//       },
//     );
//     ref.onRemoveListener(
//       () {
//         debugPrint('coinbaseStatusProvider removeListener');
//       },
//     );
//     final webSocketService = ref.watch(coinbaseWebsocketProvider);
//     final coinbaseStatusRepositories =
//         CoinbaseStatusRepositories(webSocketService);
//     return coinbaseStatusRepositories.stream;
//   },
// );
