import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/core/extension/http_response.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

class SpaceRemoteDataSourceImpl implements SpaceRemoteDataSource {
  SpaceRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<void> addSpace(SpaceEntity space) {
    return client.post<Map<String, dynamic>>('/$stage/spaces', data: space);
  }

  @override
  Future<void> deleteSpace(String id) {
    return client.delete<Map<String, dynamic>>(
      '/$stage/spaces',
      queryParameters: {
        'id': id,
      },
    );
  }

  @override
  Future<List<SpaceModel>> getSpaces() async {
    final response = await client.get<Map<String, dynamic>>('/$stage/spaces');

    if (response.isOk) {
      final bodyList =
          Option.of(response.data?['spaces'] as List<dynamic>).getOrElse(
        () => [],
      );

      final spacesList = bodyList
          .map(
            (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();

      return spacesList;
    }

    throw DioException(
      response: response,
      requestOptions: response.requestOptions,
      type: DioExceptionType.badResponse,
    );
  }
}
