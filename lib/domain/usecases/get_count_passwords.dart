import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case_no_params.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/password_repository.dart';

@lazySingleton
class GetCountPasswords implements UseCaseNoParams<int> {
  GetCountPasswords(this.repository);

  final PasswordRepository repository;

  @override
  Future<Either<Failure, int>> call() async => repository.count();
}
