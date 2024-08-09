import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/credential_entity.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';

@lazySingleton
class SignIn implements UseCase<SessionEntity, CredentialEntity> {
  SignIn(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, SessionEntity>> call(CredentialEntity arg) async =>
      repository.signIn(arg);
}
