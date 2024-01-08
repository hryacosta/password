import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/config/dependencies_config.config.dart';

/// Instance.
final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> dependenciesConfig() async => $initGetIt(sl);
