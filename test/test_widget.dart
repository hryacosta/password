import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:password/config/theme/light.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/data/datasources/space_remote_datasource.dart';
import 'package:password/domain/repositories/authentication_repository.dart';
import 'package:password/domain/repositories/spaces_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  SpaceRepository,
  SpaceRemoteDataSource,
  AuthRemoteDataSource,
  AuthRepository,
  SharedPreferences,
])
class TestWidget extends StatelessWidget {
  const TestWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = $lightTheme;

    return MaterialApp(
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      home: child,
    );
  }
}
