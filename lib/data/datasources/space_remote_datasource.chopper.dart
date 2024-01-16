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
  Future<Response<List<SpaceModel>>> getSpaces() {
    final Uri $url = Uri.parse(
        'https/faqpqzhd74.execute-api.us-east-1.amazonaws.com/prod/spaces');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<SpaceModel>, SpaceModel>($request);
  }

  @override
  Future<Response<void>> addSpace(SpaceModel space) {
    final Uri $url = Uri.parse(
        'https/faqpqzhd74.execute-api.us-east-1.amazonaws.com/prod/spaces');
    final Map<String, String> $headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
    };
    final $body = space;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<void, void>($request);
  }
}
