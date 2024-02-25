// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_remote_datasource.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthRemoteDataSource extends AuthRemoteDataSource {
  _$AuthRemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthRemoteDataSource;

  @override
  Future<Response<SessionModel>> signIn(Map<String, String> body) {
    final Uri $url = Uri.parse('prod/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SessionModel, SessionModel>(
      $request,
      responseConverter: SessionConverter.response,
    );
  }
}
