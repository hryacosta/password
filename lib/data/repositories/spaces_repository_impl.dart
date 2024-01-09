import 'package:dartz/dartz.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/data/datasources/spaces_remote_datasource.dart';
import 'package:password/domain/entities/space.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  SpaceRepositoryImpl({
    required this.remoteDateSource,
  });

  final SpaceRemoteDataSource remoteDateSource;

  // final MangaDexLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Space>>> getSpaces() async {
    try {
      final result = await remoteDateSource.getSpaces();

      return Right(result);
    } on ServerException catch (error, stackTrace) {
      logger.e(
        'authentication ServerException',
        error: error,
        stackTrace: stackTrace,
      );

      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> addSpace(Space space) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteSpace(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateSpace(Space space) {
    throw UnimplementedError();
  }
}
