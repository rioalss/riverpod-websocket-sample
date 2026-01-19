// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinbase_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinbaseStatusModel _$CoinbaseStatusModelFromJson(Map<String, dynamic> json) =>
    _CoinbaseStatusModel(
      type: json['type'] as String?,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => CoinbaseProductStatusModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CoinbaseStatusModelToJson(
        _CoinbaseStatusModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'products': instance.products,
    };

_CoinbaseProductStatusModel _$CoinbaseProductStatusModelFromJson(
        Map<String, dynamic> json) =>
    _CoinbaseProductStatusModel(
      id: json['id'] as String?,
      status: json['status'] as String?,
      baseCurrency: json['base_currency'] as String?,
      quoteCurrency: json['quote_currency'] as String?,
    );

Map<String, dynamic> _$CoinbaseProductStatusModelToJson(
        _CoinbaseProductStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'base_currency': instance.baseCurrency,
      'quote_currency': instance.quoteCurrency,
    };
