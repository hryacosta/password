import 'package:flutter_test/flutter_test.dart';
import 'package:password/core/services/space_api.dart';

void main() {
  group('SpaceApi', () {
    test('baseUrl should return the correct base URL', () {
      final expectedBaseUrl = Uri(
        scheme: 'https',
        host: 'google.com',
        pathSegments: ['prod'],
      );

      expect(expectedBaseUrl.toString(), equals('https://google.com/prod'));
    });

    test('should return the correct instance', () {
      final spaceApi_2 = SpaceApi();

      expect(SpaceApi.getInstance(), isA<SpaceApi>());

      expect(SpaceApi.getInstance(), spaceApi_2);
    });

    test('should return the correct baseUrl', () {
      expect(SpaceApi().baseUrl().scheme, 'https');
    });

    test('should return the correct scheme', () {
      expect(SpaceApi().scheme, 'https');
    });

    test('should return the correct stage', () {
      expect(SpaceApi().stage, 'prod');
    });

    test('should return the correct login path', () {
      expect(SpaceApi.login, '/login');
    });

    test('should return the correct logout path', () {
      expect(SpaceApi.logout, '/logout');
    });

    test('should return the correct spaces path', () {
      expect(SpaceApi.spaces, '/spaces');
    });
  });
}
