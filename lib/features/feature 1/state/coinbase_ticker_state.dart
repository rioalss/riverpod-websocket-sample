// features/feature_1/providers/ticker_states.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/coinbase_ticker_entity.dart';

part 'coinbase_ticker_state.freezed.dart';

@freezed
sealed class CoinbaseTickerState with _$CoinbaseTickerState {
  const factory CoinbaseTickerState.initial(String productId) = _Initial;
  const factory CoinbaseTickerState.loading() = _Loading;
  const factory CoinbaseTickerState.data({
    required CoinbaseTickerEntity ticker,
    required DateTime lastUpdated,
  }) = _Data;
  const factory CoinbaseTickerState.error({
    required String message,
    CoinbaseTickerEntity? cachedTicker,
  }) = _Error;
}
