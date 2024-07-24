import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/data/models/password_model.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/password_repository.dart';

import '../../fixtures/fixture_reader.dart';
import '../../mocks/mocks_password_local_data_source.dart';

void main() {
  late PasswordRepository repository;
  late MockPasswordLocalDataSource localDataSource;
  final tPasswordModel = PasswordModel.fromJson(fixtureMap('password.json'));

  setUp(() {
    localDataSource = MockPasswordLocalDataSource();
    repository = PasswordRepository.from(localDataSource: localDataSource);
  });

  setUpAll(() {
    registerFallbackValue(tPasswordModel);
  });

  group('PasswordRepository', () {
    test('should add a new password to the local data source', () async {
      when(() => localDataSource.addPassword(any()))
          .thenAnswer((_) async => true);

      final result = await repository.add(tPasswordModel);

      verify(() => localDataSource.addPassword(captureAny()));

      expect(result, equals(right<Failure, bool>(true)));
    });

    test('should return a failure when adding a new password fails', () async {
      final error = Exception('error');
      when(() => localDataSource.addPassword(any())).thenThrow(error);

      final result = await repository.add(tPasswordModel);

      verify(() => localDataSource.addPassword(captureAny()));

      expect(result, equals(left<Failure, bool>(LocalFailure(error))));
    });

    test('counts() should return the number of passwords in the database',
        () async {
      when(() => localDataSource.counts()).thenAnswer((_) async => 1);

      final result = await repository.count();

      verify(() => localDataSource.counts()).called(1);

      expect(result, equals(right<Failure, int>(1)));
    });

    test('update() should update an existing password in the local data source',
        () async {
      when(() => localDataSource.updatePassword(any()))
          .thenAnswer((_) async => tPasswordModel);

      final result = await repository.update(tPasswordModel);

      verify(() => localDataSource.updatePassword(any()));

      expect(result, equals(right<Failure, bool>(true)));
    });

    test(
        'delete() should delete an existing password from the local data source',
        () async {
      when(() => localDataSource.deletePassword(any()))
          .thenAnswer((_) async => {});

      final result = await repository.delete(tPasswordModel);

      verify(() => localDataSource.deletePassword(any()));

      expect(result, equals(right<Failure, bool>(true)));
    });
  });
}
