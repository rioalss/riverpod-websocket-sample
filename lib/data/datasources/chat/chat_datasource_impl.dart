// data/datasources/coinbase_websocket_datasource_impl.dart
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/config/app_config.dart';
import 'package:example_websocket/core/service/network/centrifuge_service.dart';
import 'package:example_websocket/core/service/network/channel_subscription.dart';
import 'package:example_websocket/data/datasources/chat/chat_datasource.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatDatasourceProvider = Provider<ChatDatasourceImpl>((ref) {
  final websocketService = ref
      .watch(centrifugeServiceProvider(AppConfig.baseUrlWebsocketCentrifuge));

  return ChatDatasourceImpl(
    ref: ref,
    websocketService: websocketService,
  );
});

class ChatDatasourceImpl implements ChatDatasource {
  final Ref ref;
  final CentrifugeService _websocketService;

  ChatDatasourceImpl({
    required this.ref,
    required CentrifugeService websocketService,
  }) : _websocketService = websocketService;

  @override
  Stream<Either<String, MessageModel>> subscribeChat() async* {
    await _websocketService.connect();

    final result = await _websocketService.subscribe(
      ChannelSubscription<Map<String, dynamic>>(
        channel: 'chat:index',
        mapper: (json) => json,
      ),
    );

    yield* result.fold(
      (error) => Stream.value(Left(error.message)),
      (stream) => stream.map((json) => Right(MessageModel.fromJson(json))),
    );
  }

  @override
  Future<Either<String, Unit>> publishChat(Map<String, dynamic> payload) async {
    final result = await _websocketService.publish(
      'chat:index',
      payload,
    );

    return result.fold(
      (error) => Left(error.message),
      (unit) => Right(unit),
    );
  }
}
