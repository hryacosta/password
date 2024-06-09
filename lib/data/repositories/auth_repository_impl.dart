import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';
import 'package:password/domain/usecases/sign_in.dart' as sign_in;

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, SessionEntity>> signIn(sign_in.Param args) async {
    try {
      final body = {
        'username': args.username,
        'password': args.password,
      };

      final result = await remoteDataSource.signIn(body);

      return right(result);
    } on DioException catch (error) {
      return left(ServerFailure(error));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SessionEntity>> signUp() {
    throw UnimplementedError();
  }
}
