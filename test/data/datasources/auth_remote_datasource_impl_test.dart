import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/datasources/auth_remote_datasource_impl.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/session_model.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/mock_client.dart';

void main() {
  group('AuthRemoteDataSourceImpl', () {
    late MockClient client;
    late AuthRemoteDataSourceImpl dataSource;

    setUp(() {
      client = MockClient();
      dataSource = AuthRemoteDataSourceImpl(client: client);
    });

    group('signIn', () {
      final tBody = {'username': 'test', 'password': 'password'};
      final tSessionModel = SessionModel.fromJson(fixtureMap('session.json'));

      test('should return SessionModel when the call is successful', () async {
        when(() => client.post<Map<String, dynamic>>(any(), data: tBody))
            .thenAnswer(
          (_) async => Response(
            data: fixtureMap('session.json'),
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await dataSource.signIn(tBody);

        expect(result, tSessionModel);
      });

      test('should throw DioException when the call is unsuccessful', () async {
        when(() => client.post<Map<String, dynamic>>(any(), data: tBody))
            .thenAnswer(
          (_) async => Response(
            data: fixtureMap('custom_server_error.json'),
            statusCode: 500,
            requestOptions: RequestOptions(),
          ),
        );

        expect(
          () async => dataSource.signIn(tBody),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('signOut', () {
      test('should call Dio.post when signOut is called', () async {
        when(() => client.post<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        await dataSource.signOut();

        verify(() => client.post<Map<String, dynamic>>('/$stage/logout'))
            .called(1);
      });

      test('should throw DioException when the call is unsuccessful', () async {
        when(() => client.post<Map<String, dynamic>>(any())).thenAnswer(
          (_) async => Response(
            data: fixtureMap('custom_server_error.json'),
            statusCode: 500,
            requestOptions: RequestOptions(),
          ),
        );

        expect(
          () => dataSource.signOut(),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}
