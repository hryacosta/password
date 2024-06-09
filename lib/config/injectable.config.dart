// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/config/register_module.dart' as _i15;
import 'package:password/data/datasources/auth_remote_datasource.dart' as _i7;
import 'package:password/data/datasources/space_remote_datasource.dart' as _i6;
import 'package:password/domain/repositories/authentication_repository.dart'
    as _i8;
import 'package:password/domain/repositories/spaces_repository.dart' as _i9;
import 'package:password/domain/usecases/add_space.dart' as _i11;
import 'package:password/domain/usecases/delete_space.dart' as _i13;
import 'package:password/domain/usecases/get_spaces.dart' as _i12;
import 'package:password/domain/usecases/sign_in.dart' as _i10;
import 'package:password/domain/usecases/update_space.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

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
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i5.Dio>(() => registerModule.dio);
  gh.factory<_i6.SpaceRemoteDataSource>(
      () => _i6.SpaceRemoteDataSource.from(client: gh<_i5.Dio>()));
  gh.factory<_i7.AuthRemoteDataSource>(
      () => _i7.AuthRemoteDataSource.from(client: gh<_i5.Dio>()));
  gh.factory<_i8.AuthRepository>(() => _i8.AuthRepository.from(
      remoteDateSource: gh<_i7.AuthRemoteDataSource>()));
  gh.factory<_i9.SpaceRepository>(() => _i9.SpaceRepository.from(
      remoteDateSource: gh<_i6.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i10.SignIn>(() => _i10.SignIn(gh<_i8.AuthRepository>()));
  gh.lazySingleton<_i11.AddSpace>(
      () => _i11.AddSpace(gh<_i9.SpaceRepository>()));
  gh.lazySingleton<_i12.GetSpaces>(
      () => _i12.GetSpaces(gh<_i9.SpaceRepository>()));
  gh.lazySingleton<_i13.DeleteSpaces>(
      () => _i13.DeleteSpaces(gh<_i9.SpaceRepository>()));
  gh.lazySingleton<_i14.UpdateSpaces>(
      () => _i14.UpdateSpaces(gh<_i9.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
