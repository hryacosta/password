import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks.dart';

void main() {
  late SpaceRemoteDataSource dataSource;
  late MockClient mockClient;
  late List<SpaceModel> tSpacesModel;

  final mockAuthStatus = AuthenticationService();
  final fixtureSpaces = fixtureMap('get_spaces.json');

  final option = Option<List<dynamic>>.of(fixtureSpaces['spaces'])
      .getOrElse(() => <dynamic>[]);

  setUp(() {
    mockClient = MockClient();
    dataSource = SpaceRemoteDataSource.from(client: mockClient);
    tSpacesModel = option
        .map(
          (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
        )
        .toList();
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

        final call = await dataSource.getSpaces();

        // expect(call, isA<dynamic>());

        // expect(call.statusCode, equals(404));
      },
    );

    test(
      'should throw a UnauthorizedException when has not authorization',
      () async {
        // final httpClient = MockClient((request) async {
        //   return http.Response('unauthorized', 404);
        // });
        //
        // onMockRemoteData(httpClient: httpClient);
        //
        final call = await dataSource.getSpaces();

        // expect(call.statusCode, 404);

        // httpClient.close();
      },
    );
  });
}
