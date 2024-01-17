import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/interceptors/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  http.Client get client => http.Client();

  @lazySingleton
  ChopperClient get chooperClient => ChopperClient(
        client: client,
        baseUrl: apiBaseUrl,
        interceptors: [
          HttpLoggingInterceptor,
          AuthenticatorInterceptor,
        ],
      );

  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
