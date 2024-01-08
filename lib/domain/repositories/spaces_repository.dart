import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/spaces_remote_data_source.dart';
import 'package:password/data/repositories/spaces_repository_impl.dart';
import 'package:password/domain/entities/space.dart';

@injectable
abstract class SpaceRepository {
  @factoryMethod
  factory SpaceRepository.from({
    required SpaceRemoteDataSource remoteDateSource,
    //required MangaDexLocalDataSource localDataSource,
    //required NetworkInfo networkInfo,
  }) =>
      SpaceRepositoryImpl(
        remoteDateSource: remoteDateSource,
        // localDataSource: localDataSource,
        // networkInfo: networkInfo,
      );

  Future<Either<Failure, List<Space>>> getSpaces();

  Future<Either<Failure, String>> addSpace();

  Future<Either<Failure, String>> updateSpace();

  Future<Either<Failure, String>> deleteSpace();
}
