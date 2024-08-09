import 'package:flutter_test/flutter_test.dart';
import 'package:password/domain/entities/password_entity.dart';

void main() {
  group('PasswordEntity', () {
    test('should be an instance of PasswordEntity', () {
      const passwordEntity = PasswordEntity(
        title: 'Test Title',
        username: 'testuser',
        password: 'testpassword',
        uuid: '12345',
      );
      expect(passwordEntity, isA<PasswordEntity>());
    });

    test('should have correct properties', () {
      final passwordEntity = PasswordEntity(
        title: 'Test Title',
        username: 'testuser',
        password: 'testpassword',
        updatedAt: DateTime.parse('2022-01-01 12:00:00'),
        uuid: '12345',
      );
      expect(passwordEntity.title, 'Test Title');
      expect(passwordEntity.username, 'testuser');
      expect(passwordEntity.password, 'testpassword');
      expect(
        passwordEntity.updatedAt?.toIso8601String(),
        '2022-01-01T12:00:00.000',
      );
    });

    test('should return correct props', () {
      final passwordEntity = PasswordEntity(
        title: 'Test Title',
        username: 'testuser',
        password: 'testpassword',
        updatedAt: DateTime.parse('2022-01-01 12:00:00'),
        uuid: '12345',
      );
      expect(passwordEntity.props, [
        '12345',
        'testuser',
        'testpassword',
        'Test Title',
        DateTime.parse('2022-01-01 12:00:00'),
      ]);
    });
  });
}
