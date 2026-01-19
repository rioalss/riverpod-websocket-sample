import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/di/injection.dart';
import 'package:example_websocket/domain/entities/coinbase_ticker_entity.dart';
import 'package:example_websocket/domain/usecase/get_coinbase_ticker_usecase.dart';
import 'package:example_websocket/features/feature%201/state/coinbase_ticker_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final coinbaseTickerProvider = StateNotifierProvider.family<
    CoinbaseTickerNotifier, CoinbaseTickerState, String>((ref, productId) {
  return CoinbaseTickerNotifier(productId);
});

class CoinbaseTickerNotifier extends StateNotifier<CoinbaseTickerState> {
  StreamSubscription<Either<String, CoinbaseTickerEntity>>? _subscription;
  CoinbaseTickerEntity? _cachedTicker;
  final String productId;

  CoinbaseTickerNotifier(this.productId)
      : super(CoinbaseTickerState.initial(productId)) {
    _init();
  }

  void _init() {
    state = const CoinbaseTickerState.loading();
    final usecase = getIt<GetCoinbaseTickerUsecase>();

    _subscription?.cancel();
    _subscription = usecase(productId).listen((event) {
      return event.fold(
        _setError,
        _setData,
      );
    });
  }

  void _setData(CoinbaseTickerEntity entity) {
    _cachedTicker = entity;
    state = CoinbaseTickerState.data(
      ticker: entity,
      lastUpdated: DateTime.now(),
    );
  }

  void _setError(String message) {
    state = CoinbaseTickerState.error(
      message: message,
      cachedTicker: _cachedTicker,
    );
  }

  void refresh() => _init();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
