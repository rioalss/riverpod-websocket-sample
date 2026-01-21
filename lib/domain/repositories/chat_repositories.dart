import 'package:dartz/dartz.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';

abstract class ChatRepositories {
  Stream<Either<String, MessageEntity>> subscribeChat();
  Future<Either<String, Unit>> publishChat(Map<String, dynamic> payload);
}


