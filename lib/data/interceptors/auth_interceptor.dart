import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';
import 'package:password/data/services/auth_service.dart';

@immutable
class AuthenticatorInterceptor implements RequestInterceptor {
  factory AuthenticatorInterceptor() {
    return _instance;
  }

  factory AuthenticatorInterceptor.getInstance() {
    return _instance;
  }

  const AuthenticatorInterceptor._internal();

  static const AuthenticatorInterceptor _instance =
      AuthenticatorInterceptor._internal();

  @override
  FutureOr<Request> onRequest(Request request) {
    if (AuthenticationService.getInstance().isSignedIn) {
      return request.copyWith(
        headers: {
          ...request.headers,
          HttpHeaders.authorizationHeader:
              AuthenticationService.getInstance().authorizationToken,
        },
      );
    }
    // throw AuthenticationException('Not authenticated');
    return request;
  }
}
