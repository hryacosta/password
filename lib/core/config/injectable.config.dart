// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:password/core/config/register_module.dart' as _i478;
import 'package:password/core/services/app_database.dart' as _i48;
import 'package:password/data/datasources/auth_remote_datasource.dart' as _i406;
import 'package:password/data/datasources/password_local_datasource.dart'
    as _i493;
import 'package:password/data/datasources/space_remote_datasource.dart'
    as _i1028;
import 'package:password/domain/repositories/authentication_repository.dart'
    as _i601;
import 'package:password/domain/repositories/password_repository.dart' as _i544;
import 'package:password/domain/repositories/spaces_repository.dart' as _i446;
import 'package:password/domain/usecases/add_password.dart' as _i992;
import 'package:password/domain/usecases/add_space.dart' as _i847;
import 'package:password/domain/usecases/delete_space.dart' as _i903;
import 'package:password/domain/usecases/get_count_passwords.dart' as _i786;
import 'package:password/domain/usecases/get_spaces.dart' as _i565;
import 'package:password/domain/usecases/sign_in.dart' as _i210;
import 'package:password/domain/usecases/update_space.dart' as _i1070;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:uuid/uuid.dart' as _i706;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i706.Uuid>(() => registerModule.uuid);
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i48.AppDatabase>(() => registerModule.database);
  gh.singleton<_i361.Dio>(() => registerModule.dio);
  gh.factory<_i493.PasswordLocalDataSource>(
      () => _i493.PasswordLocalDataSource.from(
            uuid: gh<_i706.Uuid>(),
            database: gh<_i48.AppDatabase>(),
          ));
  gh.factory<_i1028.SpaceRemoteDataSource>(
      () => _i1028.SpaceRemoteDataSource.from(client: gh<_i361.Dio>()));
  gh.factory<_i406.AuthRemoteDataSource>(
      () => _i406.AuthRemoteDataSource.from(client: gh<_i361.Dio>()));
  gh.factory<_i544.PasswordRepository>(() => _i544.PasswordRepository.from(
      localDataSource: gh<_i493.PasswordLocalDataSource>()));
  gh.factory<_i601.AuthRepository>(() => _i601.AuthRepository.from(
      remoteDateSource: gh<_i406.AuthRemoteDataSource>()));
  gh.factory<_i446.SpaceRepository>(() => _i446.SpaceRepository.from(
      remoteDateSource: gh<_i1028.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i210.SignIn>(
      () => _i210.SignIn(gh<_i601.AuthRepository>()));
  gh.lazySingleton<_i992.AddPassword>(
      () => _i992.AddPassword(gh<_i544.PasswordRepository>()));
  gh.lazySingleton<_i786.GetCountPasswords>(
      () => _i786.GetCountPasswords(gh<_i544.PasswordRepository>()));
  gh.lazySingleton<_i847.AddSpace>(
      () => _i847.AddSpace(gh<_i446.SpaceRepository>()));
  gh.lazySingleton<_i565.GetSpaces>(
      () => _i565.GetSpaces(gh<_i446.SpaceRepository>()));
  gh.lazySingleton<_i903.DeleteSpaces>(
      () => _i903.DeleteSpaces(gh<_i446.SpaceRepository>()));
  gh.lazySingleton<_i1070.UpdateSpaces>(
      () => _i1070.UpdateSpaces(gh<_i446.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i478.RegisterModule {}
