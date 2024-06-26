import 'package:flutter_test/flutter_test.dart';
import 'package:password/core/services/authentication_service.dart';

void main() {
  late AuthenticationService authService;

  setUp(() {
    authService = AuthenticationService.getInstance();
  });

  tearDown(() {
    authService.dispose();
  });

  group('AuthenticationService', () {
    test('should create a singleton instance', () {
      final instance1 = AuthenticationService.getInstance();
      final instance2 = AuthenticationService.getInstance();

      expect(instance1, same(instance2));
    });

    test('should create a session with given tokens and expiration time', () {
      const idToken = 'idToken';
      const refreshToken = 'refreshToken';
      const accessToken = 'accessToken';
      const expiresIn = 60.0;

      authService.createSession(
        idToken: idToken,
        refreshToken: refreshToken,
        accessToken: accessToken,
      );

      expect(authService.authorizationToken, idToken);
      expect(authService.refreshToken, refreshToken);
      expect(authService.accessToken, accessToken);
      expect(authService.expiresIn, expiresIn);
      expect(authService.isSignedIn, true);
    });

    test('should destroy the session', () {
      const idToken = 'idToken';
      const refreshToken = 'refreshToken';
      const accessToken = 'accessToken';

      authService
        ..createSession(
          idToken: idToken,
          refreshToken: refreshToken,
          accessToken: accessToken,
        )
        ..dispose();

      expect(authService.authorizationToken, '');
      expect(authService.refreshToken, '');
      expect(authService.accessToken, '');
      expect(authService.expiresIn, 60);
      expect(authService.isSignedIn, false);
    });

    test('should return false for isSignedIn if session is expired', () {
      const idToken = 'idToken';
      const refreshToken = 'refreshToken';
      const accessToken = 'accessToken';
      const expiresIn = 0.0; // session expires immediately

      authService.createSession(
        idToken: idToken,
        refreshToken: refreshToken,
        accessToken: accessToken,
        expiresIn: expiresIn,
      );

      final isSignedIn = authService.isSignedIn;

      expect(isSignedIn, false);
    });

    test('should return true for isSignedIn if session is not expired', () {
      const idToken = 'idToken';
      const refreshToken = 'refreshToken';
      const accessToken = 'accessToken';

      authService.createSession(
        idToken: idToken,
        refreshToken: refreshToken,
        accessToken: accessToken,
      );

      final isSignedIn = authService.isSignedIn;

      expect(isSignedIn, true);
    });
  });
}
