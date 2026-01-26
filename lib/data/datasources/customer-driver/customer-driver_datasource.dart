import 'package:dartz/dartz.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';

abstract class CustomerDriverDatasource {
  Stream<Either<String, MessageModel>> subscribeChannel();
  Future<Either<String, Unit>> sendPayload(Map<String, dynamic> payload);
}
