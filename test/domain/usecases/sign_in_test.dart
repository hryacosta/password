import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/usecases/sign_in.dart';

import '../../mocks/mock_auth_repository.dart';

void main() {
  late SignIn useCase;
  late MockAuthRepository mockAuthRepository;

  const params = Param(
    username: 'EMAIL',
    password: 'PASSWORD',
  );

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = SignIn(mockAuthRepository);
  });

  test('should sign in from repository', () async {
    const session = SessionEntity(
      idToken: 'idToken',
      refreshToken: 'refreshToken',
      accessToken: 'accessToken',
      expiresIn: 3600,
    );

    when(
      () => mockAuthRepository.signIn(params),
    ).thenAnswer(
      (_) async => Either<Failure, SessionEntity>.of(session),
    );

    final result = await useCase(params);

    expect(result.getRight(), const Option.of(session));

    verify(() => mockAuthRepository.signIn(params));

    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should params instance equatable', () {
    const params2 = Param(username: 'EMAIL', password: 'PASSWORD');

    expect(params, params2);
  });
}
