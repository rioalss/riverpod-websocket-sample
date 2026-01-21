import 'package:dartz/dartz.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_status_model.dart';
import 'package:example_websocket/data/models/coinbase/coinbase_ticker_model.dart';

abstract class CoinbaseDatasource {
  Stream<Either<String, CoinbaseTickerModel>> subscribeTicker(String productId);
  Stream<Either<String, CoinbaseStatusModel>> subscribeStatus();
}
