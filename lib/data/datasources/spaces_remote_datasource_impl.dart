import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:password/core/config/injectable.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/extension/http_response.dart';
import 'package:password/core/services/auth_service.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/data/datasources/constants.dart';
import 'package:password/data/datasources/spaces_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';

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
    final result = await client.get(
      spacesUrl,
      headers: sl<AuthService>().headers,
    );

    logger.d(result);

    final data = jsonDecode(result.body);

    if (result.isOk) {
      return SpaceModel.fromJson(data);
    }

    logger.e(data);

    return throw ServerException.fromJson(data);
  }

  @override
  Future<void> updateSpace({required SpaceModel space}) {
    throw UnimplementedError();
  }
}
