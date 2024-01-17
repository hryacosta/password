// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i3;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/config/register_module.dart' as _i12;
import 'package:password/data/datasources/space_remote_datasource.dart' as _i6;
import 'package:password/domain/repositories/spaces_repository.dart' as _i7;
import 'package:password/domain/usecases/add_space.dart' as _i9;
import 'package:password/domain/usecases/delete_space.dart' as _i10;
import 'package:password/domain/usecases/get_spaces.dart' as _i11;
import 'package:password/domain/usecases/update_space.dart' as _i8;
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
  gh.lazySingleton<_i3.ChopperClient>(() => registerModule.client);
  gh.factory<_i4.Connectivity>(() => registerModule.connectivity);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i6.SpaceRemoteDataSource>(
      () => _i6.SpaceRemoteDataSource.create(gh<_i3.ChopperClient>()));
  gh.factory<_i7.SpaceRepository>(() => _i7.SpaceRepository.from(
      remoteDateSource: gh<_i6.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i8.UpdateSpaces>(
      () => _i8.UpdateSpaces(gh<_i7.SpaceRepository>()));
  gh.lazySingleton<_i9.AddSpace>(() => _i9.AddSpace(gh<_i7.SpaceRepository>()));
  gh.lazySingleton<_i10.DeleteSpaces>(
      () => _i10.DeleteSpaces(gh<_i7.SpaceRepository>()));
  gh.lazySingleton<_i11.GetSpaces>(
      () => _i11.GetSpaces(gh<_i7.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i12.RegisterModule {}
