import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:password/config/client.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/exceptions/exception.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  late SpaceRemoteDataSource dataSource;
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

  void onMockRemoteData({
    required http.Client httpClient,
  }) {
    final client = createClient(
      httpClient,
    );
    dataSource = SpaceRemoteDataSource.create(client);
  }

  tearDown(() async {
    mockAuthStatus.dispose();
  });

  group('getSpaces', () {
    test(
      'should perform a GET request on URL with number being the endpoint and with application/json header',
      () async {
        AuthenticationService.getInstance().createSession(idToken: 'idToken');
        final httpClient = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(
            request.headers['Content-Type'],
            equals('application/json; charset=UTF-8'),
          );
          expect(request.headers['Authorization'], equals('idToken'));
          expect(
            request.url.toString(),
            equals('$scheme://$host/$stage/spaces'),
          );

          return http.Response(fixture('get_spaces.json'), 200);
        });

        onMockRemoteData(httpClient: httpClient);

        mockAuthStatus.createSession(idToken: 'idToken');

        final response = await dataSource.getSpaces();

        expect(response, isA<Response<List<SpaceModel>>>());

        httpClient.close();
      },
    );

    test(
      'should return SpaceModel when the response code is 200 (success)',
      () async {
        AuthenticationService.getInstance().createSession(idToken: 'idToken');
        final httpClient = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(
            request.headers['Content-Type'],
            equals('application/json; charset=UTF-8'),
          );
          expect(request.headers['Authorization'], equals('idToken'));
          expect(
            request.url.toString(),
            equals('$scheme://$host/$stage/spaces'),
          );

          return http.Response(fixture('get_spaces.json'), 200);
        });

        onMockRemoteData(httpClient: httpClient);

        mockAuthStatus.createSession(idToken: 'idToken');

        final response = await dataSource.getSpaces();

        expect(response, isA<Response<List<SpaceModel>>>());

        expect(response.body, equals(tSpacesModel));

        expect(response.statusCode, equals(200));

        httpClient.close();
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        AuthenticationService.getInstance().createSession(idToken: 'idToken');
        final httpClient = MockClient((request) async {
          return http.Response(fixture('custom_server_error.json'), 404);
        });

        onMockRemoteData(httpClient: httpClient);

        mockAuthStatus.createSession(idToken: 'idToken');

        final call = await dataSource.getSpaces();

        expect(call, isA<Response<dynamic>>());

        expect(call.statusCode, equals(404));
      },
    );

    test(
      'should throw a UnauthorizedException when has not authorization',
      () {
        final httpClient = MockClient((request) async {
          return http.Response(fixture('get_spaces.json'), 200);
        });

        onMockRemoteData(httpClient: httpClient);

        final call = dataSource.getSpaces;

        expect(call, throwsA(isA<UnauthorizedException>()));

        httpClient.close();
      },
    );
  });
}
