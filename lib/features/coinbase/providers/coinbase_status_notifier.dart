import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/domain/entities/coinbase/coinbase_status_entity.dart';
import 'package:example_websocket/domain/usecase/get_coinbase_status_usecase.dart';
import 'package:example_websocket/features/coinbase/state/coinbase_status_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final coinbaseStatusProvider =
    StateNotifierProvider<CoinbaseStatusNotifier, CoinbaseStatusState>(
  (ref) => CoinbaseStatusNotifier(ref),
);

class CoinbaseStatusNotifier extends StateNotifier<CoinbaseStatusState> {
  StreamSubscription<Either<String, CoinbaseStatusEntity>>? _subscription;
  CoinbaseStatusEntity? _cachedProducts;
  final Ref ref;

  CoinbaseStatusNotifier(this.ref)
      : super(const CoinbaseStatusState.initial()) {
    _init();
  }

  void _init() async {
    debugPrint('🔄 _init() called');
    state = const CoinbaseStatusState.loading();

    final usecase = ref.read(getCoinbaseStatusUsecaseProvider);
    debugPrint('✅ Usecase ready');

    _cleanup();

    debugPrint('📡 Creating stream...');
    final stream = usecase(NoParams());

    _subscription = stream.listen(
      (event) {
        debugPrint('📡 STREAM EVENT: $event');
        event.fold(_setError, _setData);
      },
      onError: (e) {
        debugPrint('❌ STREAM ERROR: $e');
        _setError('Stream error: $e');
      },
      onDone: () => debugPrint('⚠️ STREAM CLOSED'),
    );

    debugPrint('✅ Subscription active');
  }

  void _setData(CoinbaseStatusEntity entity) {
    _cachedProducts = entity;
    state = CoinbaseStatusState.data(
      data: entity,
      lastUpdated: DateTime.now(),
      status: ConnectionStatus.connected,
    );
  }

  void _setError(String message) {
    state = CoinbaseStatusState.error(
      message: message,
      cachedData: _cachedProducts,
    );
  }

  void refresh() => _init();

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }

  Future<void> _cleanup() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
