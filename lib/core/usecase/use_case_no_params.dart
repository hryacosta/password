import 'package:fpdart/fpdart.dart';
import 'package:password/domain/failures/failure.dart';

// ignore: one_member_abstracts
abstract interface class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}
