import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/utils/safe_call.dart';
import 'package:example_websocket/data/datasources/customer-driver/customer-driver_datasource.dart';
import 'package:example_websocket/data/datasources/customer-driver/customer-driver_datasource_impl.dart';
import 'package:example_websocket/data/mapper/customer-driver/location_update_mapper.dart';
import 'package:example_websocket/data/models/chat/message_model.dart';
import 'package:example_websocket/domain/entities/customer-driver/location_update_entity.dart';
import 'package:example_websocket/domain/repositories/customer_driver_repositories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerDriverRepositoriesProvider =
    Provider<CustomerDriverRepositoriesImpl>((ref) {
  final customerDriverDatasource = ref.watch(customerDriverDatasourceProvider);

  return CustomerDriverRepositoriesImpl(
    customerDriverDatasource: customerDriverDatasource,
    ref: ref,
  );
});

class CustomerDriverRepositoriesImpl implements CustomerDriverRepositories {
  final CustomerDriverDatasource customerDriverDatasource;
  final Ref ref;

  CustomerDriverRepositoriesImpl({
    required this.customerDriverDatasource,
    required this.ref,
  });

  @override
  Stream<Either<String, LocationUpdateEntity>> subscribeChannel() {
    return safeCallStream<LocationUpdateEntity, MessageModel>(
      streamFactory: () => customerDriverDatasource.subscribeChannel(),
      mapper: (json) {
        debugPrint('📡 Repository: Mapping to entity: $json');
        return json.toLocationUpdateEntity();
      },
      filter: (model) {
        debugPrint('📡 Repository: Filtering model: $model');
        debugPrint(
            '📡 Repository: Filtering model valid location update: ${model.isLocationUpdate}');
        debugPrint(
            '📡 Repository: Filtering model valid order update: ${model.isOrderUpdate}');
        return model.isLocationUpdate || model.isOrderUpdate;
      },
    );
  }

  @override
  Future<Either<String, Unit>> sendPayload(Map<String, dynamic> payload) {
    return customerDriverDatasource.sendPayload(payload);
  }
}
