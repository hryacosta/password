// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i6;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/config/register_module.dart' as _i16;
import 'package:password/data/datasources/auth_remote_datasource.dart' as _i8;
import 'package:password/data/datasources/space_remote_datasource.dart' as _i7;
import 'package:password/domain/repositories/authentication_repository.dart'
    as _i9;
import 'package:password/domain/repositories/spaces_repository.dart' as _i10;
import 'package:password/domain/usecases/add_space.dart' as _i12;
import 'package:password/domain/usecases/delete_space.dart' as _i14;
import 'package:password/domain/usecases/get_spaces.dart' as _i13;
import 'package:password/domain/usecases/sign_in.dart' as _i11;
import 'package:password/domain/usecases/update_space.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
  gh.factory<_i3.Client>(() => registerModule.client);
  gh.factory<_i4.Connectivity>(() => registerModule.connectivity);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.ChopperClient>(() => registerModule.chopperClient);
  gh.factory<_i7.SpaceRemoteDataSource>(
      () => _i7.SpaceRemoteDataSource.create(gh<_i6.ChopperClient>()));
  gh.factory<_i8.AuthRemoteDataSource>(
      () => _i8.AuthRemoteDataSource.create(gh<_i6.ChopperClient>()));
  gh.factory<_i9.AuthRepository>(() => _i9.AuthRepository.from(
      remoteDateSource: gh<_i8.AuthRemoteDataSource>()));
  gh.factory<_i10.SpaceRepository>(() => _i10.SpaceRepository.from(
      remoteDateSource: gh<_i7.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i11.SignIn>(() => _i11.SignIn(gh<_i9.AuthRepository>()));
  gh.lazySingleton<_i12.AddSpace>(
      () => _i12.AddSpace(gh<_i10.SpaceRepository>()));
  gh.lazySingleton<_i13.GetSpaces>(
      () => _i13.GetSpaces(gh<_i10.SpaceRepository>()));
  gh.lazySingleton<_i14.DeleteSpaces>(
      () => _i14.DeleteSpaces(gh<_i10.SpaceRepository>()));
  gh.lazySingleton<_i15.UpdateSpaces>(
      () => _i15.UpdateSpaces(gh<_i10.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i16.RegisterModule {}
