import 'package:dio/dio.dart';
import 'package:password/core/extension/http_response.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/session_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<SessionModel> signIn(Map<String, String> body) async {
    final response =
        await client.post<Map<String, dynamic>>('/$stage/login', data: body);

    if (response.isOk) {
      return SessionModel.fromJson(response.data!);
    }

    throw DioException(
      response: response,
      requestOptions: response.requestOptions,
      type: DioExceptionType.badResponse,
    );
  }

  @override
  Future<void> signOut() async {
    final response = await client.post<Map<String, dynamic>>('/$stage/logout');

    if (!response.isOk) {
      throw DioException(
        response: response,
        requestOptions: response.requestOptions,
        type: DioExceptionType.badResponse,
      );
    }
  }
}
