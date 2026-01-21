import 'package:freezed_annotation/freezed_annotation.dart';

part 'coinbase_status_model.freezed.dart';
part 'coinbase_status_model.g.dart';

@freezed
abstract class CoinbaseStatusModel with _$CoinbaseStatusModel {
  const factory CoinbaseStatusModel({
    String? type,
    @Default([]) List<CoinbaseProductStatusModel>? products,
  }) = _CoinbaseStatusModel;

  factory CoinbaseStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseStatusModelFromJson(json);
}

@freezed
abstract class CoinbaseProductStatusModel with _$CoinbaseProductStatusModel {
  const factory CoinbaseProductStatusModel({
    String? id,
    String? status,
    @JsonKey(name: 'base_currency') String? baseCurrency,
    @JsonKey(name: 'quote_currency') String? quoteCurrency,
  }) = _CoinbaseProductStatusModel;

  factory CoinbaseProductStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseProductStatusModelFromJson(json);
}
