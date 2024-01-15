// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/config/register_module.dart' as _i13;
import 'package:password/core/services/auth_service.dart' as _i3;
import 'package:password/data/datasources/spaces_remote_datasource.dart' as _i7;
import 'package:password/domain/repositories/spaces_repository.dart' as _i8;
import 'package:password/domain/usecases/add_space.dart' as _i10;
import 'package:password/domain/usecases/delete_space.dart' as _i11;
import 'package:password/domain/usecases/get_spaces.dart' as _i12;
import 'package:password/domain/usecases/update_space.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
  gh.singleton<_i3.AuthService>(
    _i3.AuthService(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i4.Client>(() => registerModule.client);
  gh.factory<_i5.Connectivity>(() => registerModule.connectivity);
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i7.SpaceRemoteDataSource>(
      () => _i7.SpaceRemoteDataSource.from(client: gh<_i4.Client>()));
  gh.factory<_i8.SpaceRepository>(() => _i8.SpaceRepository.from(
      remoteDateSource: gh<_i7.SpaceRemoteDataSource>()));
  gh.lazySingleton<_i9.UpdateSpaces>(
      () => _i9.UpdateSpaces(gh<_i8.SpaceRepository>()));
  gh.lazySingleton<_i10.AddSpace>(
      () => _i10.AddSpace(gh<_i8.SpaceRepository>()));
  gh.lazySingleton<_i11.DeleteSpaces>(
      () => _i11.DeleteSpaces(gh<_i8.SpaceRepository>()));
  gh.lazySingleton<_i12.GetSpaces>(
      () => _i12.GetSpaces(gh<_i8.SpaceRepository>()));
  return getIt;
}

class _$RegisterModule extends _i13.RegisterModule {}
