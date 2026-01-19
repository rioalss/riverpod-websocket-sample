// domain/usecases/get_coinbase_ticker_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/domain/entities/coinbase_ticker_entity.dart';
import 'package:example_websocket/domain/repositories/coinbase_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCoinbaseTickerUsecase
    implements UseCaseStream<CoinbaseTickerEntity, String> {
  final CoinbaseRepositories _repository;

  GetCoinbaseTickerUsecase(this._repository);

  @override
  Stream<Either<String, CoinbaseTickerEntity>> call(String productId) {
    return _repository.subscribeTicker(productId);
  }
}
