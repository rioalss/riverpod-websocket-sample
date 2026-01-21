import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';
import 'package:example_websocket/domain/usecase/get_chat_usecase.dart';
import 'package:example_websocket/domain/usecase/get_publish_chat_usecase.dart';
import 'package:example_websocket/features/chat/state/chat_state.dart';
import 'package:example_websocket/features/coinbase/state/coinbase_status_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final chatStatusProvider = StateNotifierProvider<ChatStatusNotifier, ChatState>(
  (ref) => ChatStatusNotifier(ref),
);

class ChatStatusNotifier extends StateNotifier<ChatState> {
  StreamSubscription<Either<String, MessageEntity>>? _subscription;
  final List<MessageEntity> _messages = [];
  final Ref ref;

  ChatStatusNotifier(this.ref) : super(const ChatState.initial()) {
    _init();
  }

  void _init() async {
    debugPrint('🔄 _init() called');
    state = const ChatState.loading();

    final usecase = ref.read(getChatUsecaseProvider);
    debugPrint('✅ Usecase ready');

    // _cleanup();

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

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final payload = {
      "input": text,
      "timestamp": DateTime.now().millisecondsSinceEpoch ~/ 1000,
    };

    final usecase = ref.read(getPublishChatUsecaseProvider);

    final result = await usecase(payload);

    result.fold(
      (error) {
        // ⚠️ publish error TIDAK mematikan stream
        state = ChatState.error(
          message: error,
          cachedData: state.maybeWhen(
            data: (data, _) => List.unmodifiable(_messages),
            orElse: () => null,
          ),
        );
      },
      (_) {
        // ✅ sukses publish → tidak perlu ubah state
        // karena message akan datang via stream
      },
    );
  }

  void _setData(MessageEntity data) {
    _messages.add(data);
    state = ChatState.data(
      data: List.unmodifiable(_messages),
      status: ConnectionStatus.connected,
    );
  }

  void _setError(String message) {
    state = ChatState.error(
      message: message,
      cachedData: List.unmodifiable(_messages),
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
