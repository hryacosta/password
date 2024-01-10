import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/core/services/auth_service.dart';

extension Client on http.Client {
  bool get hasAuthorization {
    return sl<AuthService>().isSignedIn;
  }

  Map<String, String> get headerWithAuthorization {
    return {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      'authorization': sl<AuthService>().authorizationToken,
    };
  }

  Future<Response> getWithAuthCheck(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    if (hasAuthorization) {
      final headers0 = headers ?? {};
      return this.get(url, headers: {...headerWithAuthorization, ...headers0});
    }

    throw AuthenticationException('Not authenticated');
  }

  Future<Response> postWithAuthCheck(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    if (hasAuthorization) {
      final headers0 = headers ?? {};
      return this.post(
        url,
        headers: {...headerWithAuthorization, ...headers0},
        body: body,
        encoding: encoding,
      );
    }

    throw AuthenticationException('Not authenticated');
  }

  Future<Response> putWithAuthCheck(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (hasAuthorization) {
      final headers0 = headers ?? {};
      return this.put(
        url,
        headers: {...headerWithAuthorization, ...headers0},
        body: body,
        encoding: encoding,
      );
    }

    throw AuthenticationException('Not authenticated');
  }

  Future<Response> deleteWithAuthCheck(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (hasAuthorization) {
      final headers0 = headers ?? {};
      return this.delete(
        url,
        headers: {...headerWithAuthorization, ...headers0},
        body: body,
        encoding: encoding,
      );
    }

    throw AuthenticationException('Not authenticated');
  }
}
