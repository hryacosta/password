import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/interceptors/auth_interceptor.dart';
import 'package:password/data/interceptors/authenticator.dart';

export 'package:chopper/src/response.dart';

ChopperClient createClient(
  http.Client httpClient,
) =>
    ChopperClient(
      baseUrl: apiBaseUrl,
      client: httpClient,
      authenticator: AppAuthenticator(),
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthenticatorInterceptor(),
        const HeadersInterceptor(
          {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
        ),
      ],
    );
