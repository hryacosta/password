import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/data/models/credential_model.dart';
import 'package:password/domain/entities/credential_entity.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, SessionEntity>> signIn(CredentialEntity args) async {
    try {
      final result = await remoteDataSource.signIn(
        CredentialModel(
          password: args.password,
          username: args.username,
        ),
      );

      return right(result);
    } on DioException catch (error) {
      return left(ServerFailure(error.response?.data));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return right(true);
    } on DioException catch (error) {
      return left(ServerFailure(error.response?.data));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> signUp() {
    throw UnimplementedError();
  }
}
