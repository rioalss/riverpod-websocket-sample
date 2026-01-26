import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:example_websocket/core/error/websocket_exceptions.dart';
import 'package:example_websocket/core/service/network/websocket_status.dart';
import 'channel_subscription.dart';

final centrifugeServiceProvider = Provider.family<CentrifugeService, String>(
  (ref, url) => CentrifugeService(url),
);

class CentrifugeService {
  CentrifugeService(this.url);

  final String url;

  centrifuge.Client? _client;

  final _statusController = StreamController<WebsocketStatus>.broadcast();

  final Map<String, centrifuge.Subscription> _subscriptions = {};

  WebsocketStatus _status = WebsocketStatus.disconnected;

  // ===== PUBLIC API =====

  Stream<WebsocketStatus> get statusStream => _statusController.stream;
  WebsocketStatus get status => _status;
  bool get isConnected => _status == WebsocketStatus.connected;

  // ===== CONNECTION =====

  Future<Either<WebsocketException, Unit>> connect() async {
    if (_status == WebsocketStatus.connected ||
        _status == WebsocketStatus.connecting) {
      return right(unit);
    }

    _updateStatus(WebsocketStatus.connecting);

    try {
      _client = centrifuge.createClient(
        url,
        centrifuge.ClientConfig(
          timeout: const Duration(seconds: 30),
        ),
      );

      _client!.connected.listen(
        (_) => _updateStatus(WebsocketStatus.connected),
      );

      _client!.connecting.listen(
        (_) => _updateStatus(WebsocketStatus.connecting),
      );

      _client!.disconnected.listen((event) {
        _updateStatus(WebsocketStatus.disconnected);
        _emitError(
          WebsocketConnectionClosedException(event.reason),
        );
      });

      _client!.error.listen((event) {
        _updateStatus(WebsocketStatus.error);
        _emitError(
          WebsocketReceiveException(
            event.error?.toString() ?? 'Unknown error',
          ),
        );
      });

      await _client!.connect();

      debugPrint('✅ Connected to $url');
      return right(unit);
    } catch (e) {
      final ex = WebsocketConnectionException(e.toString());
      _emitError(ex);
      return left(ex);
    }
  }

  // ===== SUBSCRIBE (SCALABLE CORE) =====

  Future<Either<WebsocketException, Stream<T>>> subscribe<T>(
    ChannelSubscription<T> config,
  ) async {
    if (!isConnected || _client == null) {
      return left(
        WebsocketNotConnectedException('Not connected'),
      );
    }

    try {
      final sub = _client!.getSubscription(config.channel) ??
          _client!.newSubscription(
            config.channel,
          );

      debugPrint('✅ Channel: ${sub.channel}');
      final controller = StreamController<T>.broadcast();

      sub.publication.listen(
        (event) {
          try {
            final json = jsonDecode(
              utf8.decode(event.data),
            ) as Map<String, dynamic>;
            controller.add(config.mapper(json));
            // print(controller.stream);
          } catch (e) {
            controller
                .addError(WebsocketMessageProcessingException(e.toString()));
          }
        },
        onError: controller.addError,
      );

      sub.subscribed.listen(
        (_) => debugPrint('✅ Subscribed: ${config.channel}'),
      );

      await sub.subscribe();
      _subscriptions[config.channel] = sub;

      return right(controller.stream);
    } catch (e) {
      return left(
        WebsocketSubscriptionException(e.toString()),
      );
    }
  }

  Future<Either<WebsocketException, Unit>> publish(
    String channel,
    Map<String, dynamic> payload,
  ) async {
    if (!isConnected || _client == null) {
      return left(
        WebsocketNotConnectedException('Not connected'),
      );
    }

    try {
      await _client!.publish(
        channel,
        utf8.encode(jsonEncode(payload)),
      );

      return right(unit);
    } catch (e) {
      return left(
        WebsocketSendException(e.toString()),
      );
    }
  }

  // ===== RPC (EXPLICIT, NOT GENERIC) =====

  Future<Either<WebsocketException, T>> rpc<T>(
    String method,
    Map<String, dynamic> payload,
    T Function(Map<String, dynamic>) mapper,
  ) async {
    if (!isConnected || _client == null) {
      return left(
        WebsocketNotConnectedException('Not connected'),
      );
    }

    try {
      final data = await _client!.rpc(method, utf8.encode(jsonEncode(payload)));

      final json = jsonDecode(utf8.decode(data.data)) as Map<String, dynamic>;

      return right(mapper(json));
    } catch (e) {
      return left(WebsocketSendException(e.toString()));
    }
  }

  // ===== UNSUBSCRIBE =====

  Future<void> unsubscribe(String channel) async {
    final sub = _subscriptions.remove(channel);
    await sub?.unsubscribe();
    debugPrint('🛑 Unsubscribed: $channel');
  }

  // ===== INTERNAL =====

  void _emitError(WebsocketException exception) {
    debugPrint('❌ WebSocket error: ${exception.message}');
  }

  void _updateStatus(WebsocketStatus newStatus) {
    if (_status != newStatus) {
      _status = newStatus;
      _statusController.add(newStatus);
      debugPrint('📶 Status: ${newStatus.name}');
    }
  }

  Future<void> dispose() async {
    for (final sub in _subscriptions.values) {
      await sub.unsubscribe();
    }
    _subscriptions.clear();

    await _client?.disconnect();
    await _statusController.close();

    _client = null;
    _updateStatus(WebsocketStatus.disconnected);
  }
}
