import 'package:fpdart/fpdart.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  SignOut(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call([NoParams? arg]) async =>
      repository.signOut();
}

class NoParams {}
