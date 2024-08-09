import 'package:flutter_test/flutter_test.dart';
import 'package:password/data/models/password_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  group('PasswordModel', () {
    test('should create an instance from JSON', () {
      const json = {
        'uuid': '12345',
        'username': 'testuser',
        'password': 'testPassword123#',
        'updated_at': '2023-01-01T12:00:00Z',
        'title': 'Test Password',
      };

      final passwordModel = PasswordModel.fromJson(json);

      expect(passwordModel.username, equals('testuser'));
      expect(passwordModel.password, equals('testPassword123#'));
      expect(passwordModel.updatedAt, equals('2023-01-01T12:00:00Z'));
      expect(passwordModel.title, equals('Test Password'));
    });

    test('should create an instance from JSON', () {
      final passwordModel = PasswordModel.fromJson(fixtureMap('password.json'));

      expect(passwordModel.username, equals('username@gmail.com'));
      expect(passwordModel.password, equals('Abc1234!'));
      expect(passwordModel.title, equals('1Password'));
    });

    test('should create a JSON object from an instance', () {
      final passwordModel = PasswordModel(
        username: 'testuser',
        password: 'testPassword123#',
        updatedAt: DateTime.parse('2023-01-01T12:00:00Z'),
        title: 'Test Password',
        uuid: '12345',
      );

      final json = passwordModel.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['username'], equals('testuser'));
      expect(json['password'], equals('testPassword123#'));
      expect(json['updated_at'], equals('2023-01-01T12:00:00.000Z'));
      expect(json['title'], equals('Test Password'));
    });

    test('should create a copy of the instance with updated values', () {
      final originalPasswordModel = PasswordModel(
        username: 'testuser',
        password: 'testPassword123#',
        updatedAt: DateTime.parse('2023-01-01T12:00:00Z'),
        title: 'Test Password',
        uuid: '12345',
      );

      final updatedPasswordModel = originalPasswordModel.copyWith(
        username: 'newuser',
        password: 'newPassword456&',
        updatedAt: DateTime.parse('2023-01-02T13:00:00Z'),
        title: 'Updated Password',
      );

      expect(updatedPasswordModel.username, equals('newuser'));
      expect(updatedPasswordModel.password, equals('newPassword456&'));
      expect(
        updatedPasswordModel.updatedAt?.toIso8601String(),
        equals('2023-01-02T13:00:00.000Z'),
      );
      expect(updatedPasswordModel.title, equals('Updated Password'));
    });
  });
}
