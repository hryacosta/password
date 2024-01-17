import 'package:fpdart/fpdart.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  SpaceRepositoryImpl({
    required this.remoteDateSource,
  });

  final SpaceRemoteDataSource remoteDateSource;

  @override
  Future<Either<Failure, List<SpaceEntity>>> getSpaces() async {
    try {
      final result = await remoteDateSource.getSpaces();

      final spaces = result.bodyOrThrow;

      return Right(spaces);
    } on AuthenticationException catch (error, stackTrace) {
      logger.e(
        'AuthenticationException',
        error: error,
        stackTrace: stackTrace,
      );

      return left(AuthenticationFailure());
    } catch (error, stackTrace) {
      logger.e(
        'Exception',
        error: error,
        stackTrace: stackTrace,
      );

      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> addSpace(SpaceEntity space) async {
    try {
      // await remoteDateSource.addSpace(space);

      return const Right('');
    } on AuthenticationException catch (error, stackTrace) {
      logger.e(
        'AuthenticationException',
        error: error,
        stackTrace: stackTrace,
      );
      return Left(AuthenticationFailure());
    } catch (error, stackTrace) {
      logger.e('Exception', error: error, stackTrace: stackTrace);

      return Left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSpace(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateSpace(SpaceEntity space) {
    throw UnimplementedError();
  }
}
