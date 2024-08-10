import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password/core/services/app_database.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('PasswordLocalDataSource', () {
    late AppDatabase mockAppDatabase;
    late Uuid mockUuid;
    late PasswordLocalDataSource passwordLocalDataSource;

    setUp(() {
      mockAppDatabase = AppDatabase(NativeDatabase.memory());
      mockUuid = const Uuid();
      passwordLocalDataSource = PasswordLocalDataSource.from(
        uuid: mockUuid,
        database: mockAppDatabase,
      );

      final value = PasswordCompanion(
        title: const Value('Test Title'),
        uuid: const Value('12345'),
        username: const Value('tester'),
        password: const Value('testPassword123#'),
        updatedAt: Value(DateTime.now()),
      );

      registerFallbackValue(value);
    });

    test(
      'addPassword() should add a password to the database',
      () async {
        final tPasswordModel = PasswordModel(
          title: 'Test Title',
          username: 'tester',
          password: 'testPassword123#',
        );

        expect(
          passwordLocalDataSource.addPassword(tPasswordModel),
          completion(1),
        );
      },
    );
  });
}
