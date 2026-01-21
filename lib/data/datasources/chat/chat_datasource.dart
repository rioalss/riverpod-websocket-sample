import 'package:dartz/dartz.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';

abstract class ChatDatasource {
  Stream<Either<String, MessageModel>> subscribeChat();
  Future<Either<String, Unit>> publishChat(Map<String, dynamic> payload);
}
