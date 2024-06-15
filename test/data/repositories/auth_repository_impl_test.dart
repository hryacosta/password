import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/session_model.dart';
import 'package:password/data/repositories/auth_repository_impl.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/usecases/sign_in.dart' as sign_in;

import '../../fixtures/fixture_reader.dart';
import '../../mocks/mock_auth_remote_data_source.dart';

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late AuthRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  final params = {
    'username': 'username',
    'password': 'password',
  };

  const signInParams =
      sign_in.Param(username: 'username', password: 'password');

  test(
      'should return SessionEntity when the call to remote data source is'
      ' successful', () async {
    final sessionModel = SessionModel.fromJson(fixtureMap('session.json'));

    when(
      () => remoteDataSource.signIn(params),
    ).thenAnswer(
      (_) async => sessionModel,
    );

    final result = await repository.signIn(signInParams);

    expect(result.isRight(), isTrue);

    expect(result.getRight(), Option.of(sessionModel));

    final captured = verify(
      () => remoteDataSource.signIn(captureAny()),
    ).captured;

    expect(captured.last, equals(params));

    verifyNoMoreInteractions(remoteDataSource);
  });

  test(
    'should return ServerFailure when the call to remote data source throws'
    ' ChopperHttpException',
    () async {
      when(
        () => remoteDataSource.signIn(params),
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

      expect(captured.last, equals(params));

      verifyNoMoreInteractions(remoteDataSource);
    },
  );

  test(
    'should return ServerFailure when the call to remote data source throws'
    ' an exception',
    () async {
      when(
        () => remoteDataSource.signIn(params),
      ).thenThrow(
        () => Exception('error'),
      );

      final result = await repository.signIn(signInParams);

      expect(result.isLeft(), isTrue);

      expect(result, isA<Left<Failure, SessionEntity>>());

      final captured = verify(
        () => remoteDataSource.signIn(captureAny()),
      ).captured;

      expect(captured.last, equals(params));

      verifyNoMoreInteractions(remoteDataSource);
    },
  );
}
