import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/src/client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:password/config/theme/custom.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/repositories/spaces_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockClient extends Mock implements ChopperClient {
  @override
  Authenticator? get authenticator => throw UnimplementedError();

  @override
  Uri get baseUrl => throw UnimplementedError();

  @override
  Converter? get converter => throw UnimplementedError();

  @override
  Future<Response<BodyType>> delete<BodyType, InnerType>(
    Uri url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  void dispose() {}

  @override
  ErrorConverter? get errorConverter => throw UnimplementedError();

  @override
  Future<Response<BodyType>> get<BodyType, InnerType>(
    Uri url, {
    Map<String, String> headers = const {},
    Uri? baseUrl,
    Map<String, dynamic> parameters = const {},
    body,
  }) {
    throw UnimplementedError();
  }

  @override
  ServiceType getService<ServiceType extends ChopperService>() {
    throw UnimplementedError();
  }

  @override
  Future<Response<BodyType>> head<BodyType, InnerType>(
    Uri url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  Client get httpClient => throw UnimplementedError();

  @override
  Stream<Request> get onRequest => throw UnimplementedError();

  @override
  Stream<Response> get onResponse => throw UnimplementedError();

  @override
  Future<Response<BodyType>> options<BodyType, InnerType>(
    Uri url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<BodyType>> patch<BodyType, InnerType>(
    Uri url, {
    body,
    List<PartValue> parts = const [],
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    bool multipart = false,
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<BodyType>> post<BodyType, InnerType>(
    Uri url, {
    body,
    List<PartValue> parts = const [],
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    bool multipart = false,
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<BodyType>> put<BodyType, InnerType>(
    Uri url, {
    body,
    List<PartValue> parts = const [],
    Map<String, String> headers = const {},
    Map<String, dynamic> parameters = const {},
    bool multipart = false,
    Uri? baseUrl,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<BodyType>> send<BodyType, InnerType>(
    Request request, {
    ConvertRequest? requestConverter,
    ConvertResponse? responseConverter,
  }) {
    throw UnimplementedError();
  }
}

@GenerateMocks([
  SpaceRepository,
  SpaceRemoteDataSource,
  SharedPreferences,
])
class TestWidget extends StatelessWidget {
  const TestWidget({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = $appTheme;

    return MaterialApp(
      theme: theme,
      // theme: baseTheme.copyWith(
      //   textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme),
      // ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      home: child,
    );
  }
}
