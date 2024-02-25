import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:password/core/services/authentication_service.dart';

class AppAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(
    Request request,
    // ignore: strict_raw_type
    Response response, [
    Request? originalRequest,
  ]) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      if (request.headers['Retry-Count'] != null) {
        return null;
      }
      final authService = AuthenticationService.getInstance();

      return applyHeaders(
        request,
        {
          HttpHeaders.authorizationHeader: authService.refreshToken,
          'Retry-Count': '1',
        },
      );
    }
    return null;
  }
}
