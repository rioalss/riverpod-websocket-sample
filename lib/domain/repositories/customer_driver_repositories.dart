import 'package:dartz/dartz.dart';
import 'package:example_websocket/domain/entities/customer-driver/location_update_entity.dart';

abstract class CustomerDriverRepositories {
  Stream<Either<String, LocationUpdateEntity>> subscribeChannel();
  Future<Either<String, Unit>> sendPayload(Map<String, dynamic> payload);
}


