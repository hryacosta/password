// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/core/config/register_module.dart' as _i21;
import 'package:password/core/services/app_database.dart' as _i6;
import 'package:password/data/datasources/auth_remote_datasource.dart' as _i10;
import 'package:password/data/datasources/password_local_datasource.dart'
    as _i8;
import 'package:password/data/datasources/space_remote_datasource.dart' as _i9;
import 'package:password/domain/repositories/authentication_repository.dart'
    as _i12;
import 'package:password/domain/repositories/password_repository.dart' as _i11;
import 'package:password/domain/repositories/spaces_repository.dart' as _i13;
import 'package:password/domain/usecases/add_password.dart' as _i15;
import 'package:password/domain/usecases/add_space.dart' as _i17;
import 'package:password/domain/usecases/delete_space.dart' as _i19;
import 'package:password/domain/usecases/get_count_passwords.dart' as _i16;
import 'package:password/domain/usecases/get_spaces.dart' as _i18;
import 'package:password/domain/usecases/sign_in.dart' as _i14;
import 'package:password/domain/usecases/update_space.dart' as _i20;
import 'package:shared_preferences/shared_preferences.dart' as _i5;
import 'package:uuid/uuid.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i4.Uuid>(() => registerModule.uuid);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i6.AppDatabase>(() => registerModule.database);
  gh.singleton<_i7.Dio>(() => registerModule.dio);
  gh.factory<_i8.PasswordLocalDataSource>(
      () => _i8.PasswordLocalDataSource.from(
            uuid: gh<_i4.Uuid>(),
            database: gh<_i6.AppDatabase>(),
          ));
  gh.factory<_i9.SpaceRemoteDataSource>(
      () => _i9.SpaceRemoteDataSource.from(client: gh<_i7.Dio>()));
  gh.factory<_i10.AuthRemoteDataSource>(
      () => _i10.AuthRemoteDataSource.from(client: gh<_i7.Dio>()));
  gh.factory<_i11.PasswordRepository>(() => _i11.PasswordRepository.from(
      localDataSource: gh<_i8.PasswordLocalDataSource>()));
  gh.factory<_i12.AuthRepository>(() => _i12.AuthRepository.from(
      remoteDateSource: gh<_i10.AuthRemoteDataSource>()));
  gh.factory<_i13.SpaceRepository>(() => _i13.SpaceRepository.from(
      remoteDateSource: gh<_i9.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i14.SignIn>(() => _i14.SignIn(gh<_i12.AuthRepository>()));
  gh.lazySingleton<_i15.AddPassword>(
      () => _i15.AddPassword(gh<_i11.PasswordRepository>()));
  gh.lazySingleton<_i16.GetCountPasswords>(
      () => _i16.GetCountPasswords(gh<_i11.PasswordRepository>()));
  gh.lazySingleton<_i17.AddSpace>(
      () => _i17.AddSpace(gh<_i13.SpaceRepository>()));
  gh.lazySingleton<_i18.GetSpaces>(
      () => _i18.GetSpaces(gh<_i13.SpaceRepository>()));
  gh.lazySingleton<_i19.DeleteSpaces>(
      () => _i19.DeleteSpaces(gh<_i13.SpaceRepository>()));
  gh.lazySingleton<_i20.UpdateSpaces>(
      () => _i20.UpdateSpaces(gh<_i13.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i21.RegisterModule {}
