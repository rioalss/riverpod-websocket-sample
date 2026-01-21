import 'package:equatable/equatable.dart';

class CoinbaseProductStatusEntity extends Equatable {
  final String productId;
  final String status;
  final String baseCurrency;
  final String quoteCurrency;

  const CoinbaseProductStatusEntity({
    required this.productId,
    required this.status,
    required this.baseCurrency,
    required this.quoteCurrency,
  });

  @override
  List<Object?> get props => [
        productId,
        status,
        baseCurrency,
        quoteCurrency,
      ];
}

class CoinbaseStatusEntity extends Equatable {
  final String type;
  final List<CoinbaseProductStatusEntity> products;

  const CoinbaseStatusEntity({
    required this.type,
    required this.products,
  });

  @override
  List<Object?> get props => [type, products];
}
