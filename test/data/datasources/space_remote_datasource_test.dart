import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/space_api.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/entities/space_entity.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/mock_client.dart';

void main() {
  group('SpaceRemoteDataSource', () {
    late MockClient client;
    late SpaceRemoteDataSource dataSource;

    setUp(() {
      client = MockClient();
      dataSource = SpaceRemoteDataSource.from(client: client);
    });

    test('getSpaces should return a list of SpaceModel', () async {
      when(() => client.get<Map<String, dynamic>>(SpaceApi.spaces)).thenAnswer(
        (_) async => Response(
          data: fixtureMap('get_spaces.json'),
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      final spaces = await dataSource.getSpaces();

      expect(spaces.length, 6);
      expect(spaces[0].id, 'c36720ed-dac7-4ac4-86cb-46343718e4b9');
      expect(spaces[0].name, 'Tegucigalpa');
      expect(spaces[0].location, 'Honduras');
    });

    test('addSpace should make a POST request to add a new space', () async {
      const space = SpaceEntity(
        id: '3',
        name: 'Space 3',
        location: 'Location 3',
        timestamp: 1704609158,
      );

      when(
        () =>
            client.post<Map<String, dynamic>>(any(), data: any(named: 'data')),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      await dataSource.addSpace(space);

      verify(
        () => client.post<Map<String, dynamic>>(
          SpaceApi.spaces,
          data: space,
        ),
      ).called(1);
    });

    test('deleteSpace should make a DELETE request to delete a space',
        () async {
      const spaceId = '1';
      when(
        () => client.delete<Map<String, dynamic>>(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(),
        ),
      );

      await dataSource.deleteSpace(spaceId);

      verify(
        () => client.delete<Map<String, dynamic>>(
          SpaceApi.spaces,
          queryParameters: {'id': spaceId},
        ),
      ).called(1);
    });
  });
}
