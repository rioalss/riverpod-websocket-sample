// features/feature_1/providers/coinbase_states.dart
import 'package:example_websocket/domain/entities/chat/message_entity.dart';
import 'package:example_websocket/features/coinbase/state/coinbase_status_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.data({
    required List<MessageEntity> data,
    @Default(ConnectionStatus.connected) ConnectionStatus status,
  }) = _Data;
  const factory ChatState.error({
    required String message,
    List<MessageEntity>? cachedData,
  }) = _Error;
}

