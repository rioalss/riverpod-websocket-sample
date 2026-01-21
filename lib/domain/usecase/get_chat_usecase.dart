import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/data/repositories/chat_repositories_impl.dart';
import 'package:example_websocket/domain/entities/chat/message_entity.dart';
import 'package:example_websocket/domain/repositories/chat_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getChatUsecaseProvider = Provider<GetChatUsecase>((ref) {
  final repository = ref.watch(chatRepositoriesProvider);
  return GetChatUsecase(repository);
});

class GetChatUsecase implements UseCaseStream<MessageEntity, NoParams> {
  GetChatUsecase(this._repository);

  final ChatRepositories _repository;

  @override
  Stream<Either<String, MessageEntity>> call(NoParams params) {
    return _repository.subscribeChat();
  }
}
