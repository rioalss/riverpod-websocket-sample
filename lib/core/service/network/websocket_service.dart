// core/service/network/websocket_service.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/error/websocket_exceptions.dart';
import 'package:example_websocket/core/service/network/websocket_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final websocketServiceProvider = Provider.family<WebsocketService, String>(
  (ref, url) {
    return WebsocketService(url);
  },
);


class WebsocketService {
  WebsocketService(this.url);
  final String url;

  WebSocketChannel? _channel;
  final _messageController = StreamController<Map<String, dynamic>>.broadcast();
  final _statusController = StreamController<WebsocketStatus>.broadcast();

  WebsocketStatus _status = WebsocketStatus.disconnected;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _initialReconnectDelay = Duration(seconds: 2);
  static const Duration _maxReconnectDelay = Duration(seconds: 30);

  Stream<Map<String, dynamic>> get messages => _messageController.stream;
  Stream<WebsocketStatus> get statusStream => _statusController.stream;
  WebsocketStatus get status => _status;
  bool get isConnected => _status == WebsocketStatus.connected;

  Future<Either<WebsocketException, Unit>> connect() async {
    if (_status == WebsocketStatus.connecting ||
        _status == WebsocketStatus.connected) {
      return right(unit);
    }

    _updateStatus(WebsocketStatus.connecting);

    try {
      _cancelReconnect();
      _channel?.sink.close();
      _channel = null;

      final uri = Uri.parse(url);
      _channel = WebSocketChannel.connect(uri);

      await _channel!.ready.timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw WebsocketTimeoutException('Connection timeout'),
      );

      _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: true,
      );

      _updateStatus(WebsocketStatus.connected);
      _reconnectAttempts = 0;
      debugPrint('✅ WebSocket connected to ${uri.toString()}');
      return right(unit);
    } on SocketException catch (e) {
      _handleConnectionFailure(
          WebsocketConnectionException('Network error: ${e.message}'));
      return left(WebsocketConnectionException('Network error: ${e.message}'));
    } on FormatException catch (e) {
      _handleConnectionFailure(
          WebsocketInvalidUrlException('Invalid URL format: ${e.message}'));
      return left(
          WebsocketInvalidUrlException('Invalid URL format: ${e.message}'));
    } catch (e) {
      _handleConnectionFailure(WebsocketConnectionException(e.toString()));
      return left(WebsocketConnectionException(e.toString()));
    }
  }

  Either<WebsocketException, Unit> sendPayload(Map<String, dynamic> payload) {
    if (!isConnected || _channel == null) {
      return left(WebsocketNotConnectedException('WebSocket not connected'));
    }

    try {
      final jsonString = jsonEncode(payload);
      if (jsonString.length > 16 * 1024) {
        return left(WebsocketPayloadTooLargeException(
            'Payload too large: ${jsonString.length} bytes'));
      }

      _channel!.sink.add(jsonString);
      debugPrint('📤 Sent: ${payload['type']}');
      return right(unit);
    } on ArgumentError catch (e) {
      return left(WebsocketSerializationException(
          'JSON serialization failed: ${e.message}'));
    } catch (e) {
      return left(WebsocketSendException('Failed to send payload: $e'));
    }
  }

  void _onMessage(dynamic raw) {
    try {
      if (raw is! String) {
        _messageController.addError(WebsocketInvalidMessageException(
            'Expected String, got ${raw.runtimeType}'));
        return;
      }

      final data = jsonDecode(raw) as Map<String, dynamic>;
      _messageController.add(data);
    } on FormatException catch (e) {
      _messageController
          .addError(WebsocketInvalidMessageException('JSON parse error: $e'));
    } catch (e) {
      _messageController.addError(
          WebsocketMessageProcessingException('Message processing failed: $e'));
    }
  }

  void _onError(Object error) {
    _updateStatus(WebsocketStatus.error);
    _messageController
        .addError(WebsocketReceiveException('Receive error: $error'));
    _handleConnectionFailure(WebsocketReceiveException(error.toString()));
  }

  void _onDone() {
    _updateStatus(WebsocketStatus.disconnected);
    _handleConnectionFailure(
        WebsocketConnectionClosedException('Connection closed by server'));
  }

  void _handleConnectionFailure(WebsocketException exception) {
    debugPrint('❌ WebSocket error: ${exception.message}');
    _updateStatus(WebsocketStatus.disconnected);

    if (_reconnectAttempts < _maxReconnectAttempts) {
      _scheduleReconnect();
    } else {
      debugPrint('❌ Max reconnect attempts reached. Giving up.');
      _messageController.addError(exception);
    }
  }

  void _scheduleReconnect() {
    final delay = Duration(
      seconds: (_initialReconnectDelay.inSeconds * (1 << _reconnectAttempts))
          .clamp(1, _maxReconnectDelay.inSeconds),
    );

    debugPrint(
        '🔄 Reconnecting in ${delay.inSeconds}s (attempt ${_reconnectAttempts + 1}/$_maxReconnectAttempts)');
    _reconnectTimer = Timer(delay, () async {
      _reconnectAttempts++;
      await connect();
    });
  }

  void _updateStatus(WebsocketStatus newStatus) {
    if (_status != newStatus) {
      _status = newStatus;
      _statusController.add(newStatus);
      debugPrint('📶 Status: ${newStatus.name}');
    }
  }

  void _cancelReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  Future<void> dispose() async {
    _cancelReconnect();
    _updateStatus(WebsocketStatus.disconnected);

    if (_channel != null) {
      try {
        await _channel!.sink.close();
      } catch (e) {
        debugPrint('⚠️ Error closing channel: $e');
      }
      _channel = null;
    }

    await _messageController.close();
    await _statusController.close();
  }
}