import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/extension/http_client.dart';
import 'package:password/core/extension/http_response.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

@injectable
abstract class SpaceRemoteDataSource {
  @factoryMethod
  factory SpaceRemoteDataSource.from({
    required http.Client client,
  }) =>
      SpaceRemoteDataSourceImpl(client: client);

  /// Call [getSpacesUri] endpoint.
  ///
  /// return [SpaceModel]
  ///
  /// Throws a [ServerException] for all error codes.
  /// Throws a [AuthenticationException] for all error codes.
  Future<List<SpaceModel>> getSpaces();

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  /// Throws a [AuthenticationException] for all error codes.
  Future<void> addSpace({required SpaceEntity space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  /// Throws a [AuthenticationException] for all error codes.
  Future<void> updateSpace({required SpaceEntity space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  /// Throws a [AuthenticationException] for all error codes.
  Future<void> deleteSpace({required String id});
}

class SpaceRemoteDataSourceImpl implements SpaceRemoteDataSource {
  SpaceRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<void> addSpace({required SpaceEntity space}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSpace({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<SpaceModel>> getSpaces() async {
    final result = await client.getWithAuthCheck(getSpacesUri);

    final Map<String, dynamic> data = jsonDecode(result.body);

    if (result.isOk) {
      final option =
          Option<List<dynamic>>.of(data['spaces']).getOrElse(() => <dynamic>[]);

      return option
          .map(
            (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();
    }

    return throw ServerException.fromJson(data);
  }

  @override
  Future<void> updateSpace({required SpaceEntity space}) {
    throw UnimplementedError();
  }
}
