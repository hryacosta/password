import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_api.dart';
import 'package:password/data/interceptors/auth_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: SpaceApi().baseUrl().toString(),
          headers: <String, String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      )..interceptors.add(AuthenticatorInterceptor());
}
