import 'package:flutter_test/flutter_test.dart';
import 'package:password/data/models/session_model.dart';
import 'package:password/domain/entities/session_entity.dart';

void main() {
  group('SessionModel', () {
    const idToken = 'test_id_token';
    const accessToken = 'test_access_token';
    const refreshToken = 'test_refresh_token';
    const expiresIn = 3600;

    const sessionModel = SessionModel(
      idToken: idToken,
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresIn: expiresIn,
    );

    test('should be a subclass of SessionEntity', () {
      // Assert
      expect(sessionModel, isA<SessionEntity>());
    });

    test('fromJson should return a valid model', () {
      // Arrange
      final jsonMap = <String, dynamic>{
        'idToken': idToken,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
      };

      // Act
      final result = SessionModel.fromJson(jsonMap);

      // Assert
      expect(result, sessionModel);
    });

    test('toJson should return a valid JSON map', () {
      // Arrange
      final expectedJsonMap = {
        'idToken': idToken,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
      };

      // Act
      final result = sessionModel.toJson();

      // Assert
      expect(result, expectedJsonMap);
    });
  });
}
