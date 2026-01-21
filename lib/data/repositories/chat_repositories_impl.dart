import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/utils/safe_call.dart';
import 'package:example_websocket/data/datasources/chat/chat_datasource.dart';
import 'package:example_websocket/data/datasources/chat/chat_datasource_impl.dart';
import 'package:example_websocket/data/mapper/chat/message_mapper.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';
import 'package:example_websocket/domain/repositories/chat_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoriesProvider = Provider<ChatRepositoriesImpl>((ref) {
  final chatDatasource = ref.watch(chatDatasourceProvider);

  return ChatRepositoriesImpl(
    chatDatasource: chatDatasource,
    ref: ref,
  );
});

class ChatRepositoriesImpl implements ChatRepositories {
  final ChatDatasource chatDatasource;
  final Ref ref;

  ChatRepositoriesImpl({
    required this.chatDatasource,
    required this.ref,
  });

  @override
  Stream<Either<String, MessageEntity>> subscribeChat() {
    return safeCallStream<MessageEntity, MessageModel>(
      streamFactory: () => chatDatasource.subscribeChat(),
      mapper: (json) => json.toEntity(),
    );
  }

  @override
  Future<Either<String, Unit>> publishChat(Map<String, dynamic> payload) {
    return chatDatasource.publishChat(payload);
  }
}
