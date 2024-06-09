import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/data/models/session_model.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    dataSource = AuthRemoteDataSource.from(client: mockClient);
  });

  group('signIn', () {
    final tBody = {'username': 'test', 'password': 'password'};
    final tSessionModel = SessionModel.fromJson(fixtureMap('session.json'));

    test('should return SessionModel when the call is successful', () async {
      when(
        () => mockClient.post<Map<String, dynamic>>(
          any(),
          data: tBody,
        ),
      ).thenAnswer(
        (_) async => Response(
          data: fixtureMap('session.json'),
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      final result = await dataSource.signIn(tBody);

      expect(result, tSessionModel);
    });

    test('should throw DioException when the call is unsuccessful', () async {
      when(
        () => mockClient.post<Map<String, dynamic>>(
          any(),
          data: tBody,
        ),
      ).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final call = dataSource.signIn;

      expect(() => call(tBody), throwsA(isA<DioException>()));
    });
  });

  group('signOut', () {
    test('should call Dio.post when signOut is called', () async {
      when(() => mockClient.post<Map<String, dynamic>>(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      await dataSource.signOut();

      verify(() => mockClient.post<Map<String, dynamic>>(any())).called(1);
    });

    test('should throw DioException when the call is unsuccessful', () async {
      when(() => mockClient.post<Map<String, dynamic>>(any())).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final call = dataSource.signOut;

      expect(call, throwsA(isA<DioException>()));
    });
  });
}
