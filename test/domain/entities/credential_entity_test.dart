import 'package:flutter_test/flutter_test.dart';
import 'package:password/domain/entities/credential_entity.dart';

void main() {
  group('CredentialEntity', () {
    test('should have correct properties', () {
      const username = 'testUser';
      const password = 'testPassword';

      const credential =
          CredentialEntity(username: username, password: password);

      expect(credential.username, equals(username));
      expect(credential.password, equals(password));
    });

    test('should be equal both objects ', () {
      const username = 'testUser';
      const password = 'testPassword';

      const credential_2 =
          CredentialEntity(username: username, password: password);

      const credential_1 =
          CredentialEntity(username: username, password: password);

      expect(
        credential_1,
        credential_2,
      );
    });
  });
}
