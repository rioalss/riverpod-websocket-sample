import '../../models/coinbase/coinbase_ticker_model.dart';
import '../../../domain/entities/coinbase/coinbase_ticker_entity.dart';

extension CoinbaseTickerMapper on CoinbaseTickerModel {
  CoinbaseTickerEntity toEntity() {
    return CoinbaseTickerEntity(
      productId: productId,
      price: double.tryParse(price ?? '0') ?? 0.0,
      volume24h: double.tryParse(volume24h ?? '0') ?? 0.0,
      bestBid: double.tryParse(bestBid ?? '0') ?? 0.0,
      bestAsk: double.tryParse(bestAsk ?? '0') ?? 0.0,
      time: time,
    );
  }
}
