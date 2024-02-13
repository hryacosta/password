import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:password/config/client.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  late SpaceRemoteDataSource remoteDataSource;
  late SpaceRepositoryImpl repository;

  void onMockRemoteData({
    required http.Client httpClient,
  }) {
    final client = createClient(httpClient);

    remoteDataSource = SpaceRemoteDataSource.create(client);
    repository = SpaceRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
  }

  group('getSpaces', () {
    test(
      'should return SpaceModel when the call is successful',
      () async {
        AuthenticationService.getInstance().createSession(idToken: 'idToken');
        final httpClient = MockClient(
          (_) async => http.Response(fixture('get_spaces.json'), 200),
        );

        onMockRemoteData(httpClient: httpClient);

        final tSpaceModel =
            Option<List<dynamic>>.of(fixtureMap('get_spaces.json')['spaces'])
                .getOrElse(() => <dynamic>[])
                .map(
                  (element) =>
                      SpaceModel.fromJson(element as Map<String, dynamic>),
                )
                .toList();

        final result = await repository.getSpaces();

        expect(
          result.isRight(),
          true,
        );

        expect(result.getRight().getOrElse(() => []), equals(tSpaceModel));
      },
    );

    test(
      'should throw ServerException when the call is unsuccessful',
      () async {
        AuthenticationService.getInstance().createSession(idToken: 'idToken');

        final httpClient = MockClient(
          (_) async => http.Response(fixture('custom_server_error.json'), 500),
        );

        onMockRemoteData(httpClient: httpClient);

        final result = await repository.getSpaces();

        expect(
          result.isLeft(),
          true,
        );

        expect(
          result,
          const Left<Failure, List<SpaceEntity>>(
            ServerFailure({
              'code': 1010,
              'message': 'error message',
            }),
          ),
        );
      },
    );

    test(
      'should throw UnauthorizedException when the call is unsuccessful',
      () async {
        AuthenticationService.getInstance().dispose();

        final httpClient = MockClient(
          (_) async => http.Response(fixture('session_expired.json'), 401),
        );

        onMockRemoteData(httpClient: httpClient);

        final result = await repository.getSpaces();

        expect(
          result,
          equals(
            Left<Failure, List<SpaceEntity>>(
              AuthenticationFailure(),
            ),
          ),
        );
      },
    );
  });
}
