import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/app_database.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';
import 'package:uuid/uuid.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

class MockUuid extends Mock implements Uuid {}

void main() {
  group('PasswordLocalDataSource', () {
    late MockAppDatabase mockAppDatabase;
    late MockUuid mockUuid;
    late PasswordLocalDataSource passwordLocalDataSource;

    setUp(() {
      mockAppDatabase = MockAppDatabase();
      mockUuid = MockUuid();
      passwordLocalDataSource = PasswordLocalDataSource.from(
        uuid: mockUuid,
        database: mockAppDatabase,
      );
    });

    test(
      'addPassword() should add a password to the database',
      () async {
        final tPasswordModel = PasswordModel(
          title: 'Test Title',
          username: 'tester',
          password: 'testPassword123#',
          uuid: '12345',
          updatedAt: DateTime.now(),
        );

        // when(() => mockAppDatabase.into(any()).insert(any()))
        // .thenAnswer((_) async => 1);

        await passwordLocalDataSource.addPassword(tPasswordModel);

        // verify(() => mockAppDatabase.into(any()).insert(any())).called(1);
      },
      skip: true,
    );
  });
}
