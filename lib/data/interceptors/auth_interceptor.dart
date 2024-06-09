import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/core/utils/logger.dart';

class AuthenticatorInterceptor implements InterceptorsWrapper {
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
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authService = AuthenticationService.getInstance();
    logger.d('AuthenticatorInterceptor onRequest: ${authService.isSignedIn}');
    if (authService.isSignedIn) {
      final headers = <String, String>{
        HttpHeaders.authorizationHeader: authService.authorizationToken,
      };

      options.headers.addEntries(headers.entries);
    }

    return handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.next(error);
  }

  @override
  // ignore: strict_raw_type
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
