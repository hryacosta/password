import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/error/failure.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/data/repositories/space_repository_impl.dart';
import 'package:password/domain/entities/space_entity.dart';

import '../../fixtures/fixture_reader.dart';
import '../../test_widget.mocks.dart';

void main() {
  late MockSpaceRemoteDataSource mockRemoteDateSource;
  late SpaceRepositoryImpl repository;
  late List<SpaceModel> tSpaceModel;
  final fixtureSpaces = fixtureMap('get_spaces.json');
  final option = Option<List<dynamic>>.of(fixtureSpaces['spaces'])
      .getOrElse(() => <dynamic>[]);

  setUp(() {
    tSpaceModel = option
        .map(
          (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
        )
        .toList();

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
            Right<Failure, List<SpaceEntity>>(
              tSpaceModel,
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

        when(mockRemoteDateSource.getSpaces()).thenThrow(error);

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
