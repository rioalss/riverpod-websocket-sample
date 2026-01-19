// // features/feature_1/providers/coinbase_providers.dart
// import 'dart:async';

// import 'package:example_websocket/core/usecase/usecase.dart';
// import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';
// import 'package:example_websocket/domain/entities/coinbase_ticker_entity.dart';
// import 'package:example_websocket/domain/usecase/get_coinbase_status_usecase.dart';
// import 'package:example_websocket/domain/usecase/get_coinbase_ticker_usecase.dart';
// import 'package:example_websocket/features/feature%201/state/coinbase_status_state.dart';
// import 'package:example_websocket/features/feature%201/state/coinbase_ticker_state.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:dartz/dartz.dart';
// import '../../../core/di/injection.dart';

// part 'coinbase_providers.g.dart';

// @riverpod
// class CoinbaseStatusNotifier extends _$CoinbaseStatusNotifier {
//   StreamSubscription<Either<String, CoinbaseStatusEntity>>? _subscription;
//   CoinbaseStatusEntity? _cachedProducts;

//   @override
//   CoinbaseStatusState build() {
//     ref.onDispose(_cleanup);
//     _init();
//     return const CoinbaseStatusState.initial();
//   }

//   void _init() async {
//     state = const CoinbaseStatusState.loading();
//     final usecase = getIt<GetCoinbaseStatusUsecase>();

//     _subscription?.cancel();
//     _subscription = usecase(NoParams()).listen((event) {
//       return event.fold(
//         (failure) => _setError(failure),
//         (entity) => _setData(entity),
//       );
//     });
//   }

//   void _setData(CoinbaseStatusEntity entity) {
//     _cachedProducts = entity;
//     state = CoinbaseStatusState.data(
//       data: entity,
//       lastUpdated: DateTime.now(),
//       status: ConnectionStatus.connected,
//     );
//   }

//   void _setError(String message) {
//     state = CoinbaseStatusState.error(
//       message: message,
//       cachedData: _cachedProducts,
//     );
//   }

//   Future<void> refresh() async {
//     _init();
//   }

//   void _cleanup() {
//     _subscription?.cancel();
//     _subscription = null;
//   }
// }

// @riverpod
// class CoinbaseTickerNotifier extends _$CoinbaseTickerNotifier {
//   StreamSubscription<Either<String, CoinbaseTickerEntity>>? _subscription;
//   CoinbaseTickerEntity? _cachedTicker;
//   String? _currentProductId;

//   @override
//   CoinbaseTickerState build(String productId) {
//     _currentProductId = productId;
//     ref.onDispose(_cleanup);
//     _init(productId);
//     return CoinbaseTickerState.initial(productId);
//   }

//   void _init(String productId) {
//     state = const CoinbaseTickerState.loading();
//     final usecase = getIt<GetCoinbaseTickerUsecase>();

//     _subscription?.cancel();
//     _subscription = usecase(productId).listen((event) {
//       return event.fold(
//         (failure) => _setError(productId, failure),
//         (entity) => _setData(entity),
//       );
//     });
//   }

//   void _setData(CoinbaseTickerEntity entity) {
//     _cachedTicker = entity;
//     state = CoinbaseTickerState.data(
//       ticker: entity,
//       lastUpdated: DateTime.now(),
//     );
//   }

//   void _setError(String productId, String message) {
//     state = CoinbaseTickerState.error(
//       message: message,
//       cachedTicker: _cachedTicker,
//     );
//   }

//   Future<void> refresh() async => _init(_currentProductId ?? '');

//   void _cleanup() {
//     _subscription?.cancel();
//     _subscription = null;
//   }
// }
