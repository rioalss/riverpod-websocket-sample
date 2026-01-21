import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/data/repositories/chat_repositories_impl.dart';
import 'package:example_websocket/domain/repositories/chat_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPublishChatUsecaseProvider = Provider<GetPublishChatUsecase>((ref) {
  final repository = ref.watch(chatRepositoriesProvider);
  return GetPublishChatUsecase(repository);
});

class GetPublishChatUsecase implements UseCase<Unit, Map<String, dynamic>> {
  GetPublishChatUsecase(this._repository);

  final ChatRepositories _repository;

  @override
  Future<Either<String, Unit>> call(Map<String, dynamic> params) {
    return _repository.publishChat(params);
  }
}
