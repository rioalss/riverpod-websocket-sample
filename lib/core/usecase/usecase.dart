import 'package:dartz/dartz.dart';

mixin UseCaseStream<Type, Params> {
  Stream<Either<String, Type>> call(Params params);
}

class NoParams {}
