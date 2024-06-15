import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

import '../../mocks/mock_space_remote_data_source.dart';

void main() {
  late SpaceRepository repository;
  late MockSpaceRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockSpaceRemoteDataSource();
    repository = SpaceRepository.from(remoteDateSource: mockRemoteDataSource);
  });

  group('getSpaces', () {
    final tSpaceModelList = [
      const SpaceModel(
        id: '1',
        name: 'Space 1',
        location: 'location 1',
        timestamp: 1,
      ),
      const SpaceModel(
        id: '2',
        name: 'Space 2',
        location: 'location 2',
        timestamp: 2,
      ),
    ];

    test('should return list of SpaceEntity when the call is successful',
        () async {
      when(() => mockRemoteDataSource.getSpaces()).thenAnswer(
        (_) async => tSpaceModelList,
      );

      final result = await repository.getSpaces();

      expect(result.isRight(), true);
      expect(result.getRight().getOrElse(() => []), tSpaceModelList);
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      when(() => mockRemoteDataSource.getSpaces()).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final result = await repository.getSpaces();

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Expected a failure'),
      );
    });
  });

  group('addSpace', () {
    const tSpace = SpaceEntity(
      id: '1',
      name: 'Space 1',
      location: 'location 1',
      timestamp: 1,
    );

    test('should return empty string when the call is successful', () async {
      when(() => mockRemoteDataSource.addSpace(tSpace))
          .thenAnswer((_) async => {});

      final result = await repository.addSpace(tSpace);

      expect(result.isRight(), true);
      expect(result.getRight().getOrElse(() => 'Error'), '');
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      when(() => mockRemoteDataSource.addSpace(tSpace)).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final result = await repository.addSpace(tSpace);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Expected a failure'),
      );
    });
  });

  group('deleteSpace', () {
    const tSpaceId = '1';

    test('should return empty string when the call is successful', () async {
      when(() => mockRemoteDataSource.deleteSpace(tSpaceId))
          .thenAnswer((_) async => {});

      final result = await repository.deleteSpace(tSpaceId);

      expect(result.isRight(), true);
      expect(result.getRight().getOrElse(() => 'Error'), '');
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      when(() => mockRemoteDataSource.deleteSpace(tSpaceId)).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      final result = await repository.deleteSpace(tSpaceId);

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Expected a failure'),
      );
    });
  });
  //
  // group('updateSpace', () {
  //   const tSpace = SpaceEntity(
  //     id: '1',
  //     name: 'Updated Space 1',
  //     location: 'location 1',
  //     timestamp: 1,
  //   );
  //
  //   test('should return empty string when the call is successful', () async {
  //     // arrange
  //     when(() => mockRemoteDataSource.updateSpace(tSpace))
  //         .thenAnswer((_) async => {});
  //
  //     // act
  //     final result = await repository.updateSpace(tSpace);
  //
  //     // assert
  //     expect(result.isRight(), true);
  //     expect(result.getRight().getOrElse(() => 'Error'), '');
  //   });
  //
  //   test('should return ServerFailure when the call is
  //   unsuccessful', () async {
  //     // arrange
  //     when(mockRemoteDataSource.updateSpace(tSpace)).thenThrow(
  //       DioException(
  //         response: Response(
  //           data: '{"message": "Server error"}',
  //           requestOptions: RequestOptions(),
  //           statusCode: 500,
  //         ),
  //         requestOptions: RequestOptions(),
  //       ),
  //     );
  //
  //     // act
  //     final result = await repository.updateSpace(tSpace);
  //
  //     // assert
  //     expect(result.isLeft(), true);
  //     result.fold(
  //       (failure) => expect(failure, isA<ServerFailure>()),
  //       (_) => fail('Expected a failure'),
  //     );
  //   });
  // });
}
