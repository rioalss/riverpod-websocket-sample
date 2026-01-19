import 'package:example_websocket/data/models/coinbase_status_model.dart';
import 'package:example_websocket/domain/entities/coinbase_status_entity.dart';

extension CoinbaseStatusMapper on CoinbaseStatusModel {
  CoinbaseStatusEntity toEntity() {
    return CoinbaseStatusEntity(
      type: type ?? '',
      products: products?.map((p) {
            return CoinbaseProductStatusEntity(
              productId: p.id ?? '',
              status: p.status ?? '',
              baseCurrency: p.baseCurrency ?? '',
              quoteCurrency: p.quoteCurrency ?? '',
            );
          }).toList() ??
          [],
    );
  }
}
