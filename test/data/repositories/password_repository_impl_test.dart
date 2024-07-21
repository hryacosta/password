import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/password_model.dart';
import 'package:password/data/repositories/password_repository_impl.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/failures/failure.dart';

import '../../mocks/mocks_password_local_data_source.dart';

void main() {
  late MockPasswordLocalDataSource mockLocalDataSource;
  late PasswordRepositoryImpl repository;

  setUp(
    () {
      mockLocalDataSource = MockPasswordLocalDataSource();
      repository = PasswordRepositoryImpl(localDataSource: mockLocalDataSource);
    },
  );

  setUpAll(() {
    registerFallbackValue(
      PasswordModel(
        title: 'Test Title',
        username: 'tester',
        password: 'testPassword123#',
        uuid: '12345',
        updatedAt: DateTime.now().toIso8601String(),
      ),
    );
  });

  group(
    'PasswordRepositoryImpl',
    () {
      test(
        'add() should return right(true) when adding a password is successful',
        () async {
          const passwordEntity = PasswordEntity(
            title: 'Test Title',
            username: 'tester',
            password: 'testPassword123#',
            uuid: '12345',
          );

          when(() => mockLocalDataSource.addPassword(any()))
              .thenAnswer((_) async {});

          final result = await repository.add(passwordEntity);

          verify(
            () => mockLocalDataSource.addPassword(
              PasswordModel.arg(
                username: passwordEntity.username,
                password: passwordEntity.password,
                title: passwordEntity.title,
              ),
            ),
          );

          expect(result, equals(right<Failure, bool>(true)));
        },
      );

      test(
        'add() should return left(LocalFailure) when adding a password fails',
        () async {
          const passwordEntity = PasswordEntity(
            title: 'Test Title',
            username: 'tester',
            password: 'testPassword123#',
            uuid: '12345',
          );

          final error = Error();

          when(() => mockLocalDataSource.addPassword(any())).thenThrow(error);

          final result = await repository.add(passwordEntity);

          verify(() => mockLocalDataSource.addPassword(any()));

          expect(
            result,
            equals(
              left<Failure, bool>(
                LocalFailure(error),
              ),
            ),
          );
        },
      );

      test('delete() should delete a password from the database', () async {
        const passwordEntity = PasswordEntity(
          title: 'Test Title',
          username: 'tester',
          password: 'testPassword123#',
          uuid: '12345',
        );

        when(() => mockLocalDataSource.deletePassword(any()))
            .thenAnswer((_) async => {});

        final result = await repository.delete(passwordEntity);

        verify(() => mockLocalDataSource.deletePassword(any())).called(1);

        expect(result, equals(right<Failure, bool>(true)));
      });
    },
  );
}
