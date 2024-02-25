import 'package:fpdart/fpdart.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/exceptions/exception.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authetication_repository.dart';
import 'package:password/domain/usecases/sign_in.dart' as sign_in;

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, SessionEntity>> signin(sign_in.Param args) async {
    try {
      final body = {
        'username': args.username,
        'password': args.password,
      };

      final result = await remoteDataSource.signIn(body);
      final session = result.bodyOrThrow;
      return Right(session);
    } on ChopperHttpException catch (error) {
      return left(ServerFailure(error.response.error));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> signout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SessionEntity>> signup() {
    throw UnimplementedError();
  }
}
