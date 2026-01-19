import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/utils/safe_call.dart';
import 'package:example_websocket/data/datasources/coinbase_datasource.dart';
import 'package:example_websocket/data/models/coinbase_status_model.dart';
import 'package:example_websocket/data/models/coinbase_ticker_model.dart';
import 'package:example_websocket/data/mapper/coinbase_status_mapper.dart';
import 'package:example_websocket/data/mapper/coinbase_ticker_mapper.dart';
import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';
import 'package:example_websocket/domain/entities/coinbase_ticker_entity.dart';
import 'package:example_websocket/domain/repositories/coinbase_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoinbaseRepositories)
class CoinbaseRepositoriesImpl implements CoinbaseRepositories {
  final CoinbaseDatasource _coinbaseDatasource;

  CoinbaseRepositoriesImpl(this._coinbaseDatasource);

  @override
  Stream<Either<String, CoinbaseStatusEntity>> subscribeStatus() {
    return safeCallStream<CoinbaseStatusEntity, CoinbaseStatusModel>(
      streamFactory: () => _coinbaseDatasource.subscribeStatus(),
      mapper: (model) => model.toEntity(),
    );
  }

  @override
  Stream<Either<String, CoinbaseTickerEntity>> subscribeTicker(
      String productId) {
    return safeCallStream<CoinbaseTickerEntity, CoinbaseTickerModel>(
      streamFactory: () => _coinbaseDatasource.subscribeTicker(productId),
      mapper: (model) => model.toEntity(),
    );
  }
}
