import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';
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

      return Right(result);
    } on DioException catch (error) {
      return left(ServerFailure(jsonDecode(error.response?.data)));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> addSpace(SpaceEntity space) async {
    try {
      await remoteDataSource.addSpace(space);
      return right('');
    } on DioException catch (error) {
      return left(ServerFailure(error.response?.data));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSpace(String id) async {
    try {
      await remoteDataSource.deleteSpace(id);
      return right('');
    } on DioException catch (error) {
      return left(ServerFailure(error.response?.data));
    } catch (error) {
      return left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> updateSpace(SpaceEntity space) {
    throw UnimplementedError();
  }
}
