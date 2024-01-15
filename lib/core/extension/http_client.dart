import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:password/config/injectable.dart';
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

  /// Sends an HTTP GET request with the given headers to the given URL.
  ///
  /// For more fine-grained control over the request, use [send] instead.
  ///
  /// Throws a [AuthenticationException] for all error codes.
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

  /// Sends an HTTP POST request with the given headers and body to the given
  /// URL.
  ///
  /// [body] sets the body of the request. It can be a [String], a [List<int>]
  /// or a [Map<String, String>].
  ///
  /// If [body] is a String, it's encoded using [encoding] and used as the body
  /// of the request. The content-type of the request will default to
  /// "text/plain".
  ///
  /// If [body] is a List, it's used as a list of bytes for the body of the
  /// request.
  ///
  /// If [body] is a Map, it's encoded as form fields using [encoding]. The
  /// content-type of the request will be set to
  /// `"application/x-www-form-urlencoded"`; this cannot be overridden.
  ///
  /// [encoding] defaults to [utf8].
  ///
  /// For more fine-grained control over the request, use [send] instead.
  ///
  /// Throws a [AuthenticationException] for all error codes.
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

  /// Sends an HTTP PUT request with the given headers and body to the given
  /// URL.
  ///
  /// [body] sets the body of the request. It can be a [String], a [List<int>]
  /// or a [Map<String, String>]. If it's a String, it's encoded using
  /// [encoding] and used as the body of the request. The content-type of the
  /// request will default to "text/plain".
  ///
  /// If [body] is a List, it's used as a list of bytes for the body of the
  /// request.
  ///
  /// If [body] is a Map, it's encoded as form fields using [encoding]. The
  /// content-type of the request will be set to
  /// `"application/x-www-form-urlencoded"`; this cannot be overridden.
  ///
  /// [encoding] defaults to [utf8].
  ///
  /// For more fine-grained control over the request, use [send] instead.
  ///
  /// Throws a [AuthenticationException] for all error codes.
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

  /// Sends an HTTP DELETE request with the given headers to the given URL.
  ///
  /// For more fine-grained control over the request, use [send] instead.
  ///
  /// Throws a [AuthenticationException] for all error codes.
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
