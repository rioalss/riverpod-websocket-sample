import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/data/repositories/customer_driver_repositories_impl.dart';
import 'package:example_websocket/domain/entities/customer-driver/location_update_entity.dart';
import 'package:example_websocket/domain/repositories/customer_driver_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getLocationChannelProvider = Provider<GetLocationChannelUsecase>((ref) {
  final repository = ref.watch(customerDriverRepositoriesProvider);
  return GetLocationChannelUsecase(repository);
});

// final locationChannelStreamProvider =
//     StreamProvider<Either<String, LocationUpdateEntity>>((ref) {
//   return ref.watch(getLocationChannelProvider)(NoParams());
// });

class GetLocationChannelUsecase
    implements UseCaseStream<LocationUpdateEntity, NoParams> {
  GetLocationChannelUsecase(this._repository);

  final CustomerDriverRepositories _repository;

  @override
  Stream<Either<String, LocationUpdateEntity>> call(NoParams params) {
    return _repository.subscribeChannel();
  }
}
