import 'package:fpdart/fpdart.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authetication_repository.dart';

class SignOut extends UseCase<void, any> {
  SignOut(this.repository);

  final AuthRepository repository;

  Future<Either<Failure, void>> call() async {
    await repository.signout();
  }
}
