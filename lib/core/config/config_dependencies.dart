import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:password/core/config/config_dependencies.config.dart';

/// Instance.
final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configDependencies() async => $initGetIt(sl);
