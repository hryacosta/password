// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:password/core/config/register_module_config.dart' as _i8;
import 'package:password/data/datasources/spaces_remote_datasource.dart' as _i6;
import 'package:password/domain/repositories/spaces_repository.dart' as _i7;
import 'package:password/domain/usecases/add_space.dart' as _i3;
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
  final configRegisterModule = _$ConfigRegisterModule();
  gh.lazySingleton<_i3.AddSpace>(() => _i3.AddSpace());
  gh.factory<_i4.Client>(() => configRegisterModule.client);
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => configRegisterModule.prefs,
    preResolve: true,
  );
  gh.factory<_i6.SpaceRemoteDataSource>(
      () => _i6.SpaceRemoteDataSource.from(client: gh<_i4.Client>()));
  gh.factory<_i7.SpaceRepository>(() => _i7.SpaceRepository.from(
      remoteDateSource: gh<_i6.SpaceRemoteDataSource>()));
  return getIt;
}

class _$ConfigRegisterModule extends _i8.ConfigRegisterModule {}
