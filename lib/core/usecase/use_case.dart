import 'package:fpdart/fpdart.dart';
import 'package:password/domain/failures/failure.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params arg);
  // Future<Either<Failure, Type>> cancel(Params arg);
}
