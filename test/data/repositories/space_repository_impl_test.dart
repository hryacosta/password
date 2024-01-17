import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  late SpaceRemoteDataSource remoteDataSource;
  late SpaceRepositoryImpl repository;

  ChopperClient buildClient({
    http.Client? httpClient,
    ErrorConverter? errorConverter,
    Converter? converter,
  }) =>
      ChopperClient(
        baseUrl: apiBaseUrl,
        client: httpClient,
        errorConverter: errorConverter,
        converter: converter,
      );

  void onMockRemoteData({
    http.Client? httpClient,
    ErrorConverter? errorConverter,
    Converter? converter,
  }) {
    final client = buildClient(
      httpClient: httpClient,
      converter: converter,
      errorConverter: errorConverter,
    );
    remoteDataSource = SpaceRemoteDataSource.create(client);
    repository = SpaceRepositoryImpl(
      remoteDateSource: remoteDataSource,
    );
  }

  group('getSpaces', () {
    test(
      'should return SpaceModel when the call is successful',
      () async {
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
        final error = ServerException(code: 1010, message: 'error');

        final result = await repository.getSpaces();

        expect(
          result,
          equals(
            Left<Failure, List<SpaceEntity>>(
              ServerFailure(error),
            ),
          ),
        );
      },
    );

    test(
      'should throw AuthenticationException when the call is unsuccessful',
      () async {
        final error = AuthenticationException('error');

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
