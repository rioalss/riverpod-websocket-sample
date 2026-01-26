// data/mappers/message_mapper.dart
import 'dart:convert';
import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';

extension MessageMapper on MessageModel {
  MessageEntity toEntity() {
    final inputJson = jsonDecode(input ?? '{}');
    
    return MessageEntity(
      input: input,
      timestamp: timestamp,
      type: inputJson['type'],
      latitude: inputJson['latitude']?.toDouble(),
      longitude: inputJson['longitude']?.toDouble(),
      progress: inputJson['progress']?.toDouble(),
      tripId: inputJson['tripId'],
    );
  }
}
