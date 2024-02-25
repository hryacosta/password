import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:password/domain/entities/session_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/usecases/sign_in.dart';

import '../../test_widget.mocks.dart';

void main() {
  late SignIn useCase;
  late MockAuthRepository mockAuthRepository;

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

    when(mockAuthRepository.signin(any)).thenAnswer(
      (_) async => Either<Failure, SessionEntity>.right(session),
    );

    final result = await useCase(
      const Param(
        username: 'EMAIL',
        password: 'PASSWORD',
      ),
    );

    final res = result.getRight().getOrElse(
          () => const SessionEntity(
            idToken: '',
            refreshToken: '',
            accessToken: '',
            expiresIn: 0,
          ),
        );

    expect(res, session);

    verify(mockAuthRepository.signin(any));

    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should params instance equatable', () {
    const params = Param(
      username: 'EMAIL',
      password: 'PASSWORD',
    );

    const params2 = Param(username: 'EMAIL', password: 'PASSWORD');

    expect(params, params2);
  });
}
