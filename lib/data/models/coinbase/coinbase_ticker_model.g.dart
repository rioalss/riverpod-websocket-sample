// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinbaseTickerModel _$CoinbaseTickerModelFromJson(Map<String, dynamic> json) =>
    _CoinbaseTickerModel(
      type: json['type'] as String?,
      productId: json['product_id'] as String?,
      price: json['price'] as String?,
      volume24h: json['volume_24h'] as String?,
      bestBid: json['best_bid'] as String?,
      bestAsk: json['best_ask'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CoinbaseTickerModelToJson(
        _CoinbaseTickerModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'product_id': instance.productId,
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'best_bid': instance.bestBid,
      'best_ask': instance.bestAsk,
      'time': instance.time,
    };
