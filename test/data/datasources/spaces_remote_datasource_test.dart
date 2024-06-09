import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks.dart';

void main() {
  late SpaceRemoteDataSource dataSource;
  late MockClient mockClient;

  final mockAuthStatus = AuthenticationService();
  final fixtureSpaces = fixtureMap('get_spaces.json');

  setUp(() {
    mockClient = MockClient();
    dataSource = SpaceRemoteDataSource.from(client: mockClient);
  });

  tearDown(() async {
    mockAuthStatus.dispose();
  });

  group('getSpaces', () {
    test(
      'should return SpaceModel when the response code is 200 (success)',
      () async {
        AuthenticationService.getInstance().createSession(
          idToken: 'idToken',
          refreshToken: 'refreshToken',
          accessToken: 'accessToken',
        );

        when(() => mockClient.get<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            data: fixtureSpaces,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        mockAuthStatus.createSession(
          idToken: 'idToken',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        );

        final response = await dataSource.getSpaces();

        expect(response, isA<List<SpaceModel>>());

        verify(() => mockClient.get<Map<String, dynamic>>(any()));

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        AuthenticationService.getInstance().createSession(
          idToken: 'idToken',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        );

        when(() => mockClient.get<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            statusCode: 404,
            requestOptions: RequestOptions(),
          ),
        );

        mockAuthStatus.createSession(
          idToken: 'idToken',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        );

        try {
          await dataSource.getSpaces();
        } catch (e) {
          expect(e, isA<DioException>());
          final error = e as DioException;
          expect(error.response?.statusCode, 404);
        }
      },
    );

    test(
      'should throw a Exception when has not authorization',
      () async {
        when(() => mockClient.get<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            statusCode: 401,
            requestOptions: RequestOptions(),
          ),
        );

        try {
          await dataSource.getSpaces();
        } catch (e) {
          expect(e, isA<DioException>());
          final error = e as DioException;
          expect(error.response?.statusCode, 401);
        }
      },
    );
  });
}
