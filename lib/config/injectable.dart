import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:password/config/injectable.config.dart';

/// Instance.
final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> injectableInit() async => $initGetIt(sl);
