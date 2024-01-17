import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/interceptors/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  ChopperClient get client => ChopperClient(
        baseUrl: apibaseUrl,
        interceptors: [
          HttpLoggingInterceptor,
          AuthenticatorInterceptor,
        ],
      );

  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
