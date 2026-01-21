import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/data/repositories/coinbase_repositories_impl.dart';
import 'package:example_websocket/domain/entities/coinbase/coinbase_status_entity.dart';
import 'package:example_websocket/domain/repositories/coinbase_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCoinbaseStatusUsecaseProvider =
    Provider<GetCoinbaseStatusUsecase>((ref) {
  final repository = ref.watch(coinbaseRepositoriesProvider);
  return GetCoinbaseStatusUsecase(repository);
});

class GetCoinbaseStatusUsecase
    implements UseCaseStream<CoinbaseStatusEntity, NoParams> {
  GetCoinbaseStatusUsecase(this._repository);

  final CoinbaseRepositories _repository;

  @override
  Stream<Either<String, CoinbaseStatusEntity>> call(
    NoParams params,
  ) {
    return _repository.subscribeStatus();
  }
}
