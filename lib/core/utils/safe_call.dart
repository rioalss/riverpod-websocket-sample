import 'package:dartz/dartz.dart';

Future<Either<String, T>> safeCall<T, M>({
  required Future<M> Function() request,
  required T Function(M? model) mapper,
}) async {
  try {
    final response = await request();
    return Right(
      mapper(response),
    );
  } on Exception catch (e) {
    return Left((e.toString()));
  }
}

Stream<Either<String, T>> safeCallStream<T, M>({
  required Stream<Either<String, M>> Function() streamFactory,
  required bool Function(M model) filter,
  required T Function(M model) mapper,
}) {
  return streamFactory().where((event) {
    return event.fold(
      (_) => true,
      (r) => filter(r),
    );
  }).map((event) {
    try {
      return event.fold(
        (l) => Left(l),
        (r) => Right(mapper(r)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  });
}
