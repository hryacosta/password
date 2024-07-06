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
  });
}
