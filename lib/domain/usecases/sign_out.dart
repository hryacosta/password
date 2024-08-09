import 'package:fpdart/fpdart.dart';
import 'package:password/core/usecase/use_case_no_params.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';

class SignOut implements UseCaseNoParams<void> {
  SignOut(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call() async => repository.signOut();
}
