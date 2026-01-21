import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/utils/safe_call.dart';
import 'package:example_websocket/data/datasources/coinbase/coinbase_datasource.dart';
import 'package:example_websocket/data/datasources/coinbase/coinbase_datasource_impl.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_status_model.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_ticker_model.dart';
import 'package:example_websocket/data/mapper/coinbase/coinbase_status_mapper.dart';
import 'package:example_websocket/data/mapper/coinbase/coinbase_ticker_mapper.dart';
import 'package:example_websocket/domain/entities/coinbase/coinbase_status_entity.dart';
import 'package:example_websocket/domain/entities/coinbase/coinbase_ticker_entity.dart';
import 'package:example_websocket/domain/repositories/coinbase_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinbaseRepositoriesProvider = Provider<CoinbaseRepositoriesImpl>((ref) {
  final coinbaseDatasource = ref.watch(coinbaseDatasourceProvider);

  return CoinbaseRepositoriesImpl(
    coinbaseDatasource: coinbaseDatasource,
    ref: ref,
  );
});

class CoinbaseRepositoriesImpl implements CoinbaseRepositories {
  final CoinbaseDatasource coinbaseDatasource;
  final Ref ref;

  CoinbaseRepositoriesImpl({
    required this.coinbaseDatasource,
    required this.ref,
  });

  @override
  Stream<Either<String, CoinbaseStatusEntity>> subscribeStatus() {
    return safeCallStream<CoinbaseStatusEntity, CoinbaseStatusModel>(
      streamFactory: () => coinbaseDatasource.subscribeStatus(),
      mapper: (model) => model.toEntity(),
    );
  }

  @override
  Stream<Either<String, CoinbaseTickerEntity>> subscribeTicker(
      String productId) {
    return safeCallStream<CoinbaseTickerEntity, CoinbaseTickerModel>(
      streamFactory: () => coinbaseDatasource.subscribeTicker(productId),
      mapper: (model) => model.toEntity(),
    );
  }
}
