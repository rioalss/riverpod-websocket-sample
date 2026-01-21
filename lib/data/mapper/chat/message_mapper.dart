import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';

extension MessageMapper on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      input: input,
      timestamp: timestamp,
    );
  }
}
