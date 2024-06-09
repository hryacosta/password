import 'package:flutter_test/flutter_test.dart';
import 'package:password/domain/entities/session_entity.dart';

void main() {
  group('SessionEntity', () {
    const idToken = 'test_id_token';
    const accessToken = 'test_access_token';
    const refreshToken = 'test_refresh_token';
    const expiresIn = 3600;

    test('should create a valid SessionEntity', () {
      // Arrange & Act
      const sessionEntity = SessionEntity(
        idToken: idToken,
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );

      // Assert
      expect(sessionEntity.idToken, idToken);
      expect(sessionEntity.accessToken, accessToken);
      expect(sessionEntity.refreshToken, refreshToken);
      expect(sessionEntity.expiresIn, expiresIn);
    });

    test('props should contain all properties', () {
      // Arrange
      const sessionEntity = SessionEntity(
        idToken: idToken,
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );

      // Act
      final props = sessionEntity.props;

      // Assert
      expect(props, [idToken, accessToken, refreshToken, expiresIn]);
    });

    test('should support value equality', () {
      // Arrange
      const sessionEntity1 = SessionEntity(
        idToken: idToken,
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );

      const sessionEntity2 = SessionEntity(
        idToken: idToken,
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      );

      // Assert
      expect(sessionEntity1, sessionEntity2);
    });
  });
}
