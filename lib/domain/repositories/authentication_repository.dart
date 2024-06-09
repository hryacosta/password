import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/data/repositories/auth_repository_impl.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/usecases/sign_in.dart' as sign_in;

@injectable
abstract class AuthRepository {
  @factoryMethod
  factory AuthRepository.from({
    required AuthRemoteDataSource remoteDateSource,
  }) =>
      AuthRepositoryImpl(
        remoteDataSource: remoteDateSource,
      );

  Future<Either<Failure, SessionEntity>> signIn(sign_in.Param arg);

  Future<Either<Failure, SessionEntity>> signUp();

  Future<Either<Failure, bool>> signOut();
}
