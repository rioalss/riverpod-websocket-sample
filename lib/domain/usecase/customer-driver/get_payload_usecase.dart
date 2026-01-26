import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/usecase/usecase.dart';
import 'package:example_websocket/data/repositories/customer_driver_repositories_impl.dart';
import 'package:example_websocket/domain/repositories/customer_driver_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPayloadUsecaseProvider = Provider<GetPayloadUsecase>((ref) {
  final repository = ref.watch(customerDriverRepositoriesProvider);
  return GetPayloadUsecase(repository);
});

class GetPayloadUsecase implements UseCase<Unit, Map<String, dynamic>> {
  GetPayloadUsecase(this._repository);

  final CustomerDriverRepositories _repository;

  @override
  Future<Either<String, Unit>> call(Map<String, dynamic> params) {
    return _repository.sendPayload(params);
  }
}
