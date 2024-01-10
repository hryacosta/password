import 'package:flutter_test/flutter_test.dart';
import 'package:password/core/error/exception.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test('should handle server exception with custom error', () async {
    final error =
        ServerException.fromJson(fixtureMap('custom_server_error.json'));

    expect(error, isA<ServerException>());
    expect(error.message, 'error message');
    expect(error.toJson(), fixtureMap('custom_server_error.json'));
  });

  test('should handle network exception', () async {
    final error = NetworkException('error message', extra: 'extra message');

    expect(error, isA<NetworkException>());
    expect(error.message, 'error message');
  });

  test('should handle authentication exception', () async {
    final error =
        AuthenticationException('error message', extra: 'extra message');

    expect(error, isA<AuthenticationException>());
    expect(error.message, 'error message');
  });
}