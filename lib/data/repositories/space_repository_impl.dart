import 'package:chopper/src/chopper_http_exception.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  SpaceRepositoryImpl({
    required this.remoteDataSource,
  });

  final SpaceRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<SpaceEntity>>> getSpaces() async {
    try {
      final result = await remoteDataSource.getSpaces();
      final spaces = result.bodyOrThrow;
      return Right(spaces);
    } on UnauthorizedException catch (_) {
      return left(AuthenticationFailure());
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> addSpace(SpaceEntity space) async {
    try {
      await remoteDataSource.addSpace(space);
      return const Right('');
    } on UnauthorizedException catch (_) {
      return Left(AuthenticationFailure());
    } catch (error) {
      return Left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSpace(String id) async {
    try {
      await remoteDataSource.deleteSpace(id);
      return const Right('');
    } on UnauthorizedException catch (_) {
      return Left(AuthenticationFailure());
    } catch (error) {
      return Left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> updateSpace(SpaceEntity space) {
    throw UnimplementedError();
  }
}
