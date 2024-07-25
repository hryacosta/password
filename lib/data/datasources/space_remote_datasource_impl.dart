import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/core/services/space_api.dart';
import 'package:password/core/utils/http_response.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

class SpaceRemoteDataSourceImpl implements SpaceRemoteDataSource {
  SpaceRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<void> addSpace(SpaceEntity space) {
    return client.post<Map<String, dynamic>>(SpaceApi.spaces, data: space);
  }

  @override
  Future<void> deleteSpace(String id) {
    return client.delete<Map<String, dynamic>>(
      SpaceApi.spaces,
      queryParameters: {
        'id': id,
      },
    );
  }

  @override
  Future<List<SpaceModel>> getSpaces() async {
    final response = await client.get<Map<String, dynamic>>(SpaceApi.spaces);

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
