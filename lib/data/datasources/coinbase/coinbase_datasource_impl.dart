// data/datasources/coinbase_websocket_datasource_impl.dart
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/config/app_config.dart';
import 'package:example_websocket/core/service/network/websocket_status.dart';
import 'package:example_websocket/data/datasources/coinbase/coinbase_datasource.dart';
import 'package:example_websocket/core/service/network/websocket_service.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_status_model.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_ticker_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinbaseDatasourceProvider =
    Provider<CoinbaseDatasourceImpl>((ref) {
  final websocketService =
      ref.watch(websocketServiceProvider(AppConfig.baseUrlWebsocketCoinbase));

  return CoinbaseDatasourceImpl(
    ref: ref,
    websocketService: websocketService,
  );
});

class CoinbaseDatasourceImpl implements CoinbaseDatasource {
  final Ref ref;
  final WebsocketService _websocketService;

  final Map<String, StreamController<Either<String, CoinbaseTickerModel>>>
      _tickerControllers = {};
  StreamController<Either<String, CoinbaseStatusModel>>? _statusController;

  StreamSubscription<Map<String, dynamic>>? _messageSubscription;
  StreamSubscription<WebsocketStatus>? _statusSubscription;

  CoinbaseDatasourceImpl({
    required this.ref,
    required WebsocketService websocketService,
  }) : _websocketService = websocketService {
    _initStreams();
    _listenToWebSocketMessages();
    _listenToStatusChanges();
  }

  void _initStreams() {
    _statusController =
        StreamController<Either<String, CoinbaseStatusModel>>.broadcast();
  }

  void _listenToWebSocketMessages() {
    _messageSubscription ??= _websocketService.messages.listen(
      _routeMessageToControllers,
      onError: (error) => _propagateErrorToAllControllers(error.toString()),
    );
  }

  void _listenToStatusChanges() {
    _statusSubscription ??= _websocketService.statusStream.listen((status) {
      if (status == WebsocketStatus.error ||
          status == WebsocketStatus.disconnected) {
        _propagateErrorToAllControllers('WebSocket ${status.name}');
      }
    });
  }

  void _routeMessageToControllers(Map<String, dynamic> message) {
    try {
      if (message['type'] == 'ticker') {
        final productId = message['product_id'] as String?;
        if (productId != null && _tickerControllers.containsKey(productId)) {
          final tickerModel = CoinbaseTickerModel.fromJson(message);
          _tickerControllers[productId]?.add(right(tickerModel));
        }
      }

      if (message['type'] == 'status') {
        final statusModel = CoinbaseStatusModel.fromJson(message);
        _statusController?.add(right(statusModel));
      }
    } catch (e) {
      _propagateErrorToAllControllers(
          'Message parsing failed: ${e.toString()}');
    }
  }

  void _propagateErrorToAllControllers(String error) {
    debugPrint('❌ Datasource Error: $error');

    _tickerControllers.values.forEach((controller) {
      controller.add(left(error));
    });
    _statusController?.add(left(error));
  }

  @override
  Stream<Either<String, CoinbaseTickerModel>> subscribeTicker(
      String productId) async* {
    await _ensureServiceConnected();

    final controller = _tickerControllers.putIfAbsent(
      productId,
      () => StreamController<Either<String, CoinbaseTickerModel>>.broadcast(),
    );

    final payload = {
      'type': 'subscribe',
      'product_ids': [productId],
      'channels': ['ticker'],
    };

    final sendResult = _websocketService.sendPayload(payload);
    sendResult.fold(
      (error) => controller.add(left(error.message)),
      (_) => debugPrint('✅ Status subscription sent'),
    );

    yield* controller.stream;
  }

  @override
  Stream<Either<String, CoinbaseStatusModel>> subscribeStatus() async* {
    await _ensureServiceConnected();

    // ✅ AUTO SUBSCRIBE - kirim payload SEKARANG
    final payload = {
      'type': 'subscribe',
      'channels': [
        {'name': 'status'}
      ],
    };

    debugPrint('🚀 Sending status subscribe payload: $payload');
    final sendResult = _websocketService.sendPayload(payload);
    sendResult.fold(
      (error) {
        debugPrint('❌ Subscribe failed: ${error.message}');
        _statusController?.add(left(error.message));
      },
      (_) => debugPrint('✅ Status subscription sent'),
    );

    yield* _statusController!.stream;
  }

  Future<void> _ensureServiceConnected() async {
    if (!_websocketService.isConnected) {
      await _websocketService.connect();
    }
  }
}