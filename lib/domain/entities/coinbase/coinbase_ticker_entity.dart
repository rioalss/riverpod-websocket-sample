import 'package:equatable/equatable.dart';

class CoinbaseTickerEntity extends Equatable {
  final String? productId;
  final double? price;
  final double? volume24h;
  final double? bestBid;
  final double? bestAsk;
  final String? time;

  const CoinbaseTickerEntity({
    this.productId,
    this.price,
    this.volume24h,
    this.bestBid,
    this.bestAsk,
    this.time,
  });

  @override
  List<Object?> get props =>
      [productId, price, volume24h, bestBid, bestAsk, time];
}
