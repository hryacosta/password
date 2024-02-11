// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_remote_datasource.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SpaceRemoteDataSource extends SpaceRemoteDataSource {
  _$SpaceRemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SpaceRemoteDataSource;

  @override
  Future<Response<void>> addSpace(SpaceEntity space) {
    final Uri $url = Uri.parse('prod/spaces');
    final $body = space;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<List<SpaceModel>>> getSpaces() {
    final Uri $url = Uri.parse('prod/spaces');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<SpaceModel>, SpaceModel>(
      $request,
      responseConverter: SpaceConverter.response,
    );
  }

  @override
  Future<Response<void>> deleteSpace(String id) {
    final Uri $url = Uri.parse('prod/spaces');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }
}
