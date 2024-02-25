import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/usecase/use_case.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authetication_repository.dart';

@lazySingleton
class SignIn extends UseCase<SessionEntity, Param> {
  SignIn(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, SessionEntity>> call(Param arg) async =>
      repository.signin(arg);
}

class Param extends Equatable {
  const Param({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
