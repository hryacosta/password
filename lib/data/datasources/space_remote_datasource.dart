import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_remote_datasource_impl.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

@injectable
abstract class SpaceRemoteDataSource {
  @factoryMethod
  factory SpaceRemoteDataSource.from({
    required Dio client,
  }) =>
      SpaceRemoteDataSourceImpl(client: client);

  Future<void> addSpace(SpaceEntity space);

  Future<List<SpaceModel>> getSpaces();

  Future<void> deleteSpace(String id);
}
