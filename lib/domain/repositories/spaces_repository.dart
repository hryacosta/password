import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space_entity.dart';

@injectable
abstract class SpaceRepository {
  @factoryMethod
  factory SpaceRepository.from({
    required SpaceRemoteDataSource remoteDateSource,
  }) =>
      SpaceRepositoryImpl(
        remoteDateSource: remoteDateSource,
      );

  Future<Either<Failure, List<SpaceEntity>>> getSpaces();

  Future<Either<Failure, String>> addSpace(SpaceEntity space);

  Future<Either<Failure, String>> updateSpace(SpaceEntity space);

  Future<Either<Failure, String>> deleteSpace(String id);
}
