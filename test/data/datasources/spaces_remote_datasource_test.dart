import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/services/auth_service.dart';

import '../../fixtures/fixture_reader.dart';
import '../../test_widget.mocks.dart';

void main() {
  late SpaceRemoteDataSource dataSource;
  late MockClient mockClient;
  late List<SpaceModel> tSpacesModel;
  final mockAuthStatus = AuthenticationService();
  final fixtureSpaces = fixtureMap('get_spaces.json');
  final option = Option<List<dynamic>>.of(fixtureSpaces['spaces'])
      .getOrElse(() => <dynamic>[]);
  tSpacesModel = option
      .map(
        (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
      )
      .toList();

  setUpAll(() {
    mockClient = MockClient();
    dataSource = SpaceRemoteDataSource.create(mockClient);
  });

  tearDown(() async {
    mockAuthStatus.dispose();
  });

  void setUpMockHttpClientSuccess(String fixture) {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(
        fixture,
        200,
        headers: {'content-type': 'text/html; charset=utf-8'},
      ),
    );
  }

  void setUpMockHttpClientFailure(String fixture) {
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(
        fixture,
        500,
        headers: {'content-type': 'text/html; charset=utf-8'},
      ),
    );
  }

  group('getSpaces', () {
    test(
      'should perform a GET request on URL with number being the endpoint and with application/json header',
      () async {
        mockAuthStatus.createSession(idToken: 'idToken');

        setUpMockHttpClientSuccess(fixture('get_spaces.json'));

        await dataSource.getSpaces();

        verify(
          mockClient.get(
            apibaseUrl,
            headers: {
              'Content-Type': 'application/json;charset=UTF-8',
              'Accept': 'application/json',
              'authorization': 'idToken',
            },
          ),
        );
      },
    );

    test(
      'should return SpaceModel when the response code is 200 (success)',
      () async {
        mockAuthStatus.createSession(idToken: 'idToken');

        setUpMockHttpClientSuccess(fixture('get_spaces.json'));

        final result = await dataSource.getSpaces();

        expect(result, isA<List<SpaceModel>>());

        expect(result, equals(tSpacesModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () {
        mockAuthStatus.createSession(idToken: 'idToken');

        setUpMockHttpClientFailure(fixture('custom_server_error.json'));

        final call = dataSource.getSpaces;

        expect(call, throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a AuthenticationException when has not authorization',
      () {
        setUpMockHttpClientFailure(fixture('custom_server_error.json'));

        final call = dataSource.getSpaces;

        expect(call, throwsA(isA<AuthenticationException>()));
      },
    );
  });
}
