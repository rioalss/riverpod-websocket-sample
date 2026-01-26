import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/config/app_config.dart';
import 'package:example_websocket/core/service/network/centrifuge_service.dart';
import 'package:example_websocket/core/service/network/channel_subscription.dart';
import 'package:example_websocket/data/datasources/customer-driver/customer-driver_datasource.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerDriverDatasourceProvider =
    Provider<CustomerDriverDatasourceImpl>((ref) {
  final websocketService = ref
      .watch(centrifugeServiceProvider(AppConfig.baseUrlWebsocketCentrifuge));

  return CustomerDriverDatasourceImpl(
    ref: ref,
    websocketService: websocketService,
  );
});

class CustomerDriverDatasourceImpl implements CustomerDriverDatasource {
  final Ref ref;
  final CentrifugeService _websocketService;

  CustomerDriverDatasourceImpl({
    required this.ref,
    required CentrifugeService websocketService,
  }) : _websocketService = websocketService;

  @override
  Stream<Either<String, MessageModel>> subscribeChannel() async* {
    await _websocketService.connect();

    final result = await _websocketService.subscribe(
      ChannelSubscription<Map<String, dynamic>>(
        channel: 'chat:index',
        mapper: (json) => json,
      ),
    );

    yield* result.fold(
        (error) => Stream.value(Left(error.message)),
        (stream) => stream.map((json) {
              return Right(MessageModel.fromJson(json));
            }));
  }

  @override
  Future<Either<String, Unit>> sendPayload(Map<String, dynamic> payload) async {
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
