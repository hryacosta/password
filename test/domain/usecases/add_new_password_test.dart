import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/domain/entities/credential_entity.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/usecases/add_password.dart';

import '../../mocks/mock_password_repository.dart';

void main() {
  late AddPassword useCase;
  late MockPasswordRepository repository;

  setUp(() {
    repository = MockPasswordRepository();
    useCase = AddPassword(repository);
  });

  setUpAll(() {
    registerFallbackValue(
      const PasswordEntity(
        title: 'Test Title',
        credential: CredentialEntity(
          username: 'tester',
          password: 'testPassword123#',
        ),
        uuid: '12345',
      ),
    );
  });

  test('should add a new password to the repository', () async {
    const passwordEntity = PasswordEntity(
      title: 'Test Title',
      credential: CredentialEntity(
        username: 'tester',
        password: 'testPassword123#',
      ),
      uuid: '12345',
    );
    when(() => repository.add(any())).thenAnswer((_) async => right(true));

    final result = await useCase(passwordEntity);

    verify(() => repository.add(captureAny()));
    expect(result, equals(right<Failure, bool>(true)));
  });

  test('should return a failure when adding a new password fails', () async {
    const passwordEntity = PasswordEntity(
      title: 'Test Title',
      credential: CredentialEntity(
        username: 'tester',
        password: 'testPassword123#',
      ),
      uuid: '12345',
    );
    when(() => repository.add(any())).thenAnswer(
      (_) async => left(const LocalFailure('Error adding password')),
    );

    final result = await useCase(passwordEntity);

    verify(() => repository.add(captureAny()));
    expect(
      result,
      equals(
        left<Failure, bool>(const LocalFailure('Error adding password')),
      ),
    );
  });
}
