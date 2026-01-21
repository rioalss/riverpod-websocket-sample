import 'package:freezed_annotation/freezed_annotation.dart';

part 'coinbase_ticker_model.freezed.dart';
part 'coinbase_ticker_model.g.dart';

@freezed
abstract class CoinbaseTickerModel with _$CoinbaseTickerModel {
  const factory CoinbaseTickerModel({
    String? type,
    @JsonKey(name: 'product_id') String? productId,
    String? price,
    @JsonKey(name: 'volume_24h') String? volume24h,
    @JsonKey(name: 'best_bid') String? bestBid,
    @JsonKey(name: 'best_ask') String? bestAsk,
    String? time,
  }) = _CoinbaseTickerModel;

  factory CoinbaseTickerModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseTickerModelFromJson(json);
}
