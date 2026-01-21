// features/feature_1/providers/coinbase_states.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/coinbase/coinbase_status_entity.dart';

part 'coinbase_status_state.freezed.dart';

@freezed
sealed class CoinbaseStatusState with _$CoinbaseStatusState {
  const factory CoinbaseStatusState.initial() = _Initial;
  const factory CoinbaseStatusState.loading() = _Loading;
  const factory CoinbaseStatusState.data({
    required CoinbaseStatusEntity data,
    required DateTime lastUpdated,
    @Default(ConnectionStatus.connected) ConnectionStatus status,
  }) = _Data;
  const factory CoinbaseStatusState.error({
    required String message,
    CoinbaseStatusEntity? cachedData,
  }) = _Error;
}

enum ConnectionStatus { connecting, connected, disconnected, error }
