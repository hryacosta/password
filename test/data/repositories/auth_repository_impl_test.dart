import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/credential_model.dart';
import 'package:password/data/models/session_model.dart';
import 'package:password/data/repositories/auth_repository_impl.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/mock_auth_remote_data_source.dart';

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late AuthRepositoryImpl repository;
  const signInParams =
      CredentialModel(username: 'username', password: 'password');

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);

    registerFallbackValue(signInParams);
  });

  test(
      'should return SessionEntity when the call to remote data source is'
      ' successful', () async {
    final sessionModel = SessionModel.fromJson(fixtureMap('session.json'));

    when(
      () => remoteDataSource.signIn(any()),
    ).thenAnswer(
      (_) async => sessionModel,
    );

    final result = await repository.signIn(signInParams);

    expect(result.isRight(), isTrue);

    expect(result.getRight(), Option.of(sessionModel));

    final captured = verify(
      () => remoteDataSource.signIn(captureAny()),
    ).captured;

    expect(captured.last, equals(signInParams));

    verifyNoMoreInteractions(remoteDataSource);
  });

  test(
    'should return ServerFailure when the call to remote data source throws'
    ' ChopperHttpException',
    () async {
      when(
        () => remoteDataSource.signIn(any()),
      ).thenThrow(
        () => DioException(requestOptions: RequestOptions()),
      );

      final result = await repository.signIn(signInParams);

      expect(result.isLeft(), isTrue);
      expect(result.isRight(), isFalse);

      expect(result, isA<Left<Failure, SessionEntity>>());

      final captured = verify(
        () => remoteDataSource.signIn(captureAny()),
      ).captured;

      expect(captured.last, equals(signInParams));

      verifyNoMoreInteractions(remoteDataSource);
    },
  );

  test(
    'should return ServerFailure when the call to remote data source throws'
    ' an exception',
    () async {
      when(
        () => remoteDataSource.signIn(any()),
      ).thenThrow(
        () => Exception('error'),
      );

      final result = await repository.signIn(signInParams);

      expect(result.isLeft(), isTrue);

      expect(result, isA<Left<Failure, SessionEntity>>());

      final captured = verify(
        () => remoteDataSource.signIn(captureAny()),
      ).captured;

      expect(captured.last, equals(signInParams));

      verifyNoMoreInteractions(remoteDataSource);
    },
  );
}
