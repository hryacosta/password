import 'package:fpdart/fpdart.dart';
import 'package:password/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params arg);
}
