import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space.dart';

import '../fixtures/fixture_reader.dart';
import '../widget_test.mocks.dart';

void main() {
  late MockSpaceRemoteDataSource mockRemoteDateSource;
  late SpaceRepositoryImpl repository;
  late SpaceModel tSpaceModel;

  setUp(() {
    tSpaceModel = SpaceModel.fromJson(fixtureMap('get_spaces.json'));
    mockRemoteDateSource = MockSpaceRemoteDataSource();

    repository = SpaceRepositoryImpl(
      remoteDateSource: mockRemoteDateSource,
    );
  });

  group('getSpaces', () {
    test(
      'should return SpaceModel when the call is successful',
      () async {
        when(mockRemoteDateSource.getSpaces()).thenAnswer(
          (_) async => tSpaceModel,
        );

        final result = await repository.getSpaces();

        expect(
          result,
          equals(
            Right<Failure, List<Space>>(
              tSpaceModel.spaces,
            ),
          ),
        );
      },
    );

    test(
      'should throw ServerException when the call is unsuccessful',
      () async {
        final error = ServerException(code: 1010, message: 'error');

        when(mockRemoteDateSource.getSpaces()).thenThrow(error);

        final result = await repository.getSpaces();

        expect(
          result,
          equals(
            Left<Failure, List<Space>>(
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

        when(mockRemoteDateSource.getSpaces()).thenThrow(error);

        final result = await repository.getSpaces();

        expect(
          result,
          equals(
            Left<Failure, List<Space>>(
              AuthenticationFailure(),
            ),
          ),
        );
      },
    );
  });
}
