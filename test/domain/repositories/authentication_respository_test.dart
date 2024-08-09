import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/credential_model.dart';
import 'package:password/data/models/session_model.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/authentication_repository.dart';

import '../../mocks/mock_auth_remote_data_source.dart';

void main() {
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late AuthRepository repository;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepository.from(remoteDateSource: mockRemoteDataSource);
  });

  group('signIn', () {
    const tCredential = CredentialModel(username: 'test', password: 'password');

    const tSessionEntity = SessionModel(
      idToken: 'idToken',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
      expiresIn: 3600,
    );

    test('should return SessionEntity when the call is successful', () async {
      when(() => mockRemoteDataSource.signIn(tCredential)).thenAnswer(
        (_) async => tSessionEntity,
      );

      final result = await repository.signIn(tCredential);

      expect(result.isRight(), true);

      expect(result, isA<Right<Failure, SessionEntity>>());
    });

    test('should return ServerFailure when the call is unsuccessful', () async {
      // arrange
      when(() => mockRemoteDataSource.signIn(tCredential)).thenThrow(
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
      final result = await repository.signIn(tCredential);

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
