import 'package:dartz/dartz.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/spaces_remote_data_source.dart';
import 'package:password/domain/entities/space.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  SpaceRepositoryImpl({
    required this.remoteDateSource,
  });

  final SpaceRemoteDataSource remoteDateSource;

  // final MangaDexLocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String>> addSpace() {
    // TODO: implement addSpace
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteSpace() {
    // TODO: implement deleteSpace
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Space>>> getSpaces() {
    // TODO: implement getSpaces
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateSpace() {
    // TODO: implement updateSpace
    throw UnimplementedError();
  }
}
