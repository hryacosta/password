import 'package:chopper/chopper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:password/config/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  http.Client get client => http.Client();

  @lazySingleton
  ChopperClient get chopperClient => createClient(client);

  Connectivity get connectivity => Connectivity();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
