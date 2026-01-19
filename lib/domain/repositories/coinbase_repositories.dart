import 'package:dartz/dartz.dart';
import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';
import 'package:example_websocket/domain/entities/coinbase_ticker_entity.dart';

abstract class CoinbaseRepositories {
  Stream<Either<String, CoinbaseTickerEntity>> subscribeTicker(
      String productId);
  Stream<Either<String, CoinbaseStatusEntity>> subscribeStatus();
}
