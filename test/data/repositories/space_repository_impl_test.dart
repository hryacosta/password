import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks.dart';

void main() {
  late SpaceRemoteDataSource remoteDataSource;
  late SpaceRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockSpaceRemoteDataSource();
    repository = SpaceRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group('getSpaces', () {
    test(
      'should return SpaceModel when the call is successful',
      () async {
        AuthenticationService.getInstance().createSession(
          idToken: 'idToken',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        );

        final tSpaceModel =
            Option<List<dynamic>>.of(fixtureMap('get_spaces.json')['spaces'])
                .getOrElse(() => <dynamic>[])
                .map(
                  (element) =>
                      SpaceModel.fromJson(element as Map<String, dynamic>),
                )
                .toList();
        when(
          () => remoteDataSource.getSpaces(),
        ).thenAnswer(
          (_) async => tSpaceModel,
        );

        final result = await repository.getSpaces();

        expect(
          result.isRight(),
          true,
        );

        expect(result.getRight().getOrElse(() => []), equals(tSpaceModel));
      },
    );

    test(
      'should throw DioException when the call is unsuccessful',
      () async {
        AuthenticationService.getInstance().createSession(
          idToken: 'idToken',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        );

        when(
          () => remoteDataSource.getSpaces(),
        ).thenThrow(
          DioException(
            response: Response(
              data: fixture('custom_server_error.json'),
              requestOptions: RequestOptions(),
              statusCode: 500,
            ),
            requestOptions: RequestOptions(),
          ),
        );

        final result = await repository.getSpaces();

        expect(result.isLeft(), isTrue);

        expect(result, isA<Left<Failure, List<SpaceEntity>>>());

        result.fold(
          (left) {
            expect(
              left,
              ServerFailure(fixtureMap('custom_server_error.json')),
            );
          },
          (right) {},
        );
      },
    );

    test(
      'should throw unhandler Exception when the call is unsuccessful',
      () async {
        AuthenticationService.getInstance().dispose();

        when(
          () => remoteDataSource.getSpaces(),
        ).thenThrow(Exception('unhandled exception'));

        final result = await repository.getSpaces();

        result.fold(
          (left) {
            expect(left, isA<ServerFailure>());
          },
          (right) {},
        );
      },
    );
  });
}
