import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/session_model.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';
import 'package:password/domain/usecases/sign_in.dart' as sign_in;

import '../../mocks/mock_auth_remote_data_source.dart';

void main() {
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late AuthRepository repository;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepository.from(remoteDateSource: mockRemoteDataSource);
  });

  group('signIn', () {
    final params = {'username': 'test', 'password': 'password'};
    const tParam = sign_in.Param(username: 'test', password: 'password');

    const tSessionEntity = SessionModel(
      idToken: 'idToken',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
      expiresIn: 3600,
    );

    test('should return SessionEntity when the call is successful', () async {
      when(() => mockRemoteDataSource.signIn(params)).thenAnswer(
        (_) async => tSessionEntity,
      );

      final result = await repository.signIn(tParam);

      expect(result.isRight(), true);

      expect(result, isA<Right<Failure, SessionEntity>>());
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      // arrange
      when(() => mockRemoteDataSource.signIn(params)).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      // act
      final result = await repository.signIn(tParam);

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Expected a failure'),
      );
    });
  });

  group('signOut', () {
    test('should return SessionEntity when the call is successful', () async {
      // arrange
      when(() => mockRemoteDataSource.signOut()).thenAnswer((_) async => true);

      // act
      final result = await repository.signOut();

      // assert
      expect(result.isRight(), true);

      expect(result, isA<Right<Failure, bool>>());
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      // arrange
      when(() => mockRemoteDataSource.signOut()).thenThrow(
        DioException(
          response: Response(
            data: '{"message": "Server error"}',
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
          requestOptions: RequestOptions(),
        ),
      );

      // act
      final result = await repository.signOut();

      // assert
      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Expected a failure'),
      );
    });
  });
}
