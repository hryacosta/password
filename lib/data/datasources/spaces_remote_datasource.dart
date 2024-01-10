import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/extension/http_client.dart';
import 'package:password/core/extension/http_response.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/space_model.dart';

@injectable
abstract class SpaceRemoteDataSource {
  @factoryMethod
  factory SpaceRemoteDataSource.from({
    required http.Client client,
  }) =>
      SpaceRemoteDataSourceImpl(client: client);

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<SpaceModel> getSpaces();

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> addSpace({required SpaceModel space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> updateSpace({required SpaceModel space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> deleteSpace({required String id});
}

class SpaceRemoteDataSourceImpl implements SpaceRemoteDataSource {
  SpaceRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<void> addSpace({required SpaceModel space}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSpace({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<SpaceModel> getSpaces() async {
    final result = await client.getWithAuthCheck(getSpacesUri);

    final data = jsonDecode(result.body);

    if (result.isOk) {
      return SpaceModel.fromJson(data);
    }

    return throw ServerException.fromJson(data);
  }

  @override
  Future<void> updateSpace({required SpaceModel space}) {
    throw UnimplementedError();
  }
}
