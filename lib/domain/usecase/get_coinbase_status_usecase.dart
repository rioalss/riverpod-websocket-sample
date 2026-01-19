import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';
import 'package:example_websocket/domain/repositories/coinbase_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
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
