import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/spaces_remote_datasource.dart';
import 'package:password/data/repositories/spaces_repository_impl.dart';
import 'package:password/domain/entities/space.dart';

@injectable
abstract class SpaceRepository {
  @factoryMethod
  factory SpaceRepository.from({
    required SpaceRemoteDataSource remoteDateSource,
    //required SpaceLocalDataSource localDataSource,
  }) =>
      SpaceRepositoryImpl(
        remoteDateSource: remoteDateSource,
        // localDataSource: localDataSource,
      );

  Future<Either<Failure, List<Space>>> getSpaces();

  Future<Either<Failure, String>> addSpace(Space space);

  Future<Either<Failure, String>> updateSpace(Space space);

  Future<Either<Failure, String>> deleteSpace(String id);
}
