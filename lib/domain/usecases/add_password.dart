import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/password_repository.dart';

@lazySingleton
class AddPassword implements UseCase<bool, PasswordEntity> {
  AddPassword(this.repository);

  final PasswordRepository repository;

  @override
  Future<Either<Failure, bool>> call(PasswordEntity arg) async =>
      repository.add(arg);
}
